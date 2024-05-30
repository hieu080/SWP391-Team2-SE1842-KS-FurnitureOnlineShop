/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.CategoryOfPost;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DELL
 */
public class CategoryOfPostDAO extends DBContext {
    
//    public static void main(String[] args) {
//        CategoryOfPostDAO categoryOfPostDAO = new CategoryOfPostDAO();
//        List<CategoryOfPost> list = categoryOfPostDAO.getCategoryOfPostList();
//        for (CategoryOfPost categoryOfPost : list) {
//            System.out.println(categoryOfPost.toString());
//        }
//    }
    //get list post category de filter
    public List<CategoryOfPost> getCategoryOfPostList() {
        String sql = "select * from categoryofpost";
        List<CategoryOfPost> list = new ArrayList<>();

        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                CategoryOfPost cop = new CategoryOfPost();
                cop.setId(rs.getInt("id"));
                cop.setCategory(rs.getString("category"));
                list.add(cop);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    //get categoryofpost by id
    public CategoryOfPost getCategoryOfPostByID(String id) {
        String sql = "SELECT * from categoryofpost where id=?";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, id);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                CategoryOfPost cop = new CategoryOfPost();
                cop.setId(rs.getInt("id"));
                cop.setCategory(rs.getString("category"));
                return cop;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
