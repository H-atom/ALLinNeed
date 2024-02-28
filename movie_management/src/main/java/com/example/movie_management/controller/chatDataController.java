package com.example.movie_management.controller;

import com.alibaba.druid.support.json.JSONUtils;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.movie_management.entity.ChatData;
import com.example.movie_management.entity.Cinema;
import com.example.movie_management.entity.tools.Response;
import com.example.movie_management.service.impl.chatDataServiceImpl;
import com.example.movie_management.service.impl.cinemaServiceImpl;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.util.JSONPObject;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.sql.Timestamp;
import java.util.*;


@RestController
@RequestMapping("/chatData")
public class chatDataController {

    @Resource
    private chatDataServiceImpl chatDataService;
    @Resource
    private cinemaServiceImpl cinemaService;

    @RequestMapping("/getChatData")
    public Response getChatData(@RequestBody Map<String,String> map){
        Response response=new Response();
        if (map.get("buyerPhone")==null){
            QueryWrapper<ChatData> chatDataQueryWrapper=new QueryWrapper<>();
            chatDataQueryWrapper.select("distinct from_phone");
            chatDataQueryWrapper.eq("to_phone",map.get("sellerPhone"));
            List<ChatData> dataList = chatDataService.list(chatDataQueryWrapper);
            ArrayList<Map<String,Object>> arrayList=new ArrayList<>();
            for (ChatData chatData: dataList) {
               Map<String,Object> map1=new HashMap<>();
               map1.put("phone",chatData.getFromPhone());
               QueryWrapper<ChatData> chatDataQueryWrapper1=new QueryWrapper<>();
               chatDataQueryWrapper1.eq("from_phone",chatData.getFromPhone()).or().eq("from_phone",map.get("sellerPhone"));
               chatDataQueryWrapper1.eq("to_phone",chatData.getFromPhone()).or().eq("to_phone",map.get("sellerPhone"));
               chatDataQueryWrapper1.orderByAsc("timestamp");
               map1.put("chatList",chatDataService.list(chatDataQueryWrapper1));
               arrayList.add(map1);
            }
            if(!arrayList.isEmpty()){
                response.setStatus(200);
                response.setData(arrayList);
            }
        }else {
            QueryWrapper<ChatData> chatDataQueryWrapper2=new QueryWrapper<>();
            chatDataQueryWrapper2.eq("to_phone",map.get("buyerPhone")).or().eq("from_phone",map.get("buyerPhone"));
            chatDataQueryWrapper2.eq("from_phone",map.get("sellerPhone")).or().eq("to_phone",map.get("sellerPhone"));
            chatDataQueryWrapper2.orderByAsc("timestamp");
            List<ChatData> chatDataList = chatDataService.list(chatDataQueryWrapper2);
            if (!chatDataList.isEmpty()){
                response.setStatus(200);
                response.setData(chatDataList);
            }
        }
        return response;
    }

    @RequestMapping("/sendChatData")
    public Response sendChatData(@RequestBody Map<String,String> map){
        Response response=new Response();
        ChatData chatData=new ChatData();
        chatData.setFromPhone(map.get("buyerPhone"));
        chatData.setToPhone(map.get("sellerPhone"));
        if (map.get("html")!=null){
            chatData.setHtml(map.get("html"));
        }
        if (map.get("textarea")!=null)
        chatData.setChatText(map.get("textarea"));
        Timestamp timestamp=new Timestamp(new Date().getTime());
        chatData.setTimestamp(timestamp);
        boolean save = chatDataService.save(chatData);
        if (save){
            response.setStatus(200);
        }else {
            response.setStatus(500);
        }
        return response;
    }
}
