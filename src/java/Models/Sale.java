/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author HELLO
 */
public class Sale {
    private int id;
    private int product_id;
    private int salevalue;
    private String status;

    public Sale() {
    }

    public Sale(int product_id, int salevalue) {
        this.product_id = product_id;
        this.salevalue = salevalue;
        this.status = "Active";
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public int getSalevalue() {
        return salevalue;
    }

    public void setSalevalue(int salevalue) {
        this.salevalue = salevalue;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    
}
