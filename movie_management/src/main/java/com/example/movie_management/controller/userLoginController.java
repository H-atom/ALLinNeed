package com.example.movie_management.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.movie_management.entity.tools.Response;
import com.example.movie_management.entity.User;
import com.example.movie_management.service.impl.userServiceImpl;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.Map;

@RestController
@RequestMapping("/user")
public class userLoginController {

    @Resource
    private userServiceImpl userService;

    @RequestMapping("/login")
    public Response login(@RequestBody User userInformation){
        Response response=new Response();
        User user=new User();
        QueryWrapper<User> queryWrapper=new QueryWrapper<>();
        queryWrapper.eq("phone",userInformation.getPhone());
        queryWrapper.eq("password",userInformation.getPassword());
        User one = userService.getOne(queryWrapper);
        if (one!=null){
            user=one;
            response.setStatus(200);
            response.setStatusText("登陆成功");
        }else {
            response.setStatus(500);
            response.setStatusText("用户名或密码错误，请重新登录");
        }
        response.setData(user);
        return response;
    }

    @RequestMapping("/register")
    public boolean register(@RequestBody Map<String,String> map){
        QueryWrapper<User> queryWrapper=new QueryWrapper<>();
        queryWrapper.eq("phone",map.get("phone"));
        User one = userService.getOne(queryWrapper);
        User user=new User();
        if (one==null){
            user.setPhone(map.get("phone"));
            user.setUsername(map.get("username"));
            user.setPassword(map.get("password"));
            user.setPermissions(0);
            userService.save(user);
            return true;
        }
        return false;
    }
}
