/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Post;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author HELLO
 */
public class PostDAO extends DBContext {

    private static final java.util.logging.Logger LOGGER = java.util.logging.Logger.getLogger(PostDAO.class.getName());

    public ArrayList<Post> getNewPostList() {
        String sql = "SELECT * FROM Post ORDER BY id DESC limit 5";
        ArrayList<Post> list = new ArrayList<>();

        try (PreparedStatement statement = connect.prepareStatement(sql); ResultSet rs = statement.executeQuery()) {
            while (rs.next()) {
                Post p = new Post();
                p.setId(rs.getInt("id"));
                p.setCategory_id(rs.getInt("category_id"));
                p.setMkt_id(rs.getInt("mkt_id"));
                p.setTitle(rs.getString("title"));
                p.setSubtitle(rs.getString("subtitle"));
                p.setThumbnail(rs.getString("thumbnail"));
                p.setContent(rs.getString("content"));
                p.setUpdatedtime(rs.getString("updatedtime"));
                p.setStatus(rs.getString("status"));
                list.add(p);
            }
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, "Error retrieving new post list", ex);
        }

        return list;
    }

    public ArrayList<Post> getPostListByCategoryId(String categoryOfPost_id) {
        String sql = "SELECT * FROM Post WHERE category_id = ?";
        ArrayList<Post> list = new ArrayList<>();

        try (PreparedStatement statement = connect.prepareStatement(sql)) {
            statement.setString(1, categoryOfPost_id);
            try (ResultSet rs = statement.executeQuery()) {
                while (rs.next()) {
                    Post p = new Post();
                    p.setId(rs.getInt("id"));
                    p.setCategory_id(rs.getInt("category_id"));
                    p.setMkt_id(rs.getInt("mkt_id"));
                    p.setTitle(rs.getString("title"));
                    p.setSubtitle(rs.getString("subtitle"));
                    p.setThumbnail(rs.getString("thumbnail"));
                    p.setContent(rs.getString("content"));
                    p.setUpdatedtime(rs.getString("updatedtime"));
                    p.setStatus(rs.getString("status"));
                    list.add(p);
                }
            }
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, "Error retrieving post list by filter", ex);
        }

        return list;
    }

    
    
    //list of all post
    public ArrayList<Post> getPostList() {
        String sql = "SELECT * FROM Post";
        ArrayList<Post> list = new ArrayList<>();

        try (PreparedStatement statement = connect.prepareStatement(sql); ResultSet rs = statement.executeQuery()) {

            while (rs.next()) {
                Post p = new Post();
                p.setId(rs.getInt("id"));
                p.setCategory_id(rs.getInt("category_id"));
                p.setMkt_id(rs.getInt("mkt_id"));
                p.setTitle(rs.getString("title"));
                p.setSubtitle(rs.getString("subtitle"));
                p.setThumbnail(rs.getString("thumbnail"));
                p.setContent(rs.getString("content"));
                p.setUpdatedtime(rs.getString("updatedtime"));
                p.setStatus(rs.getString("status"));
                list.add(p);
            }
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, "Error retrieving post list", ex);
        }

        return list;
    }

    //get list of post by keyword searched
    public ArrayList<Post> getListPostbySearch(String keyword) {
        String sql = "SELECT p.*, c.category, u.fullname\n"
                + "FROM Post p\n"
                + "JOIN CategoryOfPost c ON p.category_id = c.id\n"
                + "JOIN User u ON p.mkt_id = u.id\n"
                + "where CONCAT(title, fullname, content, Subtitle) LIKE ?";
        ArrayList<Post> list = new ArrayList<>();
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, "%" + keyword + "%");
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Post p = new Post();
                p.setId(rs.getInt("id"));
                p.setCategory_id(rs.getInt("category_id"));
                p.setMkt_id(rs.getInt("mkt_id"));
                p.setTitle(rs.getString("title"));
                p.setSubtitle(rs.getString("subtitle"));
                p.setThumbnail(rs.getString("thumbnail"));
                p.setContent(rs.getString("content"));
                p.setUpdatedtime(rs.getString("updatedtime"));
                p.setStatus(rs.getString("status"));
                list.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
   

    //get post detail by id
    public Post getPostbyID(String id) {
        String sql = "SELECT * from Post where id=?";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, id);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                Post p = new Post();
                p.setId(rs.getInt("id"));
                p.setCategory_id(rs.getInt("category_id"));
                p.setTitle(rs.getString("title"));
                p.setSubtitle(rs.getString("subtitle"));
                p.setThumbnail(rs.getString("thumbnail"));
                p.setContent(rs.getString("content"));
                p.setMkt_id(rs.getInt("mkt_id"));
                p.setUpdatedtime(rs.getString("updatedtime"));
                p.setStatus(rs.getString("status"));
                return p;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
}
