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
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.Arrays;
import javax.lang.model.util.Types;

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
        try (PreparedStatement statement = connect.prepareStatement(sql)) {
            statement.setString(1, status);
            statement.setInt(2, orderId);
            statement.executeUpdate();
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error retrieving order.", e);
        }
    }

    public ArrayList<Order> OrderListOfSale(int sale_id) {
        ArrayList<Order> orderList = new ArrayList<>();
        String sql = "SELECT * FROM furniture.order WHERE sale_id = ?";
        try (PreparedStatement pstmt = connect.prepareStatement(sql)) {
            pstmt.setInt(1, sale_id);
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

    private String parseStatus(String[] statusStrs) {
        if (statusStrs == null || statusStrs.length == 0) {
            return "";
        }
        List<String> conditions = new ArrayList<>();
        for (String statusStr : statusStrs) {
            switch (statusStr) {
                case "Order":
                    conditions.add("status = 'Order'");
                    break;
                case "Done":
                    conditions.add("status = 'Done'");
                    break;
                case "Confirmed":
                    conditions.add("status = 'Confirmed'");
                    break;
                case "Cancel":
                    conditions.add("status = 'Cancel'");
                    break;
            }
        }
        return String.join(" OR ", conditions);
    }

    public ArrayList<Order> filterOrderListByManagerSale(String fromDateStr, String toDateStr, String[] status) {
        ArrayList<Order> orderList = new ArrayList<>();

        StringBuilder sql = new StringBuilder("""
            SELECT 
                id, customer_id, sale_id, address_id, totalcost, orderdate, status
            FROM 
                `Order`
            WHERE 1 = 1
        """);

        List<Object> parameters = new ArrayList<>();

        DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        if (fromDateStr != null && !fromDateStr.isEmpty()) {
            try {
                LocalDate fromDate = LocalDate.parse(fromDateStr, dateFormatter);
                LocalDateTime fromDateTime = fromDate.atStartOfDay(); // Set to start of the day
                sql.append(" AND orderdate >= ?");
                parameters.add(Timestamp.valueOf(fromDateTime));
                LOGGER.info("From date: " + fromDateTime);
            } catch (Exception e) {
                LOGGER.log(Level.SEVERE, "Invalid fromDate format.", e);
            }
        }

        if (toDateStr != null && !toDateStr.isEmpty()) {
            try {
                LocalDate toDate = LocalDate.parse(toDateStr, dateFormatter);
                LocalDateTime toDateTime = toDate.atTime(23, 59, 59); // Set to end of the day
                sql.append(" AND orderdate <= ?");
                parameters.add(Timestamp.valueOf(toDateTime));
                LOGGER.info("To date: " + toDateTime);
            } catch (Exception e) {
                LOGGER.log(Level.SEVERE, "Invalid toDate format.", e);
            }
        }
        String statusCondition = parseStatus(status);
        if (!statusCondition.isEmpty()) {
            sql.append(" AND (").append(statusCondition).append(")");
        }

        LOGGER.info("SQL Query: " + sql.toString());
        LOGGER.info("Parameters: " + parameters);

        try (PreparedStatement pstmt = connect.prepareStatement(sql.toString())) {
            for (int i = 0; i < parameters.size(); i++) {
                pstmt.setObject(i + 1, parameters.get(i));
            }

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Order order = new Order();
                    order.setId(rs.getInt("id"));
                    order.setCustomer_id(rs.getInt("customer_id"));
                    order.setSale_id(rs.getInt("sale_id"));
                    order.setAddress_id(rs.getInt("address_id"));
                    order.setTotalcost(rs.getDouble("totalcost"));
                    order.setOrderDate(rs.getTimestamp("orderdate").toLocalDateTime());
                    order.setStatus(rs.getString("status"));

                    orderList.add(order);
                }
            }
        } catch (Exception ex) {
            LOGGER.log(Level.SEVERE, "Error retrieving order list.", ex);
        }
        return orderList;
    }

    public ArrayList<Order> filterOrderList(String fromDateStr, String toDateStr, String[] status, int sale_id) {
        ArrayList<Order> orderList = new ArrayList<>();

        StringBuilder sql = new StringBuilder();
        sql.append("SELECT ")
                .append("id, customer_id, sale_id, address_id, totalcost, orderdate, status ")
                .append("FROM ")
                .append("`Order` ")
                .append("WHERE ")
                .append("sale_id = " + sale_id + " ");

        List<Object> parameters = new ArrayList<>();

        DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        if (fromDateStr != null && !fromDateStr.isEmpty()) {
            try {
                LocalDate fromDate = LocalDate.parse(fromDateStr, dateFormatter);
                LocalDateTime fromDateTime = fromDate.atStartOfDay(); // Set to start of the day
                sql.append(" AND orderdate >= ?");
                parameters.add(Timestamp.valueOf(fromDateTime));
                LOGGER.info("From date: " + fromDateTime);
            } catch (Exception e) {
                LOGGER.log(Level.SEVERE, "Invalid fromDate format.", e);
            }
        }

        if (toDateStr != null && !toDateStr.isEmpty()) {
            try {
                LocalDate toDate = LocalDate.parse(toDateStr, dateFormatter);
                LocalDateTime toDateTime = toDate.atTime(23, 59, 59); // Set to end of the day
                sql.append(" AND orderdate <= ?");
                parameters.add(Timestamp.valueOf(toDateTime));
                LOGGER.info("To date: " + toDateTime);
            } catch (Exception e) {
                LOGGER.log(Level.SEVERE, "Invalid toDate format.", e);
            }
        }
        String statusCondition = parseStatus(status);
        if (!statusCondition.isEmpty()) {
            sql.append(" AND (").append(statusCondition).append(")");
        }

        LOGGER.info("SQL Query: " + sql.toString());
        LOGGER.info("Parameters: " + parameters);

        try (PreparedStatement pstmt = connect.prepareStatement(sql.toString())) {
            for (int i = 0; i < parameters.size(); i++) {
                pstmt.setObject(i + 1, parameters.get(i));
            }

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Order order = new Order();
                    order.setId(rs.getInt("id"));
                    order.setCustomer_id(rs.getInt("customer_id"));
                    order.setSale_id(rs.getInt("sale_id"));
                    order.setAddress_id(rs.getInt("address_id"));
                    order.setTotalcost(rs.getDouble("totalcost"));
                    order.setOrderDate(rs.getTimestamp("orderdate").toLocalDateTime());
                    order.setStatus(rs.getString("status"));

                    orderList.add(order);
                }
            }
        } catch (Exception ex) {
            LOGGER.log(Level.SEVERE, "Error retrieving order list.", ex);
        }
        return orderList;
    }

    public ArrayList<Order> searchOrderByName(String name, int sale_id) {
        ArrayList<Order> orderList = new ArrayList<>();
        String sql = "SELECT `Order`.*, User.fullname \n"
                + "                FROM `Order` \n"
                + "                JOIN User ON `Order`.customer_id = User.id\n"
                + "                WHERE User.fullname LIKE ? AND sale_id = ?";
        try (PreparedStatement pstmt = connect.prepareStatement(sql)) {
            pstmt.setString(1, "%" + name + "%");
            pstmt.setInt(2, sale_id);
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
            } catch (Exception e) {
            }

        } catch (Exception ex) {
            LOGGER.log(Level.SEVERE, "Error retrieving order list", ex);
        }
        return orderList;
    }

    public ArrayList<Order> searchOrderById(String search, int sale_id) {
        ArrayList<Order> orderList = new ArrayList<>();
        String sql = "SELECT `order`.`id`,\n"
                + "    `order`.`customer_id`,\n"
                + "    `order`.`sale_id`,\n"
                + "    `order`.`address_id`,\n"
                + "    `order`.`totalcost`,\n"
                + "    `order`.`orderdate`,\n"
                + "    `order`.`status`\n"
                + "FROM `furniture`.`order`\n"
                + "WHERE id = ? AND sale_id = ?";
        try (PreparedStatement pstmt = connect.prepareStatement(sql)) {
            pstmt.setString(1, search);
            pstmt.setInt(2, sale_id);
            try (ResultSet rs = pstmt.executeQuery()) {
                Order order = new Order();
                while (rs.next()) {
                    order.setId(rs.getInt("id"));
                    order.setCustomer_id(rs.getInt("customer_id"));
                    order.setSale_id(rs.getInt("sale_id"));
                    order.setAddress_id(rs.getInt("address_id"));
                    order.setTotalcost(rs.getDouble("totalcost"));
                    java.sql.Timestamp timestamp = rs.getTimestamp("orderdate");
                    if (timestamp != null) {
                        order.setOrderDate(timestamp.toLocalDateTime());
                    }
                    order.setStatus(rs.getString("status"));
                    orderList.add(order);
                }
            } catch (Exception e) {
            }
        } catch (Exception ex) {
            LOGGER.log(Level.SEVERE, "Error retrieving order list", ex);
        }
        return orderList;
    }

    public static void main(String[] args) {
        String fromDateStr = "2024-05-25";
        String toDateStr = "2024-06-18";
        String[] status = {"Done"};
        int sale_id = 8;
        // Khởi tạo đối tượng DAO
        OrderDAO dao = new OrderDAO();

        // Gọi phương thức filterOrderList từ DAO để lấy danh sách đơn hàng lọc theo các điều kiện
        ArrayList<Order> filteredOrders = dao.filterOrderList(null, null, status, sale_id);

        // In ra thông tin các đơn hàng đã lọc được
        for (Order order : filteredOrders) {
            System.out.println(order.toString());
        }
    }
}
