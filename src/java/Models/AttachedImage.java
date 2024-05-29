/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author HELLO
 */
public class AttachedImage {
    private int id;
    private int productdetail_id;
    private String image;

    public AttachedImage() {
    }

    public AttachedImage(int productdetail_id, String image) {
        this.productdetail_id = productdetail_id;
        this.image = image;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProductdetail_id() {
        return productdetail_id;
    }

    public void setProductdetail_id(int productdetail_id) {
        this.productdetail_id = productdetail_id;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
    
    
}

