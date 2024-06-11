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
    private String phonenumber;
    private String address;
    private String status;

    public Address() {
    }

    public Address(int customer_id, String phonenumber, String address, String status) {
        this.customer_id = customer_id;
        this.phonenumber = phonenumber;
        this.address = address;
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Address{" + "id=" + id + ", customer_id=" + customer_id + ", phonenumber=" + phonenumber + ", address=" + address + ", status=" + status + '}';
    }
    
    
}

