/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author HELLO
 */
public class SaleOff {

    private int id;
    private int product_id;
    private int saleoffvalue;
    private String status;

    public SaleOff() {
    }

    public SaleOff(int product_id, int saleoffvalue) {
        this.product_id = product_id;
        this.saleoffvalue = saleoffvalue;
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

    public int getSaleoffvalue() {
        return saleoffvalue;
    }

    public void setSaleoffvalue(int saleoffvalue) {
        this.saleoffvalue = saleoffvalue;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}
