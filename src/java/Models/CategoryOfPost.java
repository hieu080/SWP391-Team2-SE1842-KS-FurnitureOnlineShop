/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.util.logging.Logger;

/**
 *
 * @author HELLO
 */
public class CategoryOfPost {

    private int id;
    private String category;
    private String status;

    public CategoryOfPost() {
    }

    public CategoryOfPost(String category) {
        this.category = category;
        this.status = "Inactive";
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "CategoryOfPost{" + "id=" + id + ", category=" + category + ", status=" + status + '}';
    }
    
    
}
