package DAL;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBContext {

    protected Connection connect;

    public DBContext() {
        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
          
            String url = "jdbc:mysql://localhost:3306/furnitureshop?useSSL=false";
            String username = "root";
            String password = "123456";
            // Tạo kết nối
            connect = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    
    public static void main(String[] args) {
        System.out.println(new DBContext().connect);
    }
    
}
