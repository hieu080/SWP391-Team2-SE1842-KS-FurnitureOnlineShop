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

    //get list post category de filter
    public List<String> getListCategoryofPost() {
        String sql = "select * from categoryofpost";
        List<String> list = new ArrayList<>();

        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                String category = rs.getString("category");
                list.add(category);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    //get list of all posts
    public List<Post> getListPost() {
        String sql = "SELECT p.*, c.category, u.fullname\n"
                + "FROM Post p\n"
                + "JOIN CategoryOfPost c ON p.category_id = c.id\n"
                + "JOIN User u ON p.mkt_id = u.id\n"
                + "order by updatedtime desc";
        List<Post> list = new ArrayList<>();
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Post p = new Post();
                p.setId(rs.getInt("id"));
                p.setCategory(rs.getString("category"));
                p.setTitle(rs.getString("title"));
                p.setSubtitle(rs.getString("subtitle"));
                p.setThumbnail(rs.getString("thumbnail"));
                p.setAuthor(rs.getString("fullname"));
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
        String sql = "SELECT p.*, c.category, u.fullname\n"
                + "FROM Post p\n"
                + "JOIN CategoryOfPost c ON p.category_id = c.id\n"
                + "JOIN User u ON p.mkt_id = u.id\n"
                + "where p.id=?";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, id);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                Post p = new Post();
                p.setId(rs.getInt("id"));
                p.setCategory(rs.getString("category"));
                p.setTitle(rs.getString("title"));
                p.setSubtitle(rs.getString("subtitle"));
                p.setThumbnail(rs.getString("thumbnail"));
                p.setContent(rs.getString("content"));
                p.setAuthor(rs.getString("fullname"));
                p.setUpdatedtime(rs.getString("updatedtime"));
                p.setStatus(rs.getString("status"));
                return p;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    //get list of post by keyword searched
    public List<Post> getListPostbySearch(String keyword) {
        String sql = "SELECT p.*, c.category, u.fullname\n"
                + "FROM Post p\n"
                + "JOIN CategoryOfPost c ON p.category_id = c.id\n"
                + "JOIN User u ON p.mkt_id = u.id\n"
                + "where CONCAT(title, fullname, content, Subtitle) LIKE ?";
        List<Post> list = new ArrayList<>();
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, "%" + keyword + "%");
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Post p = new Post();
                p.setId(rs.getInt("id"));
                p.setCategory(rs.getString("category"));
                p.setTitle(rs.getString("title"));
                p.setSubtitle(rs.getString("subtitle"));
                p.setThumbnail(rs.getString("thumbnail"));
                p.setUpdatedtime(rs.getString("updatedtime"));
                p.setAuthor(rs.getString("fullname"));
                p.setStatus(rs.getString("status"));
                list.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }


}
