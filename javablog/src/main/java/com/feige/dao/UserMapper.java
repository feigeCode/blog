package com.feige.dao;

import com.feige.pojo.User;

import java.util.List;
import java.util.Map;

public interface UserMapper {
    //增删改查
    int addUser(User user);
    int deleteUser(String username);
    int updateUser(Map map);
    List<User> getUsers(Map map);
    User getUser(String username);
    int getCount();
}
