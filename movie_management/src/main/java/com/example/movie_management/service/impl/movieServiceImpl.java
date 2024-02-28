package com.example.movie_management.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.movie_management.entity.Movie;
import com.example.movie_management.mapper.movieMapper;
import com.example.movie_management.service.movieService;
import org.springframework.stereotype.Service;

@Service
public class movieServiceImpl extends ServiceImpl<movieMapper, Movie> implements movieService {
}
