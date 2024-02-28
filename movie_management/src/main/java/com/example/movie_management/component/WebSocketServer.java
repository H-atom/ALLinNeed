package com.example.movie_management.component;

import com.alibaba.druid.support.json.JSONUtils;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.java.Log;
import org.apache.ibatis.reflection.wrapper.BeanWrapper;
import org.apache.ibatis.reflection.wrapper.ObjectWrapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;


/**
 * @author websocket服务
 */
@ServerEndpoint(value = "/webSocket/{phone}")
@Component
public class WebSocketServer {

    private static final Logger log = LoggerFactory.getLogger(WebSocketServer.class);

    /**
     * 记录当前在线连接数
     */
    public static final Map<String, Session> sessionMap = new ConcurrentHashMap<>();

    /**
     * 连接建立成功调用的方法
     */
    @OnOpen
    public void onOpen(Session session, @PathParam("phone") String username) {
        sessionMap.put(username, session);
        log.info("有新用户加入，username={}, 当前在线人数为：{}", username, sessionMap.size());
        Map<String,Object> result=new HashMap<>();
        ArrayList<Map<String,String>> array=new ArrayList<>();
        result.put("users", array);
        for (String key : sessionMap.keySet()) {
            Map<String,String> map=new HashMap<>();
            map.put("phone", key);
            // {"username", "zhang", "username": "admin"}
            array.add(map);
        }
        ObjectMapper objectMapper=new ObjectMapper();
        String json=null;
        try {
            json=objectMapper.writeValueAsString(result);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
//        {"users": [{"username": "zhang"},{ "username": "admin"}]}
        sendAllMessage(json);  // 后台发送消息给所有的客户端
    }

    /**
     * 连接关闭调用的方法
     */
    @OnClose
    public void onClose(Session session, @PathParam("phone") String username) {
        sessionMap.remove(username);
        log.info("有一连接关闭，移除username={}的用户session, 当前在线人数为：{}", username, sessionMap.size());
    }

    /**
     * 收到客户端消息后调用的方法
     * 后台收到客户端发送过来的消息
     * onMessage 是一个消息的中转站
     * 接受 浏览器端 socket.send 发送过来的 json数据
     * @param message 客户端发送过来的消息
     */
    @OnMessage
    public void onMessage(String message, Session session, @PathParam("phone") String username) {
        log.info("服务端收到用户username={}的消息:{}", username, message);
        Map<String,Object> obj = (Map<String, Object>) JSONUtils.parse(message);
        String toUsername = (String) obj.get("to"); // to表示发送给哪个用户，比如 admin
        String text = (String) obj.get("text");// 发送的消息文本  hello
        Map<String,String> html= (Map<String, String>) obj.get("html");//形成HTML的信息
        // {"to": "admin", "text": "聊天文本"}
        Session toSession = sessionMap.get(toUsername); // 根据 to用户名来获取 session，再通过session发送消息文本
        if (toSession != null) {
            // 服务器端 再把消息组装一下，组装后的消息包含发送人和发送的文本内容
            // {"from": "zhang", "text": "hello"}
            Map<String,Object> jsonObject=new HashMap<>();
            jsonObject.put("from", username);  // from 是 zhang
            if (text!=null)
            jsonObject.put("text", text);  // text 同上面的text
            if (html!=null){
                jsonObject.put("html",html);
            }
            ObjectMapper objectMapper=new ObjectMapper();
            try {
                String json=objectMapper.writeValueAsString(jsonObject);
                this.sendMessage(json, toSession);
            } catch (JsonProcessingException e) {
                e.printStackTrace();
            }
            log.info("发送给用户username={}，消息：{}", toUsername, jsonObject.toString());
        } else {
            log.info("发送失败，未找到用户username={}的session", toUsername);
        }
    }

    @OnError
    public void onError(Session session, Throwable error) {
        log.error("发生错误");
        error.printStackTrace();
    }

    /**
     * 服务端发送消息给客户端
     */
    private void sendMessage(String message, Session toSession) {
        try {
            log.info("服务端给客户端[{}]发送消息{}", toSession.getId(), message);
            toSession.getBasicRemote().sendText(message);
        } catch (Exception e) {
            log.error("服务端发送消息给客户端失败", e);
        }
    }

    /**
     * 服务端发送消息给所有客户端
     */
    private void sendAllMessage(String message) {
        try {
            for (Session session : sessionMap.values()) {
                log.info("服务端给客户端[{}]发送消息{}", session.getId(), message);
                session.getBasicRemote().sendText(message);
            }
        } catch (Exception e) {
            log.error("服务端发送消息给客户端失败", e);
        }
    }
}
