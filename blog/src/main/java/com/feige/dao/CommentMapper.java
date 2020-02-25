package com.feige.dao;

import com.feige.pojo.Comment;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;


@Mapper
@Repository
public interface CommentMapper {
    List<Comment> getComments();
    List<Comment> getReplys(Integer parentId);
}
