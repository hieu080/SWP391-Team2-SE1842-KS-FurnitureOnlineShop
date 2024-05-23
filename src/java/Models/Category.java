/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author HELLO
 */
public class Category {
    private int id;
    private String category;
    private int room_id;
    private int parentcategory_id;

    public Category() {
    }

    public Category(String category, int room_id, int parentcategory_id) {
        this.category = category;
        this.room_id = room_id;
        this.parentcategory_id = parentcategory_id;
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

    public int getRoom_id() {
        return room_id;
    }

    public void setRoom_id(int room_id) {
        this.room_id = room_id;
    }

    public int getParentcategory_id() {
        return parentcategory_id;
    }

    public void setParentcategory_id(int parentcategory_id) {
        this.parentcategory_id = parentcategory_id;
    }
    
    
}
