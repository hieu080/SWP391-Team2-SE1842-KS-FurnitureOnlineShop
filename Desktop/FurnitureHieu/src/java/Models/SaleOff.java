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
    private int value;

    public SaleOff() {
    }

    public SaleOff(int product_id, int value) {
        this.product_id = product_id;
        this.value = value;
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
        return value;
    }

    public void setSaleoffvalue(int value) {
        this.value = value;
    }
}
