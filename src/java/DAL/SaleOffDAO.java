/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

/**
 *
 * @author HELLO
 */
import Models.SaleOff;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.logging.Level;

public class SaleOffDAO extends DBContext {

    private static final java.util.logging.Logger LOGGER = java.util.logging.Logger.getLogger(SaleOffDAO.class.getName());
    
//    public static void main(String[] args) {
//        SaleOffDAO saleOffDAO = new SaleOffDAO();
//        ArrayList<SaleOff> saleOffList = saleOffDAO.getSaleOffList();
//        for (SaleOff saleOff : saleOffList) {
//            System.out.println(saleOff.toString());
//        }
//    }
    // Phương thức getSaleOffList
    public ArrayList<SaleOff> getSaleOffList() {
        ArrayList<SaleOff> saleOffList = new ArrayList<>();
        String sql = "SELECT * FROM SaleOff";

        try (
            PreparedStatement pstmt = connect.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery()
        ) {
            while (rs.next()) {
                int id = rs.getInt("id");
                int productId = rs.getInt("product_id");
                int value = rs.getInt("value");
                SaleOff saleOff = new SaleOff(productId, value);
                saleOff.setId(id);
                saleOffList.add(saleOff);
            }
        } catch (Exception ex) {
            LOGGER.log(Level.SEVERE, "Error retrieving sale off list", ex);
        }

        return saleOffList;
    }

    // Phương thức insertSaleOff
    public boolean insertSaleOff(SaleOff saleOff) {
        String sql = "INSERT INTO SaleOff (product_id, value) VALUES (?, ?)";

        try (
            PreparedStatement pstmt = connect.prepareStatement(sql)
        ) {
            pstmt.setInt(1, saleOff.getProduct_id());
            pstmt.setInt(2, saleOff.getSaleoffvalue());
            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        } catch (Exception ex) {
            LOGGER.log(Level.SEVERE, "Error inserting sale off", ex);
            return false;
        }
    }

    // Phương thức updateSaleOff
    public boolean updateSaleOff(SaleOff saleOff) {
        String sql = "UPDATE SaleOff SET product_id = ?, value = ? WHERE id = ?";

        try (
            PreparedStatement pstmt = connect.prepareStatement(sql)
        ) {
            pstmt.setInt(1, saleOff.getProduct_id());
            pstmt.setInt(2, saleOff.getSaleoffvalue());
            pstmt.setInt(3, saleOff.getId());
            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        } catch (Exception ex) {
            LOGGER.log(Level.SEVERE, "Error updating sale off", ex);
            return false;
        }
    }

    // Phương thức deleteSaleOff
    public boolean deleteSaleOff(int saleOffId) {
        String sql = "DELETE FROM SaleOff WHERE id = ?";

        try (
            PreparedStatement pstmt = connect.prepareStatement(sql)
        ) {
            pstmt.setInt(1, saleOffId);
            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        } catch (Exception ex) {
            LOGGER.log(Level.SEVERE, "Error deleting sale off", ex);
            return false;
        }
    }
}

