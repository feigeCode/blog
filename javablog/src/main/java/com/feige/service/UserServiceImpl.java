package com.feige.service;

import com.feige.dao.UserMapper;
import com.feige.pojo.User;

import java.util.List;
import java.util.Map;

public class UserServiceImpl implements UserService {
    //调用dao层的操作，设置一个set接口，方便Spring管理
    private UserMapper userMapper;

    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    public int addUser(User user) {
        return userMapper.addUser(user);
    }

    public int deleteUser(String username) {
        return userMapper.deleteUser(username);
    }

    public int updateUser(Map map) {
        return userMapper.updateUser(map);
    }

    public List<User> getUsers(Map map){
        return userMapper.getUsers(map);
    }

    public User getUser(String username) {
        return userMapper.getUser(username);
    }

    public int getCount() {
        return userMapper.getCount();
    }
}
