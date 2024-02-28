package com.example.movie_management.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.movie_management.entity.Cinema;
import com.example.movie_management.entity.Movie;
import com.example.movie_management.entity.ScreeningRoom;
import com.example.movie_management.entity.tools.Response;
import com.example.movie_management.service.impl.cinemaServiceImpl;
import com.example.movie_management.service.impl.movieServiceImpl;
import com.example.movie_management.service.impl.screeningRoomServiceImpl;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.*;

@RestController
@RequestMapping("/movie")
public class movieController {

    @Resource
    private movieServiceImpl movieService;
    @Resource
    private screeningRoomServiceImpl screeningRoomService;
    @Resource
    private cinemaServiceImpl cinemaService;

    @RequestMapping("/movieData")
    public Response movieData(@RequestBody Map<String,String> map){
        Response response=new Response();
        QueryWrapper<Movie> queryWrapper=new QueryWrapper<>();
        queryWrapper.eq("is_showing",1);
        queryWrapper.groupBy("movie_name");
        List<Movie> list = movieService.list(queryWrapper);
        for (Movie movie : list) {
            QueryWrapper<Movie> queryWrapper1 = new QueryWrapper<>();
            queryWrapper1.select("belong_to_cinema");
            queryWrapper1.eq("movie_name", movie.getMovieName());
            List<Map<String,String>> list1=new ArrayList<>();
            for (Movie i : movieService.list(queryWrapper1)) {
                QueryWrapper<Cinema> cinemaQueryWrapper=new QueryWrapper<>();
                cinemaQueryWrapper.eq("name",i.getBelongToCinema());
                cinemaQueryWrapper.like("address",map.get("address"));
                for (Cinema cinema:cinemaService.list(cinemaQueryWrapper)) {
                    Map<String,String> cinemaMap=new HashMap<>();
                    QueryWrapper<ScreeningRoom> screeningRoomQueryWrapper=new QueryWrapper<>();
                    screeningRoomQueryWrapper.select("min(ticket_value) as minValue");
                    screeningRoomQueryWrapper.eq("phone",cinema.getManager());
                    screeningRoomQueryWrapper.eq("play_movie",movie.getMovieName());
                    ScreeningRoom screeningRoom = screeningRoomService.getOne(screeningRoomQueryWrapper);
                    cinemaMap.put("cinema",cinema.getName());
                    cinemaMap.put("address",cinema.getAddress());
                    if (screeningRoom!=null){
                        cinemaMap.put("value",screeningRoom.getMinValue()+"");
                        list1.add(cinemaMap);
                    }
                }
            }
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            List<String> list2=new ArrayList<>();
            for (int i = 0; i < 5; i++) {
                Calendar c = Calendar.getInstance();
                c.add(Calendar.DATE,i);
                java.util.Date time = c.getTime();
                String preDay = sdf.format(time);
                Date preDate=Date.valueOf(preDay);
                QueryWrapper<ScreeningRoom> queryWrapper2=new QueryWrapper<>();
                queryWrapper2.eq("play_movie",movie.getMovieName());
                queryWrapper2.groupBy("start_date, end_date");
                for (ScreeningRoom screeningRoom: screeningRoomService.list(queryWrapper2)) {
                    if (preDate.after(screeningRoom.getStartDate())&&preDate.before(screeningRoom.getEndDate())){
                        list2.add(preDay);
                        break;
                    }
                }
            }
            movie.setBelongToCinemaList(list1);
            movie.setDateList(list2);
        }
        response.setData(list);
        return response;
    }
}
