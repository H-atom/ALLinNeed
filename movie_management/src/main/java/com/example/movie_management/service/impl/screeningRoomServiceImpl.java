package com.example.movie_management.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.movie_management.entity.ScreeningRoom;
import com.example.movie_management.mapper.screeningRoomMapper;
import com.example.movie_management.service.screeningRoomService;
import org.springframework.stereotype.Service;

@Service
public class screeningRoomServiceImpl extends ServiceImpl<screeningRoomMapper, ScreeningRoom> implements screeningRoomService {
}
