/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author HELLO
 */
public class Comment {
    private int id;
    private int customer_id;
    private int feedback_id;
    private String comment;
    private int replycomment_id;
    private String status;

    public Comment() {
    }

    public Comment(int customer_id, int feedback_id, String comment, int replycomment_id) {
        this.customer_id = customer_id;
        this.feedback_id = feedback_id;
        this.comment = comment;
        this.replycomment_id = replycomment_id;
        this.status = "Active";
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

    public int getFeedback_id() {
        return feedback_id;
    }

    public void setFeedback_id(int feedback_id) {
        this.feedback_id = feedback_id;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getReplycomment_id() {
        return replycomment_id;
    }

    public void setReplycomment_id(int replycomment_id) {
        this.replycomment_id = replycomment_id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
}
