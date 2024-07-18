/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author HELLO
 */
public class OrderDetail {

    private int id;
    private int order_id;
    private int productdetail_id;
    private int quantity;
    private double price;

    public OrderDetail() {
    }

    public OrderDetail(int order_id, int productdetail_id, int quantity, double price) {
        this.order_id = order_id;
        this.productdetail_id = productdetail_id;
        this.quantity = quantity;
        this.price = price;
    }

    public OrderDetail(int id, int order_id, int productdetail_id, int quantity, double price) {
        this.id = id;
        this.order_id = order_id;
        this.productdetail_id = productdetail_id;
        this.quantity = quantity;
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getProductdetail_id() {
        return productdetail_id;
    }

    public void setProductdetail_id(int productdetail_id) {
        this.productdetail_id = productdetail_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

}
