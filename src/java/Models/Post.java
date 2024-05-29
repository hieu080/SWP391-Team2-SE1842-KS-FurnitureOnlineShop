/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author DELL
 */
public class Post {
    private int id;
    private String category;
    private String title;
    private String subtitle;
    private String thumbnail;
    private String content;
    private String updatedtime;
    private String author;
    private String status;

    public Post() {
    }

    public Post(int id, String category, String title, String subtitle, String thumbnail, String content, String updatedtime, String author , String status) {
        this.id = id;
        this.category = category;
        this.title = title;
        this.subtitle = subtitle;
        this.thumbnail = thumbnail;
        this.content = content;
        this.updatedtime = updatedtime;
        this.author=author;
        this.status = status;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
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

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSubtitle() {
        return subtitle;
    }

    public void setSubtitle(String subtitle) {
        this.subtitle = subtitle;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getUpdatedtime() {
        return updatedtime;
    }

    public void setUpdatedtime(String posttime) {
        this.updatedtime = posttime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    
    
    
}
