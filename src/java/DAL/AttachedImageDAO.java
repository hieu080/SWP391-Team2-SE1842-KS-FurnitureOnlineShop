/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.AttachedImage;
import java.util.logging.Logger;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.logging.Level;
/**
 *
 * @author HELLO
 */
public class AttachedImageDAO extends DBContext{
    private static final Logger LOGGER = Logger.getLogger(AttachedImageDAO.class.getName());

    // Create
    public void addAttachedImage(AttachedImage attachedImage) {
        String query = "INSERT INTO AttachedImage (productdetail_id, image) VALUES (?, ?)";
        try (PreparedStatement stmt = connect.prepareStatement(query)) {
            stmt.setInt(1, attachedImage.getProductdetail_id());
            stmt.setString(2, attachedImage.getImage());
            stmt.executeUpdate();
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error adding attached image", e);
        }
    }

    // Read
    public AttachedImage getAttachedImage(int id) {
        String query = "SELECT * FROM AttachedImage WHERE id = ?";
        try (PreparedStatement stmt = connect.prepareStatement(query)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    AttachedImage attachedImage = new AttachedImage(rs.getInt("productdetail_id"), rs.getString("image"));
                    attachedImage.setId(rs.getInt("id"));
                    return attachedImage;
                }
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error retrieving attached image", e);
        }
        return null;
    }

    // Update
    public void updateAttachedImage(AttachedImage attachedImage) {
        String query = "UPDATE AttachedImage SET productdetail_id = ?, image = ? WHERE id = ?";
        try (PreparedStatement stmt = connect.prepareStatement(query)) {
            stmt.setInt(1, attachedImage.getProductdetail_id());
            stmt.setString(2, attachedImage.getImage());
            stmt.setInt(3, attachedImage.getId());
            stmt.executeUpdate();
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error updating attached image", e);
        }
    }

    // Delete
    public void deleteAttachedImage(int id) {
        String query = "DELETE FROM AttachedImage WHERE id = ?";
        try (PreparedStatement stmt = connect.prepareStatement(query)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error deleting attached image", e);
        }
    }

    // List All
    public ArrayList<AttachedImage> getAllAttachedImages() {
        ArrayList<AttachedImage> attachedImages = new ArrayList<>();
        String query = "SELECT * FROM AttachedImage";
        try (PreparedStatement stmt = connect.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                AttachedImage attachedImage = new AttachedImage(rs.getInt("productdetail_id"), rs.getString("image"));
                attachedImage.setId(rs.getInt("id"));
                attachedImages.add(attachedImage);
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error retrieving attached images", e);
        }
        return attachedImages;
    }
    
    public static void main(String[] args) {
        ArrayList<AttachedImage> attachedImages = new ArrayList<>();
        AttachedImageDAO attachedImageDAO = new AttachedImageDAO();
        attachedImages = attachedImageDAO.getAllAttachedImages();
        for (AttachedImage attachedImage : attachedImages) {
            System.out.println(attachedImage.getImage());
        }
    }
    
}
