package com.feige;

import com.feige.dao.CommentMapper;
import com.feige.pojo.*;
import com.feige.service.AdminService;
import com.feige.service.BlogService;
import com.feige.service.CommentService;
import com.feige.service.UserService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@SpringBootTest
class BlogApplicationTests {
    @Autowired
    UserService userService;

    @Autowired
    AdminService adminService;

    @Autowired
    BlogService blogService;


    @Autowired
    CommentMapper commentMapper;

    @Autowired
    CommentService commentService;

    @Test
    void contextLoads() {
        Map<String,Object> map = new HashMap<>();
        map.put("page",0);
        map.put("count",10);
        List<User> users = userService.getUsers(map);
        for (User user : users) {
            System.out.println(user);
        }

        User user = userService.getUser("feige");
        System.out.println(user);
    }
    @Test
    void test1(){
        Map<String,Object> map = new HashMap<>();
        map.put("page",0);
        map.put("count",10);
        List<Admin> admins = adminService.getAdmins(map);
        for (Admin admin : admins) {
            System.out.println(admin);
        }
    }
    @Test
    void test2(){

        Admin admin = adminService.getAdmin("admin");
        System.out.println(admin);
    }
    @Test
    void test3(){
        Map<String,Object> map = new HashMap<>();
        map.put("page",0);
        map.put("count",10);
        List<Blog> blogs = blogService.getBlogs(map);
        for (Blog blog : blogs) {
            System.out.println(blog);
        }
    }
    @Test
    void test4(){
        List<Comment> comments = commentMapper.getComments();
        for (Comment comment : comments) {
            System.out.println(comment.getUsername()+"在"+comment.getCreateTime()+"发表评论\n"+"内容为:"+comment.getContent());
            List<Comment> replys = commentMapper.getReplys(comment.getId());
            for (Comment reply : replys) {
                System.out.println("\t"+reply.getUsername()+"在"+reply.getCreateTime()+"回复"+comment.getUsername()+"\n"+"\t内容为："+reply.getContent());
            }
        }

    }
    @Test
    void test5(){
        List<Comment> comments = commentMapper.getComments();
        ArrayList<CommentAndReplies> commentReplies = new ArrayList<>();
        for (Comment comment : comments) {
            CommentAndReplies commentAndReplies = new CommentAndReplies();
            commentAndReplies.setRootComment(comment);
            getReplys(comment);
            commentAndReplies.setReplies(lists);
            lists = new ArrayList<>();
            commentReplies.add(commentAndReplies);
        }
        for (CommentAndReplies commentAndReplies : commentReplies) {
            System.out.println(commentAndReplies.getRootComment().getUsername()+"在"+ commentAndReplies.getRootComment().getCreateTime()+"发表评论\n"+"内容为:"+ commentAndReplies.getRootComment().getContent());
            for (Comment reply1 : commentAndReplies.getReplies()) {
                System.out.println("\t"+reply1.getUsername()+"在"+reply1.getCreateTime()+"回复"+reply1.getReplier()+"\n"+"\t内容为："+reply1.getContent());
            }

        }
    }
    private List<Comment> lists = new ArrayList<>();
    private void getReplys(Comment comment){
        List<Comment> replys = commentMapper.getReplys(comment.getId());
        if(replys.size()>0){
            for (Comment reply : replys) {
                lists.add(reply);
                if(reply.getParentId() != null){
                    getReplys(reply);
                }
            }
        }
    }
    @Test
    void test6(){
        List<CommentAndReplies> commentAndReplies = commentService.getCommentAndReplies();
        for (CommentAndReplies commentAndReplies1 : commentAndReplies) {
            System.out.println(commentAndReplies1.getRootComment().getUsername()+"在"+ commentAndReplies1.getRootComment().getCreateTime()+"发表评论\n"+"内容为:"+ commentAndReplies1.getRootComment().getContent());
            for (Comment reply1 : commentAndReplies1.getReplies()) {
                System.out.println("\t"+reply1.getUsername()+"在"+reply1.getCreateTime()+"回复"+reply1.getReplier()+"\n"+"\t内容为："+reply1.getContent());
            }

        }
    }

}
