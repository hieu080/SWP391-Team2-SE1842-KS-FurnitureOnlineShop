/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author HELLO
 */
public class Brand {
    private int id;
    private String brandName;
    
    public Brand() {
    }
    
    public Brand(String brandname) {
        this.brandName = brandname;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBrandname() {
        return brandName;
    }

    public void setBrandname(String brandname) {
        this.brandName = brandname;
    }

    
    
    
}
