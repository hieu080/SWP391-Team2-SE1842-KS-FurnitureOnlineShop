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
import Models.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class FeedbackDAO extends DBContext {

    private static final Logger LOGGER = Logger.getLogger(FeedbackDAO.class.getName());

    public static void main(String[] args) {
        FeedbackDAO fdao = new FeedbackDAO();
        ArrayList<Feedback> feedbacks = fdao.getFeedbackListByProductId(5);
        for (Feedback feedback : feedbacks) {
            System.out.println(feedback.getId());
        }
    }
    public ArrayList<Feedback> getFeedbackListByProductId(int productId) {
        ArrayList<Feedback> feedbackList = new ArrayList<>();
        String sql = "SELECT * FROM Feedback WHERE product_id = ? AND status = 'None'";

        try (PreparedStatement pstmt = connect.prepareStatement(sql)) {
            pstmt.setInt(1, productId);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                int customerId = rs.getInt("customer_id");
                int productIdFromDb = rs.getInt("product_id"); // Rename to productIdFromDb to avoid conflict
                int voteScore = rs.getInt("votescore");
                String feedbackStr = rs.getString("feedback");
                String status = rs.getString("status");

                Feedback feedback = new Feedback(customerId, productIdFromDb, voteScore, feedbackStr);
                feedback.setId(id);
                feedback.setStatus(status);

                feedbackList.add(feedback);
            }
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, "Error retrieving feedback list", ex);
        }

        return feedbackList;
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
        String sql = "UPDATE Feedback SET status = 'Hide' WHERE id = ?";

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

    public ArrayList<Feedback> SearchList(int vote, String status, String customer_name, String product_name, String Description, int index, int pagesize) {
        ArrayList<Feedback> feedbackList = new ArrayList<>();
        //String sql11 = "select * from feedback where status like '%Active%' and votescore = 5 and feedback like '%jkahsahjks%'  limit 5 offset 5;";
        UserDAO ud = new UserDAO();
        ProductDAO pd = new ProductDAO();
        String sql = "select * from feedback \n"
                + "where ";
        if (status.length() != 0) {
            sql += " status like'%" + status + "%' and ";
        }
        if (vote == 0) {
            sql += " feedback like '%" + Description + "%'\n"
                    + "order by id asc\n"
                    + "limit " + pagesize + " offset " + (index - 1) * pagesize;
        } else {
            sql += "  votescore = " + vote + " and feedback like '%" + Description + "%'\n"
                    + "order by id asc\n"
                    + "limit " + pagesize + " offset " + (index - 1) * pagesize;
        }
        System.out.println(sql);

        try (
                PreparedStatement pstmt = connect.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                int id = rs.getInt("id");
                int customerId = rs.getInt("customer_id");
                //System.out.println(ud.getUserNameByID(customerId)+" "+customer_name);
                //System.out.println(ud.getUserNameByID(customerId).contains(customer_name));
                String customer_name_str = ud.getUserNameByID(customerId);
                if (!customer_name_str.contains(customer_name)) {
                    continue;
                }
                int productId = rs.getInt("product_id");
                String product_name_str = pd.getProductName(productId);
                if (!product_name_str.contains(product_name)) {
                    continue;
                }
                int voteScore = rs.getInt("votescore");
                String feedbackStr = rs.getString("feedback");
                String status1 = rs.getString("status");
                Feedback feedback = new Feedback(customerId, productId, voteScore, feedbackStr);
                feedback.setId(id);
                feedback.setStatus(status1);
                feedback.setCustomer_Name(customer_name_str);
                feedback.setProduct_Name(product_name_str);
                feedbackList.add(feedback);
            }
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, "Error retrieving feedback list", ex);
        }

        return feedbackList;
    }

    public Feedback GetFeedbackByID(int id_re) {
        UserDAO ud = new UserDAO();
        ProductDAO pd = new ProductDAO();
        String sql = "select * from feedback where id= " + id_re;
        try (
                PreparedStatement pstmt = connect.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                int id = rs.getInt("id");
                int customerId = rs.getInt("customer_id");
                //System.out.println(customerId+"sang");
                User u = ud.getUserById1(customerId);
                String customer_name_str = ud.getUserNameByID(customerId);
                int productId = rs.getInt("product_id");
                String product_name_str = pd.getProductName(productId);
                int voteScore = rs.getInt("votescore");
                String feedbackStr = rs.getString("feedback");
                String status1 = rs.getString("status");
                Feedback feedback = new Feedback(customerId, productId, voteScore, feedbackStr);
                feedback.setId(id);
                feedback.setStatus(status1);
                feedback.setCustomer_Name(customer_name_str);
                feedback.setProduct_Name(product_name_str);
                feedback.setUser(u);
                return feedback;
            }
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, "Error retrieving feedback list", ex);
        }
        return null;
    }

    public boolean changeStatus(int id, String status) {
        String sql = "update feedback set status = '" + status + "' where id = " + id;
        try (
                PreparedStatement pstmt = connect.prepareStatement(sql)) {
            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, "Error updating feedback", ex);
            return false;
        }
    }

    public String getImageFeedback(int id) throws SQLException {
        String sql = "select image from ImageFeedback where id = ?";
        try {
            PreparedStatement pstmt = connect.prepareStatement(sql);
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public int getFeedbackWithMaxId() {
        int fbid = 0;
        String sql = "SELECT id FROM Feedback ORDER BY id DESC LIMIT 1";

        try (PreparedStatement stm = connect.prepareStatement(sql)) {
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                fbid = rs.getInt("id");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return fbid;
    }

    public void insertHistory(int orderId, int feedbackId) {
        String sql = "INSERT INTO HistoryOrderFeedback (order_id, feedback_id) VALUES (?, ?)";

        try (PreparedStatement preparedStatement = connect.prepareStatement(sql)) {
            // Đặt các tham số cho câu lệnh SQL
            preparedStatement.setInt(1, orderId);
            preparedStatement.setInt(2, feedbackId);

            // Thi hành câu lệnh SQL
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace(); // In ra lỗi nếu có
        }
    }
    

    public int[] getHistory() {
        String sql = "SELECT order_id FROM HistoryOrderFeedback";
        List<Integer> orderIds = new ArrayList<>();

        try (PreparedStatement preparedStatement = connect.prepareStatement(sql);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                int orderId = resultSet.getInt("order_id");
                orderIds.add(orderId);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // In ra lỗi nếu có
        }

        // Chuyển danh sách orderIds thành mảng
        return orderIds.stream().mapToInt(i -> i).toArray();
    }

}
