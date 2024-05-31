/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author HELLO
 */
public class User {

    private int id;
    private String fullname;
    private String gender;
    private String avatar;
    private String phonenumber;
    private String address;
    private String email;
    private String password;
    private int role_id;
    private String status;

    public User() {
    }

    public User(int id, String fullname, String gender, String avatar, String phonenumber, String address, String email, String password, int role_id, String status) {
        this.id = id;
        this.fullname = fullname;
        this.gender = gender;
        this.avatar = avatar;
        this.phonenumber = phonenumber;
        this.address = address;
        this.email = email;
        this.password = password;
        this.role_id = role_id;
        this.status = status;
    }

    public User(String fullname, String gender, String avatar, String phonenumber, String address, String email, String password) {
        this.fullname = fullname;
        this.gender = gender;
        this.avatar = avatar;
        this.phonenumber = phonenumber;
        this.address = address;
        this.email = email;
        this.password = password;
    }

    public User(String fullname, String gender, String avatar, String phonenumber, String address) {
        this.fullname = fullname;
        this.gender = gender;
        this.avatar = avatar;
        this.phonenumber = phonenumber;
        this.address = address;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
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

    public int getRole_id() {
        return role_id;
    }

    public void setRole_id(int role_id) {
this.role_id = role_id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}