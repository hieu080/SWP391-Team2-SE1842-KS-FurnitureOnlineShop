/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

/**
 *
 * @author HELLO
 */
import Models.Feedback;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class FeedbackDAO extends DBContext {

    private static final Logger LOGGER = Logger.getLogger(FeedbackDAO.class.getName());

    public static void main(String[] args) {
        FeedbackDAO feedbackDAO = new FeedbackDAO();
        ArrayList<Feedback> feedbackList = feedbackDAO.getFeedbackList();
        for (Feedback feedback : feedbackList) {
            System.out.println(feedback.getVotescore());
        }
    }
    // Phương thức getFeedbackList
    public ArrayList<Feedback> getFeedbackList() {
        ArrayList<Feedback> feedbackList = new ArrayList<>();
        String sql = "SELECT * FROM Feedback";

        try (
                PreparedStatement pstmt = connect.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                int id = rs.getInt("id");
                int customerId = rs.getInt("customer_id");
                int productId = rs.getInt("product_id");
                int voteScore = rs.getInt("votescore");
                String feedbackStr = rs.getString("feedback");
                String status = rs.getString("status");
                Feedback feedback = new Feedback(customerId, productId, voteScore, feedbackStr);
                feedback.setId(id);
                feedback.setStatus(status);
                feedbackList.add(feedback);
            }
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, "Error retrieving feedback list", ex);
        }

        return feedbackList;
    }

    // Phương thức insertFeedback
    public boolean insertFeedback(Feedback feedback) {
        String sql = "INSERT INTO Feedback (customer_id, product_id, votescore, feedback, status) VALUES (?, ?, ?, ?, ?)";

        try (
                PreparedStatement pstmt = connect.prepareStatement(sql)) {
            pstmt.setInt(1, feedback.getCustomer_id());
            pstmt.setInt(2, feedback.getProduct_id());
            pstmt.setInt(3, feedback.getVotescore());
            pstmt.setString(4, feedback.getFeedback());
            pstmt.setString(5, feedback.getStatus());
            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, "Error inserting feedback", ex);
            return false;
        }
    }

    // Phương thức updateFeedback
    public boolean updateFeedback(Feedback feedback) {
        String sql = "UPDATE Feedback SET votescore = ?, feedback = ?, status = ? WHERE id = ?";

        try (
                PreparedStatement pstmt = connect.prepareStatement(sql)) {
            pstmt.setInt(1, feedback.getVotescore());
            pstmt.setString(2, feedback.getFeedback());
            pstmt.setString(3, feedback.getStatus());
            pstmt.setInt(4, feedback.getId());
            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, "Error updating feedback", ex);
            return false;
        }
    }

    // Phương thức deleteFeedback
    public boolean deleteFeedback(int feedbackId) {
        String sql = "DELETE FROM Feedback WHERE id = ?";

        try (
                PreparedStatement pstmt = connect.prepareStatement(sql)) {
            pstmt.setInt(1, feedbackId);
            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, "Error deleting feedback", ex);
            return false;
        }
    }

    public boolean sendFeedback(int customer_id, int product_id, int votescore, String feedback, String status) {
        String sql = "INSERT INTO feedback (customer_id, product_id, votescore, feedback, status) VALUES (?, ?, ?, ?, ?)";

        try (
                PreparedStatement stm = connect.prepareStatement(sql)) {
            stm.setInt(1, customer_id);
            stm.setInt(2, product_id);
            stm.setInt(3, votescore);
            stm.setString(4, feedback);
            stm.setString(5, status);
            stm.executeUpdate();
            return true;
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error sending feedback", e);
            return false;
        }
    }

    public boolean insertImageFb(int feedback_id, String image) {
        String sql = "INSERT INTO imagefeedback (feedback_id, image) VALUES (?, ?)";

        try (
                PreparedStatement stm = connect.prepareStatement(sql)) {
            stm.setInt(1, feedback_id);
            stm.setString(2, image);
            stm.executeUpdate();
            return true;
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error inserting image feedback", e);
            return false;
        }
    }
}
