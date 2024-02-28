package com.example.movie_management.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.movie_management.entity.Cinema;
import com.example.movie_management.entity.Movie;
import com.example.movie_management.entity.Orders;
import com.example.movie_management.entity.tools.Response;
import com.example.movie_management.entity.ScreeningRoom;
import com.example.movie_management.entity.tools.TreeChildren;
import com.example.movie_management.service.impl.cinemaServiceImpl;
import com.example.movie_management.service.impl.movieServiceImpl;
import com.example.movie_management.service.impl.ordersServiceImpl;
import com.example.movie_management.service.impl.screeningRoomServiceImpl;
import lombok.Data;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.sql.Date;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.*;

@RestController
@RequestMapping("/screeningRoom")
public class screeningRoomController {

    @Resource
    private screeningRoomServiceImpl screeningRoomService;
    @Resource
    private movieServiceImpl movieService;
    @Resource
    private ordersServiceImpl ordersService;
    @Resource
    private cinemaServiceImpl cinemaService;

    @RequestMapping("/adjustRoom")
    public Response adjustRoom(@RequestBody Map<String,String> user){
        Response response=new Response();
        ArrayList<TreeChildren> arrayList=new ArrayList<>();
        QueryWrapper<ScreeningRoom> queryWrapper=new QueryWrapper<>();
        queryWrapper.select("distinct screening_room");
        queryWrapper.eq("phone",user.get("phone"));
        List<ScreeningRoom> room = screeningRoomService.list(queryWrapper);
        for (ScreeningRoom screeningRoom : room) {
            TreeChildren treeChildren=new TreeChildren();
            String room1 = screeningRoom.getScreeningRoom();
            QueryWrapper<ScreeningRoom> queryWrapper1=new QueryWrapper<>();
            queryWrapper1.select("distinct start_time, end_time, start_date, end_date, play_movie, ticket_value");
            queryWrapper1.eq("phone",user.get("phone"));
            queryWrapper1.eq("screening_room",room1);
            List<ScreeningRoom> time = screeningRoomService.list(queryWrapper1);
            treeChildren.setLabel(room1);
            treeChildren.setValue(true);
            treeChildren.setTreeNodeId(0);
            treeChildren.setData(time);
            ArrayList<TreeChildren> arrayList1=new ArrayList<>();
            for (ScreeningRoom value : time) {
                TreeChildren treeChildren1=new TreeChildren();
                treeChildren1.setLabel(value.getStartTime()+"-"+value.getEndTime());
                treeChildren1.setValue(true);
                treeChildren1.setTreeNodeId(-1);
                QueryWrapper<ScreeningRoom> queryWrapper2=new QueryWrapper<>();
                queryWrapper2.select("seat, state");
                queryWrapper2.eq("phone",user.get("phone"));
                queryWrapper2.eq("screening_room",room1);
                queryWrapper2.eq("start_time",value.getStartTime());
                List<ScreeningRoom> seat = screeningRoomService.list(queryWrapper2);
                ArrayList<Map<String,String>> mapArrayList=new ArrayList<>();
                ArrayList<Object> arrayList2=new ArrayList<>();
                int i=0;
                for (ScreeningRoom item :seat) {
                    i++;
                    Map<String,String> map=new HashMap<>();
                    map.put("label",item.getSeat());
                    map.put("state",item.getState()+"");
                    mapArrayList.add(map);
                    if (i==12){
                        i=0;
                        arrayList2.add(mapArrayList);
                        mapArrayList=new ArrayList<>();
                    }
                }
                treeChildren1.setData(arrayList2);
                arrayList1.add(treeChildren1);
            }
            treeChildren.setChildren(arrayList1);
            arrayList.add(treeChildren);
        }
        if (!arrayList.isEmpty()){
            response.setStatus(200);
            response.setData(arrayList);
        }
        return response;
    }

    @RequestMapping("/addData")
    public Response addData(@RequestBody Map<String,Object> map){
        Response response=new Response();
        int number=0;
        QueryWrapper<ScreeningRoom> queryWrapper=new QueryWrapper<>();
        queryWrapper.eq("phone",map.get("phone"));
        queryWrapper.eq("screening_room",map.get("screeningRoom"));
        ArrayList<String> date= (ArrayList<String>) map.get("date");
        ArrayList<String> time= (ArrayList<String>) map.get("time");
        queryWrapper.eq("start_time",Time.valueOf(time.get(0)));
        queryWrapper.eq("start_date",Date.valueOf(date.get(0)));
        queryWrapper.eq("play_movie",(String)map.get("movie"));
        QueryWrapper<ScreeningRoom> screeningRoomQueryWrapper=new QueryWrapper<>();
        screeningRoomQueryWrapper.eq("phone",map.get("phone"));
        screeningRoomQueryWrapper.eq("screening_room",map.get("screeningRoom"));
        List<ScreeningRoom> list = screeningRoomService.list(queryWrapper);
        List<ScreeningRoom> list1 = screeningRoomService.list(screeningRoomQueryWrapper);
        boolean dataIsNull=list.isEmpty();
        int sort=0;
        if (!dataIsNull){
            sort=list.get(0).getId();
        }
        ArrayList<Object> arrayList= (ArrayList<Object>) map.get("dataList");
        for (int i = 0; i < 12; i++) {
            ArrayList<Map<String,String>> arrayList1= (ArrayList<Map<String, String>>) arrayList.get(i);
            for (int j = 0; j < 12; j++) {
                ScreeningRoom screeningRoom=new ScreeningRoom();
                screeningRoom.setPhone((String) map.get("phone"));
                screeningRoom.setScreeningRoom((String) map.get("screeningRoom"));
                screeningRoom.setTicketValue(Double.parseDouble(map.get("ticketValue") + ""));
                screeningRoom.setPlayMovie((String) map.get("movie"));
                screeningRoom.setStartDate(Date.valueOf(date.get(0)));
                screeningRoom.setEndDate(Date.valueOf(date.get(1)));
                screeningRoom.setStartTime(Time.valueOf(time.get(0)));
                screeningRoom.setEndTime(Time.valueOf(time.get(1)));
                screeningRoom.setSeat(arrayList1.get(j).get("label"));
                screeningRoom.setState(Integer.parseInt(String.valueOf(arrayList1.get(j).get("state"))));
                if (list1.isEmpty()){
                    screeningRoomService.save(screeningRoom);
                    number=1;
                }else {
                    boolean update = screeningRoomService.update(screeningRoom, new QueryWrapper<ScreeningRoom>().eq("id", sort + 12 * i + j));
                    number=2;
                }
            }
        }
        response.setStatus(200);
        if (number==1){
            response.setStatusText("设置成功");
        }else {
            response.setStatusText("修改成功");
        }
        return response;
    }

    @RequestMapping("/deleteData")
    public Response deleteData(@RequestBody Map<String,String> map){
        Response response=new Response();
        QueryWrapper<ScreeningRoom> queryWrapper=new QueryWrapper<>();
        queryWrapper.eq("phone",map.get("phone"));
        queryWrapper.eq("screening_room",map.get("screeningRoom"));
        if (map.get("time")!=null){
            String[] time=map.get("time").split("-");
            queryWrapper.eq("start_time",Time.valueOf(time[0]));
        }
        boolean remove = screeningRoomService.remove(queryWrapper);
        if (remove){
            response.setStatus(200);
            response.setStatusText("删除成功");
        }else {
            response.setStatus(400);
            response.setStatusText("删除失败");
        }
        return response;
    }

    @RequestMapping("/chartsData")
    public Response chartsData(@RequestBody Map<String,String> map){
        Response response=new Response();
        ArrayList<Object> arrayList=new ArrayList<>();
        QueryWrapper<ScreeningRoom> queryWrapper=new QueryWrapper<>();
        queryWrapper.select("play_movie, count(seat) as seatNumber");
        queryWrapper.eq("phone",map.get("phone"));
        queryWrapper.eq("state",1);
        queryWrapper.groupBy("play_movie");
        List<ScreeningRoom> list = screeningRoomService.list(queryWrapper);
        for (ScreeningRoom movieList :list) {
            Map<String,Object> movieMap=new HashMap<>();
            List<Movie> movieSrc = movieService.list(new QueryWrapper<Movie>().eq("movie_name", movieList.getPlayMovie()));
            movieMap.put("movieSrc",movieSrc.get(0).getSrc());
            QueryWrapper<Cinema> cinemaQueryWrapper=new QueryWrapper<>();
            cinemaQueryWrapper.eq("manager",map.get("phone"));
            Cinema cinema = cinemaService.getOne(cinemaQueryWrapper);
            QueryWrapper<Orders> queryWrapper1=new QueryWrapper<>();
            queryWrapper1.eq("movie",movieList.getPlayMovie());
            queryWrapper1.eq("address",cinema.getAddress());
            List<Orders> orderList = ordersService.list(queryWrapper1);
            int orderNumber=0;
            double sumValue=0;
            for (Orders order : orderList) {
                orderNumber++;
                sumValue+=order.getTicketValue();
            }
            double orderRate=(double) orderNumber/movieList.getSeatNumber()*100;
            movieMap.put("orderSum",orderNumber);
            movieMap.put("orderRate",String.format("%.1f",orderRate)+"%");
            movieMap.put("boxOffice",sumValue);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            ArrayList<Map> orderArrayList=new ArrayList<>();
            for (int i = -5; i <0 ; i++) {
                Calendar c = Calendar.getInstance();
                Map<String,Object> orderMap=new HashMap<>();
                QueryWrapper<ScreeningRoom> screeningRoomQueryWrapper=new QueryWrapper<>();
                screeningRoomQueryWrapper.select("count(seat) as seatNumber, start_date, end_date");
                screeningRoomQueryWrapper.eq("play_movie",movieList.getPlayMovie());
                screeningRoomQueryWrapper.eq("phone",map.get("phone"));
                screeningRoomQueryWrapper.eq("state",1);
                screeningRoomQueryWrapper.groupBy("start_date, end_date");
                List<ScreeningRoom> dateList = screeningRoomService.list(screeningRoomQueryWrapper);
                c.add(Calendar.DATE,i);
                java.util.Date time = c.getTime();
                String preDay = sdf.format(time);
                Date preDate=Date.valueOf(preDay);
                int number=0;
                for (ScreeningRoom date : dateList) {
                    if (preDate.after(date.getStartDate())&&preDate.before(date.getEndDate())){
                        number+=date.getSeatNumber();
                    }
                }
                orderMap.put("date",preDate);
                orderMap.put("PV",number);
                    QueryWrapper<Orders> ordersQueryWrapper=new QueryWrapper<>();
                    ordersQueryWrapper.select("count(seat) as seatNumber");
                    ordersQueryWrapper.eq("movie",movieList.getPlayMovie());
                    ordersQueryWrapper.eq("address",cinema.getAddress());
                    ordersQueryWrapper.eq("start_date",preDate);
                    int seatNumber=0;
                    Orders one = ordersService.getOne(ordersQueryWrapper);
                    if (one!=null){
                        seatNumber=one.getSeatNumber();
                    }
                    orderMap.put("Order",seatNumber);
                    orderMap.put("OrderRate",Double.parseDouble(String.format("%.2f",(double)seatNumber/number)));
                    orderArrayList.add(orderMap);
            }
            movieMap.put("rows",orderArrayList);
            arrayList.add(movieMap);
        }
        if (!arrayList.isEmpty()){
            response.setData(arrayList);
            response.setStatus(200);
        }else {
            response.setStatus(400);
        }
        return response;
    }

    @RequestMapping("/buyingScreeningRoom")
    public Response buyingScreeningRoom(@RequestBody Map<String,String> map){
        Response response=new Response();
        QueryWrapper<Cinema> cinemaQueryWrapper=new QueryWrapper<>();
        cinemaQueryWrapper.eq("name",map.get("cinema"));
        cinemaQueryWrapper.eq("address",map.get("address"));
        Cinema cinema = cinemaService.getOne(cinemaQueryWrapper);
        String phone=cinema.getManager();
        Date date=Date.valueOf(map.get("movieDate"));
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat sdfT=new SimpleDateFormat("HH:mm:ss");
        Calendar c = Calendar.getInstance();
        Calendar d = Calendar.getInstance();
        c.add(Calendar.DATE,0);
        d.add(Calendar.DATE,0);
        java.util.Date time = c.getTime();
        java.util.Date timeD = d.getTime();
        String date1 = sdf.format(time);
        String day = sdfT.format(timeD);
        Date preDate=Date.valueOf(date1);
        Time preDay=Time.valueOf(day);
        QueryWrapper<ScreeningRoom> screeningRoomQueryWrapper=new QueryWrapper<>();
        screeningRoomQueryWrapper.select("distinct screening_room, start_date, end_date, start_time, end_time, ticket_value");
        screeningRoomQueryWrapper.eq("phone",phone);
        screeningRoomQueryWrapper.eq("play_movie",map.get("movieName"));
        screeningRoomQueryWrapper.le("start_date",date);
        screeningRoomQueryWrapper.ge("end_date",date);
        if (preDate.equals(date)){
            screeningRoomQueryWrapper.ge("start_time",preDay);
        }
        List<ScreeningRoom> screeningRoomList = screeningRoomService.list(screeningRoomQueryWrapper);
        for (ScreeningRoom screeningRoom: screeningRoomList) {
            QueryWrapper<ScreeningRoom> screeningRoomQueryWrapper1=new QueryWrapper<>();
            screeningRoomQueryWrapper1.eq("phone",phone);
            screeningRoomQueryWrapper1.eq("play_movie",map.get("movieName"));
            screeningRoomQueryWrapper1.eq("screening_room",screeningRoom.getScreeningRoom());
            screeningRoomQueryWrapper1.eq("start_date",screeningRoom.getStartDate());
            screeningRoomQueryWrapper1.eq("end_date",screeningRoom.getEndDate());
            screeningRoomQueryWrapper1.eq("start_time",screeningRoom.getStartTime());
            screeningRoomQueryWrapper1.eq("end_time",screeningRoom.getEndTime());
            screeningRoomQueryWrapper1.eq("ticket_value",screeningRoom.getTicketValue());
            List<ScreeningRoom> roomList = screeningRoomService.list(screeningRoomQueryWrapper1);
            List<Map<String,String>> seatList=new ArrayList<>();
            ArrayList<Object> seat=new ArrayList<>();
            int i=0;
            for (ScreeningRoom one: roomList) {
                i++;
                Map<String,String> roomMap=new HashMap<>();
                QueryWrapper<Orders> ordersQueryWrapper=new QueryWrapper<>();
                ordersQueryWrapper.eq("movie",one.getPlayMovie());
                ordersQueryWrapper.eq("address",map.get("address"));
                ordersQueryWrapper.eq("screening_room",one.getScreeningRoom());
                ordersQueryWrapper.eq("start_date",date);
                ordersQueryWrapper.eq("start_time",one.getStartTime());
                ordersQueryWrapper.eq("seat",one.getSeat());
                if (ordersService.getOne(ordersQueryWrapper)!=null) one.setState(2);
                roomMap.put("seat",one.getSeat());
                roomMap.put("state",one.getState()+"");
                seatList.add(roomMap);
                if (i==12){
                    i=0;
                    seat.add(seatList);
                    seatList=new ArrayList<>();
                }
            }
            screeningRoom.setSeatList(seat);
        }
        if (!screeningRoomList.isEmpty()){
            response.setStatus(200);
            response.setData(screeningRoomList);
        }else {
            response.setStatus(400);
        }
        return response;
    }
}

