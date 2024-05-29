/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author HELLO
 */
public class Post {
    private int id;
    private int category_id;
    private int mkt_id;
    private String title;
    private String subtitle;
    private String content;
    private String thumbnail;
    private String updatedtime;
    private String status;

    public Post() {
    }

    public Post(int category_id, int mkt_id, String title, String subtitle, String thumbnail, String content, String updatedtime) {
        this.category_id = category_id;
        this.mkt_id = mkt_id;
        this.title = title;
        this.subtitle = subtitle;
        this.thumbnail = thumbnail;
        this.content = content;
        this.updatedtime = updatedtime;
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

    public int getMkt_id() {
        return mkt_id;
    }

    public void setMkt_id(int mkt_id) {
        this.mkt_id = mkt_id;
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public String getUpdatedtime() {
        return updatedtime;
    }

    public void setUpdatedtime(String updatedtime) {
        this.updatedtime = updatedtime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    
}
