package com.feige.test;

import com.feige.dao.UserMapper;
import com.feige.pojo.User;
import com.feige.utils.JsonDate;
import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Test {
    static Logger logger = Logger.getLogger(Test.class);
    @org.junit.Test
    public void test1(){
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("page",1);
        map.put("count",5);
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        UserMapper bean = context.getBean(UserMapper.class);
        List<User> users = bean.getUsers(map);
        for (User user : users) {
            System.out.println(user);
        }
    }
    @org.junit.Test
    public void test2(){
        Date date = new Date();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = format.format(date);
        System.out.println(time);
        String jsonDate = JsonDate.getJson(date);
        System.out.println(jsonDate);
    }
}
