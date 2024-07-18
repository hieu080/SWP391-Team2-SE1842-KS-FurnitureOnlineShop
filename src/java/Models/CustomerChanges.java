/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author DELL
 */
public class CustomerChanges {
    String fullname,email,address,phone,gender,updateddate;
    int updatedby, customer_id;

    public CustomerChanges() {
    }

    public CustomerChanges(String fullname, String email, String address, String phone, String gender, int updatedby, int customer_id) {
        this.fullname = fullname;
        this.email = email;
        this.address = address;
        this.phone = phone;
        this.gender = gender;
        this.updatedby = updatedby;
        this.customer_id = customer_id;
    }
    
    public CustomerChanges(String fullname, String email, String address, String phone, String gender, String updateddate, int updatedby, int customer_id) {
        this.fullname = fullname;
        this.email = email;
        this.address = address;
        this.phone = phone;
        this.gender = gender;
        this.updateddate = updateddate;
        this.updatedby = updatedby;
        this.customer_id = customer_id;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getUpdateddate() {
        return updateddate;
    }

    public void setUpdateddate(String updateddate) {
        this.updateddate = updateddate;
    }

    public int getUpdatedby() {
        return updatedby;
    }

    public void setUpdatedby(int updatedby) {
        this.updatedby = updatedby;
    }

    public int getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

    
    
    
}
