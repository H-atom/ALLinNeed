package com.example.movie_management.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Time;

@Data
@TableName("orders")
public class Orders implements Serializable {
    @TableId
    private String movie;
    private String cinema;
    private String address;
    private String buyer;
    private String screeningRoom;
    private Time startTime;
    private String seat;
    private Date startDate;
    private double ticketValue;
    private int state;

    @TableField(exist = false)
    private int seatNumber;

    @TableField(exist = false)
    private String phone;//客服电话
}
