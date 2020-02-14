package com.feige.pojo;


public class User {
    private int id;
    private String username;
    private String email;
    private String password;
    private int sex;
    private String time;

    public User(int id, String username, String email, String password, int sex, String time) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.password = password;
        this.sex = sex;
        this.time = time;
    }

    public User() {
    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getSex() {
        return sex;
    }

    public void setSex(int sex) {
        this.sex = sex;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", sex=" + sex +
                ", time='" + time + '\'' +
                '}';
    }
}
