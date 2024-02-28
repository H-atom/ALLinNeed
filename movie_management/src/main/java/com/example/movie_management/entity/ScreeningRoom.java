package com.example.movie_management.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Time;
import java.util.List;
import java.util.Map;


@Data
@TableName("screening_room")
public class ScreeningRoom implements Serializable {

    @TableId(type = IdType.AUTO)
    private Integer id;
    private String phone;
    private String screeningRoom;
    private Date startDate;
    private Date endDate;
    private Time startTime;
    private Time endTime;
    private String playMovie;
    private double ticketValue;
    private String seat;
    private int state;

    @TableField(exist = false)
    private int seatNumber;
    @TableField(exist = false)
    private double minValue;
    @TableField(exist = false)
    private List<Object> seatList;
}
