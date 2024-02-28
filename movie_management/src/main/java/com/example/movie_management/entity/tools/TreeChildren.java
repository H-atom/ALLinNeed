package com.example.movie_management.entity.tools;

import lombok.Data;

@Data
public class TreeChildren {

    private String label;
    private boolean value;
    private int treeNodeId;
    private Object children;
    private Object data;
}
