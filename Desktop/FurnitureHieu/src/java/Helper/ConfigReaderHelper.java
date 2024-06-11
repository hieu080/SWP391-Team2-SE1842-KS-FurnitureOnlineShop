/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Helper;

/**
 *
 * @author HELLO
 */
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Properties;

public class ConfigReaderHelper {

    public int getValueOfItemsPerPage(String CONFIG_FILE_PATH, String property) {
        Properties properties = new Properties();
        try (FileInputStream fis = new FileInputStream(CONFIG_FILE_PATH +"/config.properties")) {
            properties.load(fis);
            return Integer.parseInt(properties.getProperty(property));
        } catch (IOException e) {
            e.printStackTrace();
            // Xử lý ngoại lệ nếu cần thiết
        }
        return 0; // Trả về giá trị mặc định nếu không thể đọc được từ tệp cấu hình
    }
    
    public void updateItemsPerPage(String CONFIG_FILE_PATH,String property ,int newValueOfItemsPerPage) {
    Properties properties = new Properties();
    try (FileInputStream fis = new FileInputStream(CONFIG_FILE_PATH +"/config.properties")) {
        properties.load(fis);
        properties.setProperty(property, String.valueOf(newValueOfItemsPerPage));
        try (FileOutputStream fos = new FileOutputStream(CONFIG_FILE_PATH +"/config.properties")) {
            properties.store(fos, null);
        }
    } catch (IOException e) {
        e.printStackTrace();
        // Xử lý ngoại lệ nếu cần thiết
    }
}

    
}

