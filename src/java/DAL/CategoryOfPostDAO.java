/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.CategoryOfPost;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;

/**
 *
 * @author HELLO
 */
public class CategoryOfPostDAO extends DBContext{

    private static final java.util.logging.Logger LOGGER = java.util.logging.Logger.getLogger(CategoryOfPostDAO.class.getName());

        public List<CategoryOfPost> getListCategoryofPost() {
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
        } catch (Exception ex) {
            LOGGER.log(Level.SEVERE, "mss", ex);
        }
        return list;
    }

    

    
}
