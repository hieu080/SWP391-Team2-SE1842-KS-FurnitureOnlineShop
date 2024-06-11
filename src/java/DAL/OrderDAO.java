/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Order;
import Models.OrderDetail;
import java.util.logging.Logger;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.logging.Level;

/**
 *
 * @author HELLO
 */
public class OrderDAO extends DBContext {

    private static final java.util.logging.Logger LOGGER = java.util.logging.Logger.getLogger(OrderDAO.class.getName());

    public Order getOrder(int customer_id, int order_id) {
        Order od = new Order();
        String sql = "SELECT * FROM furniture.order WHERE id = ? AND customer_id = ?"; // Đổi "order" thành "orders" nếu bảng có tên là "orders".
        try (PreparedStatement pstmt = connect.prepareStatement(sql)) {
            pstmt.setInt(1, order_id); // Sử dụng setInt thay vì setString cho giá trị int.
            pstmt.setInt(2, customer_id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    od.setId(rs.getInt("id"));
                    od.setCustomer_id(rs.getInt("customer_id"));
                    od.setSale_id(rs.getInt("sale_id"));
                    od.setAddress_id(rs.getInt("address_id"));
                    od.setTotalcost(rs.getDouble("totalcost"));

                    // Chuyển đổi từ Timestamp sang LocalDateTime
                    java.sql.Timestamp timestamp = rs.getTimestamp("orderdate");
                    if (timestamp != null) {
                        od.setOrderDate(timestamp.toLocalDateTime());
                    }
                   od.setStatus(rs.getString("status"));
                    return od;
                }
            }
        } catch (Exception ex) {
            LOGGER.log(Level.SEVERE, "Error retrieving order.", ex);
        }
        return null;
    }

    public ArrayList<Order> getOrderList() {
        ArrayList<Order> orderList = new ArrayList<>();
        String sql = "SELECT * FROM furniture.order";
        try (PreparedStatement pstmt = connect.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Order od = new Order();
                od.setId(rs.getInt("id"));
                od.setCustomer_id(rs.getInt("customer_id"));
                od.setSale_id(rs.getInt("sale_id"));
                od.setAddress_id(rs.getInt("address_id"));
                od.setTotalcost(rs.getDouble("totalcost"));
                // Chuyển đổi từ Timestamp sang LocalDateTime
                java.sql.Timestamp timestamp = rs.getTimestamp("orderdate");
                if (timestamp != null) {
                    od.setOrderDate(timestamp.toLocalDateTime());
                }
                od.setStatus(rs.getString("status"));
                orderList.add(od);
            }

        } catch (Exception ex) {
            LOGGER.log(Level.SEVERE, "Error retrieving order list", ex);
        }
        return orderList;
    }

    public ArrayList<Order> myOrder(int customer_id) {
        ArrayList<Order> orderList = new ArrayList<>();
        String sql = "SELECT * FROM furniture.order WHERE customer_id = ?";
        try (PreparedStatement pstmt = connect.prepareStatement(sql)) {
            pstmt.setInt(1, customer_id);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Order od = new Order();
                    od.setId(rs.getInt("id"));
                    od.setCustomer_id(rs.getInt("customer_id"));
                    od.setSale_id(rs.getInt("sale_id"));
                    od.setAddress_id(rs.getInt("address_id"));
                    od.setTotalcost(rs.getDouble("totalcost"));
                    // Chuyển đổi từ Timestamp sang LocalDateTime
                    java.sql.Timestamp timestamp = rs.getTimestamp("orderdate");
                    if (timestamp != null) {
                        od.setOrderDate(timestamp.toLocalDateTime());
                    }
                    od.setStatus(rs.getString("status"));
                    orderList.add(od);
                }
            }
        } catch (Exception ex) {
            LOGGER.log(Level.SEVERE, "Error retrieving order list", ex);
        }
        return orderList;
    }

    public Order getMyOrder(int order_id) {
        Order od = new Order();
        String sql = "SELECT * FROM furniture.order WHERE id = ? "; // Đổi "order" thành "orders" nếu bảng có tên là "orders".
        try (PreparedStatement pstmt = connect.prepareStatement(sql)) {
            pstmt.setInt(1, order_id); // Sử dụng setInt thay vì setString cho giá trị int.
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    od.setId(rs.getInt("id"));
                    od.setCustomer_id(rs.getInt("customer_id"));
                    od.setSale_id(rs.getInt("sale_id"));
                    od.setAddress_id(rs.getInt("address_id"));
                    od.setTotalcost(rs.getDouble("totalcost"));
                    // Chuyển đổi từ Timestamp sang LocalDateTime
                    java.sql.Timestamp timestamp = rs.getTimestamp("orderdate");
                    if (timestamp != null) {
                        od.setOrderDate(timestamp.toLocalDateTime());
                    }
                    od.setStatus(rs.getString("status"));
                    return od;
                }
            }
        } catch (Exception ex) {
            LOGGER.log(Level.SEVERE, "Error retrieving order.", ex);
        }
        return null;
    }

    public void updateOrderStatus(int orderId, String status) {
        String sql = "UPDATE `furniture`.`order`\n"
                + "SET\n"
                + "`status` = ?\n"
                + "WHERE `id` = ?;";
        try (PreparedStatement statement = connect.prepareStatement(sql)){
            statement.setString(1, status);
            statement.setInt(2, orderId);
            statement.executeUpdate();
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error retrieving order.", e);
        }
    }

    public static void main(String[] args) {
        OrderDAO dao = new OrderDAO();
        ArrayList<Order> orderList = dao.myOrder(1);
        //Order order = new Order();
        for (Order order : orderList) {
            System.out.println(order.toString()); // This will call toString() method of Order class
        }
        int[] order_IDs = new int[orderList.size()];
        for (int i = 0; i < orderList.size(); i++) {
            order_IDs[i] = orderList.get(i).getId();
        }
        for (int order_ID : order_IDs) {
            System.out.println(order_ID);
        }
        // System.out.println(orderList);
    }
}
