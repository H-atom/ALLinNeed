package com.example.movie_management.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.movie_management.entity.Orders;
import com.example.movie_management.mapper.ordersMapper;
import com.example.movie_management.service.ordersService;
import org.springframework.stereotype.Service;

@Service
public class ordersServiceImpl extends ServiceImpl<ordersMapper, Orders> implements ordersService {
}
