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
public class Feedback {
    private int id;
    private int customer_id;
    private int product_id;
    private int votescore;
    private String feedback;
    private String status;

    public Feedback() {
    }

    public Feedback(int customer_id, int product_id, int votescore, String feedback) {
        this.customer_id = customer_id;
        this.product_id = product_id;
        this.votescore = votescore;
        this.feedback = feedback;
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

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public int getVotescore() {
        return votescore;
    }

    public void setVotescore(int votescore) {
        this.votescore = votescore;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    
    
    
}
