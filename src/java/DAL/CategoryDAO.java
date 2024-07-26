/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

/**
 *
 * @author HELLO
 */
import Models.Category;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.logging.Level;

public class CategoryDAO extends DBContext {

    private static final java.util.logging.Logger LOGGER = java.util.logging.Logger.getLogger(CategoryDAO.class.getName());

    public static void main(String[] args) {
        CategoryDAO categoryDAO = new CategoryDAO();
        ArrayList<Category> categoryList = categoryDAO.getCategoryList();
        for (Category category : categoryList) {
            System.out.println(category.toString());
        }
    }
    // Phương thức getCategoryList
    public ArrayList<Category> getCategoryList() {
        ArrayList<Category> categoryList = new ArrayList<>();
        String sql = "SELECT * FROM category WHERE status = 'Active'";

        try (PreparedStatement pstmt = connect.prepareStatement(sql); 
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                int id = rs.getInt("id");
                String categoryName = rs.getString("category");
                String status = rs.getString("status");
                Category category = new Category();
                category.setId(id);
                category.setCategory(categoryName);
                category.setStatus(status);
                categoryList.add(category);
            }

        } catch (Exception ex) {
            LOGGER.log(Level.SEVERE, "Error retrieving category list", ex);
        }

        return categoryList;
    }
    
    public ArrayList<Category> getCategoryListAll() {
        ArrayList<Category> categoryList = new ArrayList<>();
        String sql = "SELECT * FROM category";

        try (PreparedStatement pstmt = connect.prepareStatement(sql); 
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                int id = rs.getInt("id");
                String categoryName = rs.getString("category");
                String status = rs.getString("status");
                Category category = new Category();
                category.setId(id);
                category.setCategory(categoryName);
                category.setStatus(status);
                categoryList.add(category);
            }

        } catch (Exception ex) {
            LOGGER.log(Level.SEVERE, "Error retrieving category list", ex);
        }

        return categoryList;
    }

    // Phương thức insertCategory
    public boolean insertCategory(Category category) {
        String sql = "INSERT INTO category (category, status) VALUES (?, ?)";
        try (PreparedStatement pstmt = connect.prepareStatement(sql)) {
            pstmt.setString(1, category.getCategory());
            pstmt.setString(2, category.getStatus());
            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        } catch (Exception ex) {
            LOGGER.log(Level.SEVERE, "Error inserting category", ex);
            return false;
        }
    }

    // Phương thức updateCategory
    public boolean updateCategory(Category category) {
        String sql = "UPDATE category SET category = ? WHERE id = ?";
        try (PreparedStatement pstmt = connect.prepareStatement(sql)) {
            pstmt.setString(1, category.getCategory());
            pstmt.setInt(2, category.getId());
            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        } catch (Exception ex) {
            LOGGER.log(Level.SEVERE, "Error updating category", ex);
            return false;
        }
    }

    // Phương thức deleteCategory (xóa mềm)
    public boolean changeStatus(int categoryId, String newSatus) {
        String sql = "UPDATE category SET status = ? WHERE id = ?";
        try (PreparedStatement pstmt = connect.prepareStatement(sql)) {
            pstmt.setString(1, newSatus);
            pstmt.setInt(2, categoryId);
            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        } catch (Exception ex) {
            LOGGER.log(Level.SEVERE, "Error deleting category", ex);
            return false;
        }
    }
}
