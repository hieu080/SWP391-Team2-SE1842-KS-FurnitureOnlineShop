/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.ImageFeedback;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.SQLException;
import java.util.logging.Level;
/**
 *
 * @author HELLO
 */
public class ImageFeedbackDAO extends DBContext {

    private static final java.util.logging.Logger LOGGER = java.util.logging.Logger.getLogger(ImageFeedbackDAO.class.getName());

    public ArrayList<ImageFeedback> getAllImageFeedbackList() {
        ArrayList<ImageFeedback> ImageFeedbackList = new ArrayList<>();
        String sql = "SELECT * FROM imagefeedback";
        try (PreparedStatement pstmt = connect.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {                
                ImageFeedback imageFeedback = new ImageFeedback();
                imageFeedback.setId(rs.getInt("id"));
                imageFeedback.setFeedback_id(rs.getInt("feedback_id"));
                imageFeedback.setImage(rs.getString("image"));
                
                ImageFeedbackList.add(imageFeedback);
            }
            return ImageFeedbackList;
        } catch (Exception e) {
            return null;
        }
    }
    
    public ArrayList<ImageFeedback> getImageFeedbackList(int feedback_id) {
        ArrayList<ImageFeedback> ImagefeedbackList = new ArrayList<>();
        String sql = "select * from imagefeedback where feedback_id = "+feedback_id;
        try (
                PreparedStatement pstmt = connect.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                int id = rs.getInt(1);
                int customerId = rs.getInt(2);
                String image = rs.getString(3);
                ImageFeedback ifm = new ImageFeedback(id, feedback_id, image);
                ImagefeedbackList.add(ifm);
            }
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, "Error retrieving feedback list", ex);
        }

        return ImagefeedbackList;
    }
    
    public void updateImageFeedbackList(ArrayList<ImageFeedback> imageFeedbackList) {
    String sql = "UPDATE imagefeedback SET feedback_id = ?, image = ? WHERE id = ?";
    try (PreparedStatement pstmt = connect.prepareStatement(sql)) {
        for (ImageFeedback imageFeedback : imageFeedbackList) {
            pstmt.setInt(1, imageFeedback.getFeedback_id());
            pstmt.setString(2, imageFeedback.getImage());
            pstmt.setInt(3, imageFeedback.getId());
            pstmt.addBatch();  
        }
        pstmt.executeBatch();  
    } catch (SQLException ex) {
        LOGGER.log(Level.SEVERE, "Error updating image feedback list", ex);
    }
}


    public static void main(String[] args) {
        ImageFeedbackDAO ifdao = new ImageFeedbackDAO();
        ArrayList<ImageFeedback> ImageFeedbackList = ifdao.getAllImageFeedbackList();
        for (ImageFeedback imageFeedback : ImageFeedbackList) {
            System.out.println(imageFeedback.getId());
        }
    }
}
