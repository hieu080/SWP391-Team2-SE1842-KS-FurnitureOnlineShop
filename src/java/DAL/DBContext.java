/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAl;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import Models.Slider;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author ADMIN
 */
public class DBContext {
    protected Connection connect;
    public DBContext() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/furniturewebshop";
            String username = "root";
            String password = "";

            // Tạo kết nối
            connect = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        
    }
    
    
}
