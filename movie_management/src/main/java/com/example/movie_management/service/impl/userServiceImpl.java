package com.example.movie_management.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.movie_management.entity.User;
import com.example.movie_management.mapper.userMapper;
import com.example.movie_management.service.userService;
import org.springframework.stereotype.Service;

@Service
public class userServiceImpl extends ServiceImpl<userMapper, User> implements userService {
}
