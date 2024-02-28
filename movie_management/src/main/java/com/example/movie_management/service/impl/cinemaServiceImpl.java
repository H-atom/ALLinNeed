package com.example.movie_management.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.movie_management.entity.Cinema;
import com.example.movie_management.mapper.cinemaMapper;
import com.example.movie_management.service.cinemaService;
import org.springframework.stereotype.Service;

@Service
public class cinemaServiceImpl extends ServiceImpl<cinemaMapper, Cinema> implements cinemaService {
}
