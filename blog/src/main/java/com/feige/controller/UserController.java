package com.feige.controller;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.feige.pojo.User;
import com.feige.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("/getUsers")
    public String getUsers(Integer page,Integer limit,String searchContent){
        HashMap<String,Object> map = new HashMap<String, Object>();
        map.put("page",(page-1)*limit);
        map.put("count",limit);
        map.put("searchContent",searchContent);
        List<User> list = userService.getUsers(map);
        int userCount = userService.getCount(map);
        //创建一个jackson的对象映射器，用来解析数据
        ObjectMapper mapper = new ObjectMapper();
        //将我们的对象解析成为json格式
        try {
            //由于@ResponseBody注解，这里会将str转成json格式返回；十分方便
            return "{\"code\":0,\"msg\":\"\",\"count\":" + userCount + ",\"data\":" + mapper.writeValueAsString(list) + "}";
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return null;

    }
    @RequestMapping("/addUser")
    public String addUser(String  headPhoto,String username,String email,String password,Integer sex,String hobby,String selfIntroduce,String other){
        String status = null;
        Date date = new Date();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = format.format(date);
        User user1 = new User(0,headPhoto,username,email,password,sex,time,hobby,selfIntroduce,other);
        User user2 = userService.getUser(username);
        if(user2 == null){
            int  add = userService.addUser(user1);
            if(add == 1){
                status = "SUCCESS";
            }
        }else {
            status = "exist";
        }
        return status;
    }
    @RequestMapping("/deleteUser/{username}")
    public String deleteUser(@PathVariable("username") String username){
         String status = null;
        int delete = userService.deleteUser(username);
        if(delete == 1){
            status = "SUCCESS";
        }
        return status;
    }
    @RequestMapping("/updateUser/{id}/{oldUsername}")
    public String updateUser(@PathVariable("oldUsername") String oldUsername,@PathVariable("id") Integer id,String  headPhoto,String username,String email,String password,Integer sex,String hobby,String selfIntroduce,String other,String time){
        String status = null;
        User user1 = new User(id,headPhoto,username,email,password,sex,time,hobby,selfIntroduce,other);
        if(username.equals(oldUsername)){
            int update = userService.updateUser(user1);
            if(update == 1){
                status = "SUCCESS";
            }
        }else {
            User user2 = userService.getUser(username);
            if(user2 == null){
                int update = userService.updateUser(user1);
                if(update == 1){
                    status = "SUCCESS";
                }
            }else {
                status = "exist";
            }
        }
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
