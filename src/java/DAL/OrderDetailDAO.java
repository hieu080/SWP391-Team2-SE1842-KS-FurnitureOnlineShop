/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

/**
 *
 * @author HELLO
 */
import Models.OrderDetail;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class OrderDetailDAO extends DBContext {

    private static final Logger LOGGER = Logger.getLogger(OrderDetailDAO.class.getName());

    // Phương thức insertOrderDetail
    public boolean insertOrderDetail(OrderDetail orderDetail) {
        String sql = "INSERT INTO OrderDetail (order_id, product_id, quantity, price) VALUES (?, ?, ?, ?)";

        try (
            PreparedStatement pstmt = connect.prepareStatement(sql)
        ) {
            pstmt.setInt(1, orderDetail.getOrder_id());
            pstmt.setInt(2, orderDetail.getProduct_id());
            pstmt.setInt(3, orderDetail.getQuantity());
            pstmt.setDouble(4, orderDetail.getPrice());
            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, "Error inserting order detail", ex);
            return false;
        }
    }

    // Phương thức updateOrderDetail
    public boolean updateOrderDetail(OrderDetail orderDetail) {
        String sql = "UPDATE OrderDetail SET quantity = ?, price = ? WHERE id = ?";

        try (
            PreparedStatement pstmt = connect.prepareStatement(sql)
        ) {
            pstmt.setInt(1, orderDetail.getQuantity());
            pstmt.setDouble(2, orderDetail.getPrice());
            pstmt.setInt(3, orderDetail.getId());
            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, "Error updating order detail", ex);
            return false;
        }
    }

    // Phương thức deleteOrderDetail
    public boolean deleteOrderDetail(int orderDetailId) {
        String sql = "DELETE FROM OrderDetail WHERE id = ?";

        try (
            PreparedStatement pstmt = connect.prepareStatement(sql)
        ) {
            pstmt.setInt(1, orderDetailId);
            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, "Error deleting order detail", ex);
            return false;
        }
    }

    // Phương thức getOrderDetailsByOrderId
    public ArrayList<OrderDetail> getOrderDetailsByOrderId(int orderId) {
        ArrayList<OrderDetail> orderDetails = new ArrayList<>();
        String sql = "SELECT * FROM OrderDetail WHERE order_id = ?";

        try (
            PreparedStatement pstmt = connect.prepareStatement(sql)
        ) {
            pstmt.setInt(1, orderId);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setId(rs.getInt("id"));
                orderDetail.setOrder_id(rs.getInt("order_id"));
                orderDetail.setProduct_id(rs.getInt("product_id"));
                orderDetail.setQuantity(rs.getInt("quantity"));
                orderDetail.setPrice(rs.getDouble("price"));
                orderDetails.add(orderDetail);
            }
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, "Error retrieving order details by order id", ex);
        }

        return orderDetails;
    }
    
    public ArrayList<OrderDetail> getOrderDetailsList() {
        ArrayList<OrderDetail> orderDetails = new ArrayList<>();
        String sql = "SELECT * FROM OrderDetail";

        try (
            PreparedStatement pstmt = connect.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery()
        ) {
            while (rs.next()) {
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setId(rs.getInt("id"));
                orderDetail.setOrder_id(rs.getInt("order_id"));
                orderDetail.setProduct_id(rs.getInt("product_id"));
                orderDetail.setQuantity(rs.getInt("quantity"));
                orderDetail.setPrice(rs.getDouble("price"));
                orderDetails.add(orderDetail);
            }
        } catch (Exception ex) {
            LOGGER.log(Level.SEVERE, "Error retrieving all order details", ex);
        }

        return orderDetails;
    }
}
