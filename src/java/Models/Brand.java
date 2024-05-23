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
    private String brandname;

    public Brand() {
    }

    public String getBrandName() {
        return brandname;
    }

    public void setBrandName(String brandName) {
        this.brandname = brandName;
    }

    @Override
    public String toString() {
        return "Brand{" + "id=" + id + ", brandName=" + brandname + '}';
    }

    public Brand(String brandname) {
        this.brandname = brandname;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBrandname() {
        return brandname;
    }

    public void setBrandname(String brandname) {
        this.brandname = brandname;
    }

}
