/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author HELLO
 */
public class ImageFeedback {
    private int id;
    private int feedback_id;
    private String image;

    public ImageFeedback() {
    }

    public ImageFeedback(int id, int feedback_id, String image) {
        this.id = id;
        this.feedback_id = feedback_id;
        this.image = image;
    }

    public ImageFeedback(int feedback_id, String image) {
        this.feedback_id = feedback_id;
        this.image = image;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getFeedback_id() {
        return feedback_id;
    }

    public void setFeedback_id(int feedback_id) {
        this.feedback_id = feedback_id;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
    
    
}
