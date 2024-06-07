/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author HELLO
 */
public class Product {
    private int id;
    private int category_id;
    private int brand_id;
    private int room_id;
    private String name;
    private String description;
    private double staravg;
    private String image;
    private double price;
    private int quantity;
    private String status;

    public Product() {
    }

    public Product(int category_id, int brand_id, int room_id, String name, String description, String image, double price, int quantity) {
        this.category_id = category_id;
        this.brand_id = brand_id;
        this.room_id = room_id;
        this.name = name;
        this.description = description;
        this.staravg = 0;
        this.image = image;
        this.price = price;
        this.quantity = quantity;
        this.status = "Active";
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public int getBrand_id() {
        return brand_id;
    }

    public void setBrand_id(int brand_id) {
        this.brand_id = brand_id;
    }

    public int getRoom_id() {
        return room_id;
    }

    public void setRoom_id(int room_id) {
        this.room_id = room_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getStaravg() {
        return staravg;
    }

    public void setStaravg(double staravg) {
        this.staravg = staravg;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    
}
