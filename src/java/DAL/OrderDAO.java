/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Order;
import java.sql.SQLException;
import java.util.logging.Logger;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;

/**
 *
 * @author HELLO
 */
public class OrderDAO extends DBContext {

    private static final java.util.logging.Logger LOGGER = java.util.logging.Logger.getLogger(OrderDAO.class.getName());

    public Order getOrder(int order_id) {
        Order od = new Order();
        String sql = "SELECT * FROM furniture.order WHERE id = ?"; // Đổi "order" thành "orders" nếu bảng có tên là "orders".

        try (PreparedStatement pstmt = connect.prepareStatement(sql)) {
            pstmt.setInt(1, order_id);
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
        String sql = "SELECT * FROM furniture.order"; // Sửa lại "order" thành "orders"

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
                case "Cancled":
                    conditions.add("status = 'Cancled'");
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

    public ArrayList<Order> searchOrderById(int search, int sale_id) {
        ArrayList<Order> orderList = new ArrayList<>();
        String sql = "SELECT * FROM furniture.order "
                + "WHERE id = ? AND sale_id = ?";
        try (PreparedStatement pstmt = connect.prepareStatement(sql)) {
            pstmt.setInt(1, search);
            pstmt.setInt(2, sale_id);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Order order = new Order(); // Khởi tạo đối tượng Order mới trong vòng lặp
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
                LOGGER.log(Level.SEVERE, "Error processing result set", e);
            }
        } catch (Exception ex) {
            LOGGER.log(Level.SEVERE, "Error preparing statement", ex);
        }
        return orderList;
    }
    
    //lấy danh sách các đơn hàng theo trạng thái, theo sale id trên tổng đơn trong khoảng thời gian
    public List<Map<String, Object>> getOrderStats(java.sql.Date startDate, java.sql.Date endDate, String saleid, String status) {
        StringBuilder sqlBuilder = new StringBuilder("WITH RECURSIVE DateRange AS (\n"
                + "    SELECT ? AS Date -- Thay bằng startdate\n"
                + "    UNION ALL\n"
                + "    SELECT Date + INTERVAL 1 DAY\n"
                + "    FROM DateRange\n"
                + "    WHERE Date + INTERVAL 1 DAY <= ? -- Thay bằng enddate\n"
                + ")\n"
                + "SELECT\n"
                + "    d.Date,\n"
                + "    IFNULL(\n"
                + "    IFNULL(COUNT(CASE WHEN o.status = ? THEN 1 END), 0) / \n"
                + "	NULLIF(COUNT(o.id), 1),\n"
                + "    0) * 100 AS rate\n"
                + "FROM\n"
                + "	DateRange d\n"
                + "left join\n"
                + "    `furniture`.`order` o on DATE(o.orderdate) = d.Date \n");

        if (saleid != null && !saleid.isEmpty()) {
            sqlBuilder.append(" and o.sale_id=?");
        }
        sqlBuilder.append("GROUP BY d.Date ORDER BY d.Date");

        List<Map<String, Object>> orderStats = new ArrayList<>();

        // Xây dựng câu lệnh SQL và danh sách tham số dựa trên các tham số đầu vào
        try (PreparedStatement statement = connect.prepareStatement(sqlBuilder.toString())) {
            // Đặt các tham số vào câu lệnh SQL
            statement.setDate(1, startDate);
            statement.setDate(2, endDate);
            statement.setString(3, status);
            if (saleid != null && !saleid.isEmpty()) {
                statement.setString(4, saleid);
            }
            sqlBuilder.append("GROUP BY d.Date ORDER BY d.Date");

            try (ResultSet rs = statement.executeQuery()) {
                while (rs.next()) {
                    Map<String, Object> row = new HashMap<>();
                    row.put("date", rs.getDate("Date"));
                    row.put("rate", rs.getDouble("rate"));
                    orderStats.add(row);
                }
            }
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, "Error retrieving post list", ex);
        }

        return orderStats;
    }

    //lấy danh sách doanh thu của sale theo ngày
    public List<Map<String, Object>> getRevenueStats(java.sql.Date startDate, java.sql.Date endDate, String saleid) {
        StringBuilder sqlBuilder = new StringBuilder("WITH RECURSIVE DateRange AS (\n"
                + "    SELECT ? AS Date -- Thay bằng startdate\n"
                + "    UNION ALL\n"
                + "    SELECT Date + INTERVAL 1 DAY\n"
                + "    FROM DateRange\n"
                + "    WHERE Date + INTERVAL 1 DAY <= ? -- Thay bằng enddate\n"
                + ")\n"
                + "SELECT\n"
                + "    d.Date,\n"
                + "SUM(CASE WHEN o.status = 'Done' THEN o.totalcost ELSE 0 END) AS revenue\n"
                + "FROM\n"
                + "	DateRange d\n"
                + "left join\n"
                + "    `furniture`.`order` o on DATE(o.orderdate) = d.Date \n");

        if (saleid != null && !saleid.isEmpty()) {
            sqlBuilder.append(" and o.sale_id=?");
        }
        sqlBuilder.append("GROUP BY d.Date ORDER BY d.Date");

        List<Map<String, Object>> revenueStats = new ArrayList<>();

        // Xây dựng câu lệnh SQL và danh sách tham số dựa trên các tham số đầu vào
        try (PreparedStatement statement = connect.prepareStatement(sqlBuilder.toString())) {
            // Đặt các tham số vào câu lệnh SQL
            statement.setDate(1, startDate);
            statement.setDate(2, endDate);
            if (saleid != null && !saleid.isEmpty()) {
                statement.setString(3, saleid);
            }
            sqlBuilder.append("GROUP BY d.Date ORDER BY d.Date");

            try (ResultSet rs = statement.executeQuery()) {
                while (rs.next()) {
                    Map<String, Object> row = new HashMap<>();
                    row.put("date", rs.getDate("Date"));
                    row.put("revenue", rs.getInt("revenue"));
                    revenueStats.add(row);
                }
            }
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, "Error retrieving post list", ex);
        }

        return revenueStats;
    }

    //đếm số lượng các đơn hàng theo từng trạng thái
    public Map<String, Integer> getOrderCountByStatus(java.sql.Date startDate, java.sql.Date endDate) {
        Map<String, Integer> orderCountByStatus = new HashMap<>();
        String query = "SELECT status, COUNT(*) AS order_count FROM `order` WHERE orderdate BETWEEN ? AND ? GROUP BY status";

        try (
                PreparedStatement statement = connect.prepareStatement(query)) {

            statement.setDate(1, startDate);
            statement.setDate(2, endDate);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                String status = resultSet.getString("status");
                switch (status) {
                    case "Done":
                        status = "Thành công";
                        break;
                    case "Canceled":
                        status = "Đã huỷ";
                        break;
                    case "Confirmed":
                        status = "Đã xác nhận";
                        break;
                }
                int count = resultSet.getInt("order_count");
                orderCountByStatus.put(status, count);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orderCountByStatus;
    }

    //thống kê doanh thu theo productcategory
    public Map<String, Double> getRevenueByCategory(java.sql.Date startDate, java.sql.Date endDate) {
        Map<String, Double> revenueMap = new LinkedHashMap<>();
        double totalAllCategories = 0.0; // Tổng doanh thu của tất cả các danh mục
        String sql = "SELECT \n"
                + "    c.category,\n"
                + "    SUM(od.quantity * od.price) AS total_revenue\n"
                + "FROM \n"
                + "    `order` o\n"
                + "JOIN \n"
                + "    orderdetail od ON o.id = od.order_id\n"
                + "JOIN \n"
                + "    productdetail pd ON od.productdetail_id = pd.id\n"
                + "JOIN \n"
                + "    product p ON pd.product_id = p.id\n"
                + "JOIN \n"
                + "    category c ON p.category_id = c.id\n"
                + "WHERE \n"
                + "    o.status = 'Done'\n"
                + "    AND o.orderdate BETWEEN ? AND ? -- Thay bằng startdate và enddate\n"
                + "GROUP BY \n"
                + "    c.category\n"
                + "ORDER BY \n"
                + "    total_revenue DESC;";
        
        try (PreparedStatement statement = connect.prepareStatement(sql)) {

            statement.setDate(1, startDate);
            statement.setDate(2, endDate);

            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                String category = rs.getString("category");
                double totalRevenue = rs.getDouble("total_revenue");

                revenueMap.put(category, totalRevenue);

                // Tính toán tổng doanh thu của tất cả các danh mục
                totalAllCategories += totalRevenue;
            }

            // Đưa tổng doanh thu của tất cả các danh mục vào Map với key là "total_all_categories"
            revenueMap.put("Tổng", totalAllCategories);   

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return revenueMap;
    }
    
    //lấy số lượng đơn hàng thành công và tổng đơn theo từng ngày
    public List<Map<String, Object>> getSuccessAndAllOrderCounts(java.sql.Date startDate, java.sql.Date endDate) {
        List<Map<String, Object>> orderStats = new ArrayList<>();
        String query = "WITH RECURSIVE DateRange AS (" +
                       "    SELECT DATE(?) AS Date" +
                       "    UNION ALL" +
                       "    SELECT Date + INTERVAL 1 DAY" +
                       "    FROM DateRange" +
                       "    WHERE Date + INTERVAL 1 DAY <= DATE(?)" +
                       ") " +
                       "SELECT " +
                       "    d.Date, " +
                       "    SUM(CASE WHEN o.status = 'Done' THEN 1 ELSE 0 END) AS successOrder, " +
                       "    COUNT(o.id) as allOrder " +
                       "FROM " +
                       "    DateRange d " +
                       "LEFT JOIN " +
                       "    `furniture`.`order` o on DATE(o.orderdate) = d.Date " +
                       "GROUP BY d.Date " +
                       "ORDER BY d.Date;";

        try ( PreparedStatement statement = connect.prepareStatement(query)) {

            statement.setDate(1, startDate);
            statement.setDate(2, endDate);

            try (ResultSet rs = statement.executeQuery()) {
                while (rs.next()) {
                    Map<String, Object> row = new HashMap<>();
                    row.put("date", rs.getDate("Date"));
                    row.put("successOrder", rs.getInt("successOrder"));
                    row.put("allOrder", rs.getInt("allOrder"));
                    orderStats.add(row);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orderStats;
    }

    public static void main(String[] args) {
        OrderDAO o = new OrderDAO();
        System.out.println(o.getOrderCountByStatus(java.sql.Date.valueOf("2024-07-01"), java.sql.Date.valueOf("2024-07-02")));
    }
}
