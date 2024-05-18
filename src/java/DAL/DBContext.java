package DAL;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import io.github.cdimascio.dotenv.Dotenv;

public class DBContext {
    protected Connection connect;
    public DBContext() {
        Dotenv dotenv = Dotenv.configure()
                .directory("C:/Users/HELLO/OneDrive/Documents/NetBeansProjects/FurnitureWebShop/")  // Đường dẫn tới thư mục chứa file .env
                .load();
        try {
            String url = dotenv.get("DB_URL");
            String username = dotenv.get("DB_USER_NAME");
            String password = dotenv.get("DB_PASSWORD");
            
            // Tạo kết nối
            connect = DriverManager.getConnection(url, username, password);
            
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}
