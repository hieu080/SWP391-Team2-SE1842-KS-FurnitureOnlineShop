/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

/**
 *
 * @author HELLO
 */
import Models.Color;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.logging.Level;

public class ColorDAO extends DBContext {

    private static final java.util.logging.Logger LOGGER = java.util.logging.Logger.getLogger(ColorDAO.class.getName());
    
//    public static void main(String[] args) {
//        ColorDAO colorDAO = new ColorDAO();
//        ArrayList<Color> colorList = colorDAO.getColorList();
//        for (Color color : colorList) {
//            System.out.println(color.toString());
//        }
//    }
    public ArrayList<Color> getColorList() {
        ArrayList<Color> colorList = new ArrayList<>();
        String sql = "SELECT * FROM color";

        try (PreparedStatement pstmt = connect.prepareStatement(sql); 
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                int id = rs.getInt("id");
                String colorname = rs.getString("colorname");
                Color color = new Color(colorname);
                color.setId(id);
                colorList.add(color);
            }

        } catch (Exception ex) {
            LOGGER.log(Level.SEVERE, "Error retrieving color list", ex);
        }

        return colorList;
    }

    public boolean insertColor(Color color) {
        String sql = "INSERT INTO color (colorname) VALUES (?)";
        try (PreparedStatement pstmt = connect.prepareStatement(sql)) {
            pstmt.setString(1, color.getColorname());
            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        } catch (Exception ex) {
            LOGGER.log(Level.SEVERE, "Error inserting color", ex);
            return false;
        }
    }

    public boolean updateColor(Color color) {
        String sql = "UPDATE color SET colorname = ? WHERE id = ?";
        try (PreparedStatement pstmt = connect.prepareStatement(sql)) {
            pstmt.setString(1, color.getColorname());
            pstmt.setInt(2, color.getId());
            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        } catch (Exception ex) {
            LOGGER.log(Level.SEVERE, "Error updating color", ex);
            return false;
        }
    }

    public boolean deleteColor(int colorId) {
        String sql = "UPDATE color SET status = 'Inactive' WHERE id = ?";
        try (PreparedStatement pstmt = connect.prepareStatement(sql)) {
            pstmt.setInt(1, colorId);
            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        } catch (Exception ex) {
            LOGGER.log(Level.SEVERE, "Error deleting color", ex);
            return false;
        }
    }
}
