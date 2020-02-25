package com.feige.service;

import com.feige.pojo.CommentAndReplies;

import java.util.List;

public interface CommentService {
    List<CommentAndReplies> getCommentAndReplies();
}
