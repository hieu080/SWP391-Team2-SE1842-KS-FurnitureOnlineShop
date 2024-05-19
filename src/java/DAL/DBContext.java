package DAL;

import io.github.cdimascio.dotenv.Dotenv;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBContext {
    protected Connection connect;
    public DBContext() {
        Dotenv dotenv = Dotenv.configure()
                .directory("C:/Users/HELLO/OneDrive/Documents/NetBeansProjects/FurnitureWebShop/")
                .load();
        try {
            String url = dotenv.get("DB_URL");
            String username = dotenv.get("DB_USERNAME");
            String password = dotenv.get("DB_PASSWORD");
            
            // Tạo kết nối
            connect = DriverManager.getConnection(url, username, password);
            
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}
