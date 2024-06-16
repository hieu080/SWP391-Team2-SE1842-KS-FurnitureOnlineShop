/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.ImageFeedback;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author HELLO
 */
public class ImageFeedbackDAO extends DBContext {

    private static final java.util.logging.Logger LOGGER = java.util.logging.Logger.getLogger(OrderDAO.class.getName());

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

    public static void main(String[] args) {
        ImageFeedbackDAO ifdao = new ImageFeedbackDAO();
        ArrayList<ImageFeedback> ImageFeedbackList = ifdao.getAllImageFeedbackList();
        for (ImageFeedback imageFeedback : ImageFeedbackList) {
            System.out.println(imageFeedback.getId());
        }
    }
}
