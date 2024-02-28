package com.example.movie_management.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.movie_management.entity.Cinema;
import com.example.movie_management.entity.Movie;
import com.example.movie_management.entity.tools.Response;
import com.example.movie_management.service.impl.cinemaServiceImpl;
import com.example.movie_management.service.impl.movieServiceImpl;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/cinema")
public class cinemaController {

    @Resource
    private cinemaServiceImpl cinemaService;
    @Resource
    private movieServiceImpl movieService;
    @RequestMapping("/setScreeningRoom")
    public Response setScreeningRoom(@RequestBody Map<String,String> userPhone){
        Response response=new Response();
        QueryWrapper<Cinema> queryWrapper=new QueryWrapper<>();
        queryWrapper.eq("manager",userPhone.get("phone"));
        Cinema cinema = cinemaService.getOne(queryWrapper);
        QueryWrapper<Movie> queryWrapper1=new QueryWrapper<>();
        queryWrapper1.eq("belong_to_cinema",cinema.getName());
        List<Movie> list = movieService.list(queryWrapper1);
        if (!list.isEmpty()){
            response.setData(list);
            response.setStatus(200);
        }else {
            response.setStatus(400);
            response.setStatusText("没有相关影片可供上映");
        }
        return response;
    }

    @RequestMapping("/getPhone")
    public Response getPhone(@RequestBody Map<String,String> map){
        Response response=new Response();
        QueryWrapper<Cinema> cinemaQueryWrapper=new QueryWrapper<>();
        cinemaQueryWrapper.eq("address",map.get("address"));
        Cinema cinema = cinemaService.getOne(cinemaQueryWrapper);
        if (cinema!=null){
            response.setStatus(200);
            response.setData(cinema.getPhone());
        }
        return response;
    }
}
