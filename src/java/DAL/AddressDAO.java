/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Address;
import java.util.ArrayList;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author HELLO
 */
public class AddressDAO extends DBContext{
    private static final Logger LOGGER = Logger.getLogger(ProductDAO.class.getName());
    
    public ArrayList<Address> getAddressList(){
        ArrayList<Address> addressList = new ArrayList<>();
        String sql = "SELECT * FROM furniture.address";
        try (PreparedStatement statement = connect.prepareStatement(sql); ResultSet rs = statement.executeQuery();){
            while(rs.next()){
                Address address = new Address();
                address.setId(rs.getInt("id"));
                address.setCustomer_id(rs.getInt("customer_id"));
                address.setPhonenumber(rs.getString("phonenumber"));
                address.setAddress(rs.getString("address"));
                address.setStatus(rs.getString("status"));
                addressList.add(address);
                
            }
            return addressList;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error retrieving product list", e);
        }
        return null;
    }
    
    public static void main(String[] args) {
        AddressDAO dao = new AddressDAO();
        ArrayList<Address> addresses = dao.getAddressList();
        for (Address addresse : addresses) {
            System.out.println(addresse.toString());
        }
    }
}
