/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

/**
 *
 * @author ADMIN
 */
import Models.PaymentMethod;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PaymentMethodDAO extends DBContext{
    /*CREATE TABLE paymentmethod (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    image VARCHAR(255),
    description TEXT,
    active BOOLEAN DEFAULT TRUE
    
);*/
    // Phương thức để lấy danh sách tất cả các phương thức thanh toán từ cơ sở dữ liệu
    public List<PaymentMethod> getAllPaymentMethods() throws SQLException {
        List<PaymentMethod> paymentMethods = new ArrayList<>();
        String sql = "SELECT * FROM paymentmethod";
        
        try (PreparedStatement statement = connect.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {
            
            while (resultSet.next()) {
                PaymentMethod paymentMethod = new PaymentMethod();
                paymentMethod.setId(resultSet.getInt("id"));
                paymentMethod.setName(resultSet.getString("name"));
                paymentMethod.setImage(resultSet.getString("image"));
                paymentMethod.setDescription(resultSet.getString("description"));
                paymentMethods.add(paymentMethod);
            }
        }
        
        return paymentMethods;
    }

    // Phương thức để thêm một phương thức thanh toán mới vào cơ sở dữ liệu
    public void addPaymentMethod(PaymentMethod paymentMethod) throws SQLException {
        String sql = "INSERT INTO paymentmethod (name, image, description) VALUES (?, ?, ?)";
        
        try (PreparedStatement statement = connect.prepareStatement(sql)) {
            statement.setString(1, paymentMethod.getName());
            statement.setString(2, paymentMethod.getImage());
            statement.setString(3, paymentMethod.getDescription());
            
            statement.executeUpdate();
        }
    }

    // Các phương thức khác như updatePaymentMethod, deletePaymentMethod có thể được triển khai tương tự.
}
