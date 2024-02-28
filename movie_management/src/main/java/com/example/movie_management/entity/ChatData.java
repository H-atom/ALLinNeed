package com.example.movie_management.entity;

import com.alibaba.fastjson.JSONArray;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.sql.Timestamp;

@Data
@TableName("chat_data")
public class ChatData implements Serializable {

    @TableId
    private String fromPhone;
    private String toPhone;
    private String chatText;
    private String html;
    private Timestamp timestamp;
}
