package com.example.movie_management.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.api.R;
import lombok.Data;

import javax.annotation.Resource;
import java.io.Serializable;
import java.sql.Date;
import java.util.List;
import java.util.Map;

@Data
@TableName("movie")
public class Movie implements Serializable {

    @TableId
    private String src;
    private String movieName;
    private String belongToCinema;
    private double movieTime;
    private String director;
    private String starring;
    private String type;
    private Date showTime;
    private double rate;
    private String movieDetails;

    @TableField(exist = false)
    private List<Map<String,String>> belongToCinemaList;
    @TableField(exist = false)
    private List<String> dateList;
}
