/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import com.sun.jdi.connect.spi.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import static javax.management.remote.JMXConnectorFactory.connect;

/**
 *
 * @author HELLO
 */
public class ProductDetailDAO extends DBContext{
    
    
    public int getProductIdByProductDetailId(int id) {
        int productId = -1;
        String sql = "SELECT product_id FROM ProductDetail WHERE id = ?";
        // Truy vấn cơ sở dữ liệu để lấy product_id từ productdetail_id
        try {
            
            PreparedStatement pstmt = connect.prepareStatement(sql);  
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                productId = rs.getInt("product_id");
            }
        } catch(SQLException e){
            e.printStackTrace();
        }
        return productId;
    }
}

