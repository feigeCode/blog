package com.feige.controller;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.feige.pojo.CommentAndReplies;
import com.feige.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("comment")
public class CommentController {

    @Autowired
    CommentService commentService;

    public String getComments() {
        List<CommentAndReplies> commentAndReplies = commentService.getCommentAndReplies();
        ObjectMapper mapper = new ObjectMapper();
        try {
            return mapper.writeValueAsString(commentAndReplies);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return null;
    }
}
