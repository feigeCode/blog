package com.feige.service;

import com.feige.dao.CommentMapper;
import com.feige.pojo.Comment;
import com.feige.pojo.CommentAndReplies;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;


@Service
public class CommentServiceIpl implements CommentService {
    @Autowired
    private CommentMapper commentMapper;


    @Override
    public List<CommentAndReplies> getCommentAndReplies() {
        List<Comment> comments = commentMapper.getComments();
        ArrayList<CommentAndReplies> commentAndReplies1 = new ArrayList<>();
        for (Comment comment : comments) {
            CommentAndReplies commentAndReplies = new CommentAndReplies();
            commentAndReplies.setRootComment(comment);
            getAllReply(comment);
            commentAndReplies.setReplies(commentList);
            commentList = new ArrayList<>();
            commentAndReplies1.add(commentAndReplies);
        }
        return commentAndReplies1;
    }
    private List<Comment> commentList = new ArrayList<>();
    //递归找出所有的回复，把它放在list中，输出到最顶级评论的下边
    private void getAllReply(Comment comment){
        List<Comment> replys = commentMapper.getReplys(comment.getId());
        if(replys.size()>0){
            for (Comment reply : replys) {
                commentList.add(reply);
                if(commentMapper.getReplys(reply.getId()).size()>0){
                    getAllReply(reply);
                }
            }
        }
    }
}
