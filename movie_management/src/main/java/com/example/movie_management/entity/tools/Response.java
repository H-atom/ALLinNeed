package com.example.movie_management.entity.tools;

import lombok.Data;

@Data
public class Response {
    private Object data;
    private int status;
    private String statusText;
}
