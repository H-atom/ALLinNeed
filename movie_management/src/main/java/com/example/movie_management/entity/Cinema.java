package com.example.movie_management.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

@Data
@TableName("cinema")
public class Cinema implements Serializable {
    @TableId
    private String address;
    private String name;
    private String phone;//影院客服电话
    private String manager;//经理电话
    private double rate;
    private String cinemaDetails;
}
