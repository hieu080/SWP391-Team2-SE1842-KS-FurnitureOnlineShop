/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author HELLO
 */
public class CartItem {

    private int id;
    private int customer_id;
    private int product_id;
    private int quantity = 1;
    private double totalcost = 0;
    private String status = "unselected";

    public CartItem() {
    }

    public CartItem(int id, int customer_id, int product_id) {
        this.id = id;
        this.customer_id = customer_id;
        this.product_id = product_id;
    }

    public CartItem(int id, int customer_id, int product_id,int quantity, double totalcost,String status) {
        this.id = id;
        this.customer_id = customer_id;
        this.product_id = product_id;
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

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getTotalcost() {
        return totalcost;
    }

    public void setTotalcost(double totalcost) {
        this.totalcost = totalcost;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}
