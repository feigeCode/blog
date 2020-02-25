package com.feige.pojo;

public class Comment {
    private Integer id;
    private String title;
    private String content;
    private Integer parentId;
    private Integer rootId;
    private String createTime;
    private String username;
    private String replier;

    public Comment(Integer id, String title, String content, Integer parentId, Integer rootId, String createTime, String username, String replier) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.parentId = parentId;
        this.rootId = rootId;
        this.createTime = createTime;
        this.username = username;
        this.replier = replier;
    }

    public Comment() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public Integer getRootId() {
        return rootId;
    }

    public void setRootId(Integer rootId) {
        this.rootId = rootId;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getReplier() {
        return replier;
    }

    public void setReplier(String replier) {
        this.replier = replier;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", parentId=" + parentId +
                ", rootId=" + rootId +
                ", createTime='" + createTime + '\'' +
                ", username='" + username + '\'' +
                ", replier='" + replier + '\'' +
                '}';
    }
}
