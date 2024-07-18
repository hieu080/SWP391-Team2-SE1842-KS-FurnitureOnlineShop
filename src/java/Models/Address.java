/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author HELLO
 */
public class Address {
    private int id;
    private int customer_id;
    private String fullname;
    private String phonenumber;
    private String address;
    private String addressdetail;
    private String status;

    public Address() {
    }

    public Address(int id, int customer_id, String fullname, String phonenumber, String address, String addressdetail, String status) {
        this.id = id;
        this.customer_id = customer_id;
        this.fullname = fullname;
        this.phonenumber = phonenumber;
        this.address = address;
        this.addressdetail = addressdetail;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
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

    public String getAddressdetail() {
        return addressdetail;
    }

    public void setAddressdetail(String addressdetail) {
        this.addressdetail = addressdetail;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    
}

