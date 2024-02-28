package com.example.movie_management.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.movie_management.entity.ChatData;
import com.example.movie_management.mapper.chatDataMapper;
import com.example.movie_management.service.chatDataService;
import org.springframework.stereotype.Service;

@Service
public class chatDataServiceImpl extends ServiceImpl<chatDataMapper, ChatData> implements chatDataService {
}
