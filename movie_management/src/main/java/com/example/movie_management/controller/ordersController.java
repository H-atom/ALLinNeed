package com.example.movie_management.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.movie_management.entity.Cinema;
import com.example.movie_management.entity.Orders;
import com.example.movie_management.entity.ScreeningRoom;
import com.example.movie_management.entity.User;
import com.example.movie_management.entity.tools.Response;
import com.example.movie_management.service.impl.cinemaServiceImpl;
import com.example.movie_management.service.impl.ordersServiceImpl;
import com.example.movie_management.service.impl.screeningRoomServiceImpl;
import com.example.movie_management.service.impl.userServiceImpl;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.sql.Date;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.*;

@RestController
@RequestMapping("/orders")
public class ordersController {

    @Resource
    private ordersServiceImpl ordersService;
    @Resource
    private cinemaServiceImpl cinemaService;
    @Resource
    private userServiceImpl userService;
    @Resource
    private screeningRoomServiceImpl screeningRoomService;

    @RequestMapping("/ordersInformation")
    public Response ordersInformation(@RequestBody Map<String,String> map){
        Response response=new Response();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat sdfT=new SimpleDateFormat("HH:mm:ss");
        Calendar c = Calendar.getInstance();
        Calendar d = Calendar.getInstance();
        c.add(Calendar.DATE,0);
        d.add(Calendar.DATE,0);
        java.util.Date time = c.getTime();
        java.util.Date timeD = d.getTime();
        String date = sdf.format(time);
        String day = sdfT.format(timeD);
        Date preDate=Date.valueOf(date);
        Time preDay=Time.valueOf(day);
        QueryWrapper<Orders> queryWrapper=new QueryWrapper<>();
        queryWrapper.eq("buyer",map.get("phone"));
        queryWrapper.ge("start_date",preDate);
//        queryWrapper.eq("state",2);
//        queryWrapper.ge("start_time",preDay);
        List<Orders> ordersList = ordersService.list(queryWrapper);
        ordersList.removeIf(order ->order.getStartDate().equals(preDate)&&order.getStartTime().before(preDay));
        ordersList.forEach(item->{
            QueryWrapper<Cinema> cinemaQueryWrapper=new QueryWrapper<>();
            cinemaQueryWrapper.eq("address",item.getAddress());
            cinemaQueryWrapper.eq("name",item.getCinema());
            Cinema cinema = cinemaService.getOne(cinemaQueryWrapper);
            item.setPhone(cinema.getPhone());
            QueryWrapper<ScreeningRoom> screeningRoomQueryWrapper=new QueryWrapper<>();
            screeningRoomQueryWrapper.eq("phone",cinema.getManager());
            screeningRoomQueryWrapper.eq("screening_room",item.getScreeningRoom());
            screeningRoomQueryWrapper.eq("start_time",item.getStartTime());
            screeningRoomQueryWrapper.ge("end_date",item.getStartDate());
            screeningRoomQueryWrapper.le("start_date",item.getStartDate());
            screeningRoomQueryWrapper.eq("seat",item.getSeat());
            screeningRoomQueryWrapper.ne("state",-1);
            screeningRoomQueryWrapper.eq("play_movie",item.getMovie());
            screeningRoomQueryWrapper.eq("ticket_value",item.getTicketValue());
            ScreeningRoom screeningRoom = screeningRoomService.getOne(screeningRoomQueryWrapper);
            if (screeningRoom==null){
                item.setState(-1);
                ordersService.update(item,new QueryWrapper<>(item));
                QueryWrapper<User> userQueryWrapper=new QueryWrapper<>();
                userQueryWrapper.eq("phone",cinema.getPhone());
                User one = userService.getOne(userQueryWrapper);
                double v = one.getAccountBalance() - item.getTicketValue();
                one.setAccountBalance(v);
                userService.update(one,userQueryWrapper);
                QueryWrapper<User> userQueryWrapper1=new QueryWrapper<>();
                userQueryWrapper1.eq("phone",map.get("phone"));
                User two = userService.getOne(userQueryWrapper1);
                double v1 = two.getAccountBalance() + item.getTicketValue();
                two.setAccountBalance(v1);
                userService.update(two,userQueryWrapper1);
            }
        });
        if (!ordersList.isEmpty()){
            response.setStatus(200);
            response.setData(ordersList);
        }
        return response;
    }

    @RequestMapping("/getInformation")
    public Response getInformation(@RequestBody Map<String,String> map){
        Response response=new Response();
        QueryWrapper<Cinema> cinemaQueryWrapper=new QueryWrapper<>();
        cinemaQueryWrapper.eq("manager",map.get("phone"));
        Cinema cinema = cinemaService.getOne(cinemaQueryWrapper);
        QueryWrapper<Orders> ordersQueryWrapper=new QueryWrapper<>();
        ordersQueryWrapper.eq("address",cinema.getAddress());
        ordersQueryWrapper.eq("cinema",cinema.getName());
        ordersQueryWrapper.eq("state",2).or().eq("state",-2);
        List<Orders> ordersList = ordersService.list(ordersQueryWrapper);
        QueryWrapper<Orders> ordersQueryWrapper1=new QueryWrapper<>();
        ordersQueryWrapper1.select("distinct movie, screening_room, start_date, start_time, ticket_value");
        ordersQueryWrapper1.eq("address",cinema.getAddress());
        ordersQueryWrapper1.eq("cinema",cinema.getName());
        ordersQueryWrapper1.eq("state",-1);
        List<Orders> list = ordersService.list(ordersQueryWrapper1);
        ordersList.addAll(list);
        if (!ordersList.isEmpty()){
            response.setStatus(200);
            response.setData(ordersList);
        }
        return response;
    }

    @RequestMapping("/addOrders")
    public Response addOrders(@RequestBody Map<String,Object> map){
        Response response=new Response();
        List<String> seatList = (List<String>)map.get("seatList");
        QueryWrapper<Orders> ordersQueryWrapper=new QueryWrapper<>();
        ordersQueryWrapper.eq("movie",map.get("movieName"));
        ordersQueryWrapper.eq("cinema",map.get("cinema"));
        ordersQueryWrapper.eq("address",map.get("address"));
        ordersQueryWrapper.eq("buyer",map.get("phone"));
        ordersQueryWrapper.eq("screening_room",map.get("screeningRoom"));
        ordersQueryWrapper.eq("start_date",map.get("startDate"));
        ordersQueryWrapper.eq("start_time",map.get("startTime"));
        ordersQueryWrapper.ne("state",-1);
        ArrayList<String> arrayList=new ArrayList<>();
        for (String seat: seatList) {
            ordersQueryWrapper.eq("seat",seat);
            if (ordersService.getOne(ordersQueryWrapper)!=null){
                arrayList.add(seat);
            }
        }
        if (arrayList.isEmpty()){
            for (String seat: seatList) {
                Orders order=new Orders();
                order.setCinema((String) map.get("cinema"));
                order.setAddress((String) map.get("address"));
                order.setBuyer((String) map.get("phone"));
                order.setMovie((String) map.get("movieName"));
                order.setScreeningRoom((String) map.get("screeningRoom"));
                order.setStartDate(Date.valueOf((String) map.get("startDate")));
                order.setStartTime(Time.valueOf((String) map.get("startTime")));
                order.setTicketValue(Double.parseDouble((String) map.get("ticketValue")));
                order.setSeat(seat);
                order.setState(0);
                ordersService.save(order);
            }
            response.setStatus(200);
        }else {
            response.setStatus(400);
            response.setData(arrayList);
        }
        return response;
    }

    @RequestMapping("/isPaying")
    public Response isPaying(@RequestBody Map<String,String> map){
        Response response=new Response();
        QueryWrapper<Orders> ordersQueryWrapper=new QueryWrapper<>();
        ordersQueryWrapper.eq("buyer",map.get("phone"));
        ordersQueryWrapper.eq("movie",map.get("movieName"));
        ordersQueryWrapper.eq("cinema",map.get("cinema"));
        ordersQueryWrapper.eq("address",map.get("address"));
        ordersQueryWrapper.eq("screening_room",map.get("screeningRoom"));
        ordersQueryWrapper.eq("start_date",map.get("startDate"));
        ordersQueryWrapper.eq("start_time",map.get("startTime"));
        List<Orders> ordersList = ordersService.list(ordersQueryWrapper);
        User one = userService.getOne(new QueryWrapper<User>().eq("phone", map.get("phone")));
        double buyer=one.getAccountBalance();
        QueryWrapper<Cinema> cinemaQueryWrapper=new QueryWrapper<>();
        cinemaQueryWrapper.eq("address",map.get("address"));
        cinemaQueryWrapper.eq("name",map.get("cinema"));
        String phone=cinemaService.getOne(cinemaQueryWrapper).getManager();
        User two = userService.getOne(new QueryWrapper<User>().eq("phone", phone));
        double manager=two.getAccountBalance();
        int number=0;
        for (Orders order: ordersList) {
            QueryWrapper<Orders> ordersQueryWrapper1=new QueryWrapper<>();
            ordersQueryWrapper1.eq("buyer",map.get("phone"));
            ordersQueryWrapper1.eq("movie",map.get("movieName"));
            ordersQueryWrapper1.eq("cinema",map.get("cinema"));
            ordersQueryWrapper1.eq("address",map.get("address"));
            ordersQueryWrapper1.eq("screening_room",map.get("screeningRoom"));
            ordersQueryWrapper1.eq("start_date",map.get("startDate"));
            ordersQueryWrapper1.eq("start_time",map.get("startTime"));
            ordersQueryWrapper1.eq("seat",order.getSeat());
            ordersQueryWrapper1.ne("state",2);
            if (order.getState()==0){
                one.setAccountBalance(buyer-order.getTicketValue());
                boolean update = userService.update(one, new QueryWrapper<User>().eq("phone", map.get("phone")));
                if (update){
                    order.setState(1);
                    boolean update2 = ordersService.update(order, ordersQueryWrapper1);
                    two.setAccountBalance(manager+order.getTicketValue());
                    boolean update1 = userService.update(two, new QueryWrapper<User>().eq("phone", phone));
                    if (update1){
                        order.setState(2);
                        boolean update3 = ordersService.update(order, ordersQueryWrapper1);
                        number++;
                    }
                }
            }else if (order.getState()==1){
                two.setAccountBalance(manager+order.getTicketValue());
                boolean update1 = userService.update(two, new QueryWrapper<User>().eq("phone", phone));
                if (update1){
                    order.setState(2);
                    ordersService.update(order,ordersQueryWrapper1);
                    number++;
                }
            }
        }

        if (number==0){
            response.setStatus(200);
            response.setStatusText("支付成功");
        }else {
            response.setStatus(201);
        }
        return response;
    }

    @RequestMapping("/removeOrders")
    public Response removeOrders(@RequestBody Map<String,String> map){
        Response response=new Response();
        QueryWrapper<Orders> queryWrapper=new QueryWrapper<>();
        queryWrapper.eq("buyer",map.get("phone"));
        queryWrapper.eq("movie",map.get("movieName"));
        queryWrapper.eq("cinema",map.get("cinema"));
        queryWrapper.eq("address",map.get("address"));
        queryWrapper.eq("screening_room",map.get("screeningRoom"));
        queryWrapper.eq("start_date",map.get("startDate"));
        queryWrapper.eq("start_time",map.get("startTime"));
        queryWrapper.eq("seat",map.get("seat"));
        QueryWrapper<Cinema> cinemaQueryWrapper=new QueryWrapper<>();
        cinemaQueryWrapper.eq("name",map.get("cinema"));
        cinemaQueryWrapper.eq("address",map.get("address"));
        String phone=cinemaService.getOne(cinemaQueryWrapper).getManager();
        User one = userService.getOne(new QueryWrapper<User>().eq("phone", map.get("phone")));
        User two = userService.getOne(new QueryWrapper<User>().eq("phone", phone));
        Orders order = ordersService.getOne(queryWrapper);
        if (order.getState()==2){
            two.setAccountBalance(two.getAccountBalance()-order.getTicketValue());
            boolean update = userService.update(two, new QueryWrapper<User>().eq("phone", phone));
            if (update){
                order.setState(1);
                ordersService.update(order,queryWrapper);
                one.setAccountBalance(one.getAccountBalance()+order.getTicketValue());
                boolean update1 = userService.update(one, new QueryWrapper<User>().eq("phone", map.get("phone")));
                if (update1){
                    order.setState(0);
                    ordersService.update(order,queryWrapper);
                }
            }
        }else if (order.getState()==1){
            one.setAccountBalance(one.getAccountBalance()+order.getTicketValue());
            boolean update1=userService.update(one,new QueryWrapper<User>().eq("phone",map.get("phone")));
            if (update1){
                order.setState(0);
                ordersService.update(order,queryWrapper);
            }
        }else {
            order.setState(-2);
            ordersService.update(order,queryWrapper);
            response.setStatus(200);
            response.setStatusText("退款成功");
        }
        return response;
    }

}
