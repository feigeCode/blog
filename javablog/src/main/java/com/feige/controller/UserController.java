package com.feige.controller;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.feige.pojo.User;
import com.feige.service.UserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/user")
public class UserController {
    static Logger logger = Logger.getLogger(UserController.class);
    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService;

    @RequestMapping("/getUsers")
    public String getUsers(Integer page,Integer count){
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("page",(page-1)*count);
        map.put("count",count);
        String string = null;
        //创建一个jackson的对象映射器，用来解析数据
        ObjectMapper mapper = new ObjectMapper();
        List<User> users = userService.getUsers(map);
        int count1 = userService.getCount();
        try {
            String str = mapper.writeValueAsString(users);
            string = "{\"total\":" +count1+ ",\"user\":" +str+'}';
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return string;

    }
    @RequestMapping("/addUser")
    public int addUser(String username,String email,String password,Integer sex){
        int status;
        Date date = new Date();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = format.format(date);
        User user = new User(0,username,email,password,sex,time);
        status = userService.addUser(user);
        return status;
    }
    @RequestMapping("/deleteUser")
    public int deleteUser(String username){
        int status;
        status = userService.deleteUser(username);
        return status;
    }
    @RequestMapping("/updateUser")
    public int updateUser(Integer id,String username,String email,String password,Integer sex,String time){
        int status;
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("id",id);
        map.put("username",username);
        map.put("email",email);
        map.put("password",password);
        map.put("sex",sex);
        map.put("time",time);
        status = userService.updateUser(map);
        return status;
    }
    @RequestMapping("/getUser")
    public String getUser(String username){
        ObjectMapper mapper = new ObjectMapper();
        User user = userService.getUser(username);
        String str = null;
        try {
            str = mapper.writeValueAsString(user);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return str;

    }
}
