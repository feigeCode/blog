package com.feige.dao;

import com.feige.pojo.User;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

//@Mapper : 表示本类是一个 MyBatis 的 Mapper，等价于以前 Spring 整合 MyBatis 时的 Mapper 接口
@Mapper
@Repository
public interface UserMapper {
    //增删改查
    int addUser(User user);
    int deleteUser(String username);
    int updateUser(User user);
    List<User> getUsers(Map map);
    User getUser(String username);
    int getCount(Map map);
}


