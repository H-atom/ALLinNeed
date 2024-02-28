package com.example.movie_management.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

@Data
@TableName("user_information")
public class User implements Serializable {

    @TableId
    private String phone;
    private String password;
    private String username;
    private int permissions;
    private double accountBalance;
}
