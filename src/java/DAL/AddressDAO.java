/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Address;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;

/**
 *
 * @author HELLO
 */
public class AddressDAO extends DBContext {
    // Add a new address

    public boolean addAddress(Address address) {
        String sql = "INSERT INTO address (customer_id,fullname, phonenumber, address, addressdetail, status) VALUES (?, ?, ? , ?, ?, ?)";

        try (PreparedStatement stmt = connect.prepareStatement(sql)) {

            stmt.setInt(1, address.getCustomer_id());
            stmt.setString(2, address.getFullname());
            stmt.setString(3, address.getPhonenumber());
            stmt.setString(4, address.getAddress());
            stmt.setString(5, address.getAddressdetail());
            stmt.setString(6, address.getStatus());

            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Update an existing address
    public boolean updateAddress(Address address) {
        String sql = "UPDATE address SET fullname = ?, phonenumber = ?, address = ?, addressdetail = ?, status = ? WHERE id = ?";

        try (
                PreparedStatement stmt = connect.prepareStatement(sql)) {

            stmt.setString(1, address.getFullname());
            stmt.setString(2, address.getPhonenumber());
            stmt.setString(3, address.getAddress());
            stmt.setString(4, address.getAddressdetail());
            stmt.setString(5, address.getStatus());
            stmt.setInt(6, address.getId());

            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateStatusAddress(String status , int customerid) {
        String sql = "UPDATE address SET  status = ? WHERE customer_id=? ";

        try (
                PreparedStatement stmt = connect.prepareStatement(sql)) {

            stmt.setString(1, status);
            stmt.setInt(2, customerid);
            

            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Delete an address
    public boolean deleteAddress(int id) {
        String sql = "DELETE FROM address WHERE id = ?";

        try (
                PreparedStatement stmt = connect.prepareStatement(sql)) {

            stmt.setInt(1, id);

            int rowsDeleted = stmt.executeUpdate();
            return rowsDeleted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Get an address by id
    public Address getAddressById(int id) {
        String sql = "SELECT * FROM address WHERE id = ?";

        try (
                PreparedStatement stmt = connect.prepareStatement(sql)) {

            stmt.setInt(1, id);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    Address address = new Address();
                    address.setId(rs.getInt("id"));
                    address.setCustomer_id(rs.getInt("customer_id"));
                    address.setPhonenumber(rs.getString("phonenumber"));
                    address.setAddress(rs.getString("address"));
                    address.setAddressdetail(rs.getString("addressdetail"));
                    address.setStatus(rs.getString("status"));
                    return address;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Address getAddressById(int id, int customerid) {
        String sql = "SELECT * FROM address WHERE id = ? AND customer_id= ?";

        try (
                PreparedStatement stmt = connect.prepareStatement(sql)) {

            stmt.setInt(1, id);
            stmt.setInt(2, customerid);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    Address address = new Address();
                    address.setId(rs.getInt("id"));
                    address.setCustomer_id(rs.getInt("customer_id"));
                    address.setFullname(rs.getString("fullname"));
                    address.setPhonenumber(rs.getString("phonenumber"));
                    address.setAddress(rs.getString("address"));
                    address.setAddressdetail(rs.getString("addressdetail"));
                    address.setStatus(rs.getString("status"));
                    return address;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Address> getAddressByCustomerId(int id) {
        List<Address> addresses = new ArrayList<>();
        String sql = "SELECT * FROM address WHERE customer_id = ?";

        try (
                PreparedStatement stmt = connect.prepareStatement(sql)) {

            stmt.setInt(1, id);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Address address = new Address();
                    address.setId(rs.getInt("id"));
                    address.setCustomer_id(rs.getInt("customer_id"));
                     address.setFullname(rs.getString("fullname"));
                    address.setPhonenumber(rs.getString("phonenumber"));
                    address.setAddress(rs.getString("address"));
                    address.setAddressdetail(rs.getString("addressdetail"));
                    address.setStatus(rs.getString("status"));
                    addresses.add(address);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return addresses;
    }

    // Get all addresses
    public List<Address> getAllAddresses() {
        List<Address> addresses = new ArrayList<>();
        String sql = "SELECT * FROM address";

        try (
                PreparedStatement stmt = connect.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Address address = new Address();
                address.setId(rs.getInt("id"));
                address.setCustomer_id(rs.getInt("customer_id"));
                 address.setFullname(rs.getString("fullname"));
                address.setPhonenumber(rs.getString("phonenumber"));
                address.setAddress(rs.getString("address"));
                address.setAddressdetail(rs.getString("addressdetail"));
                address.setStatus(rs.getString("status"));
                addresses.add(address);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return addresses;
    }
}
