package com.feige.service;

import com.feige.pojo.User;

import java.util.List;
import java.util.Map;


public interface UserService {
    //增删改查
    int addUser(User user);
    int deleteUser(String username);
    int updateUser(User user);
    List<User> getUsers(Map map);
    User getUser(String username);
    int getCount(Map map);
}
