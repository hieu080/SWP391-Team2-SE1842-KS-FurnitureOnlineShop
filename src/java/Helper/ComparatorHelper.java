package Helper;

import DAL.ProductDAO;
import DAL.UserDAO;
import DAL.UserRoleDAO;
import Models.Order;
import Models.Product;
import Models.User;
import Models.UserRole;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class ComparatorHelper {

    private static final List<String> statusOrder = Arrays.asList("Order", "Confirmed", "Done", "Cancel");

    public static Comparator<Product> sortByPriceAsc() {
        return Comparator.comparingDouble(Product::getPrice);
    }

    public static Comparator<Product> sortByPriceDesc() {
        return Comparator.comparingDouble(Product::getPrice).reversed();
    }

    public static Comparator<Product> sortByQuantityAsc() {
        return Comparator.comparingInt(Product::getQuantity);
    }

    public static Comparator<Product> sortByQuantityDesc() {
        return Comparator.comparingInt(Product::getQuantity).reversed();
    }

    public static Comparator<Product> sortByStarAsc() {
        return Comparator.comparingDouble(Product::getStaravg);
    }

    public static Comparator<Product> sortByStarDesc() {
        return Comparator.comparingDouble(Product::getStaravg).reversed();
    }

    public ArrayList<Product> sortProductList(ArrayList<Product> productList, String sortby) {
        if (sortby.equals("priceAsc")) {
            Collections.sort(productList, ComparatorHelper.sortByPriceAsc());
        } else if (sortby.equals("priceDesc")) {
            Collections.sort(productList, ComparatorHelper.sortByPriceDesc());
        } else if (sortby.equals("quantityAsc")) {
            Collections.sort(productList, ComparatorHelper.sortByQuantityAsc());
        } else if (sortby.equals("quantityDesc")) {
            Collections.sort(productList, ComparatorHelper.sortByQuantityDesc());
        } else if (sortby.equals("starAsc")) {
            Collections.sort(productList, ComparatorHelper.sortByStarAsc());
        } else if (sortby.equals("starDesc")) {
            Collections.sort(productList, ComparatorHelper.sortByStarDesc());
        }
        return productList;
    }

    public static Comparator<Order> sortByOrderDateAsc() {
        return Comparator.comparing(Order::getOrderDate);
    }

    public static Comparator<Order> sortByOrderDateDesc() {
        return Comparator.comparing(Order::getOrderDate).reversed();
    }

    public static Comparator<User> sortByNameAsc() {
        return Comparator.comparing(User::getFullname);
    }

    public static Comparator<User> sortByNameDesc() {
        return Comparator.comparing(User::getFullname).reversed();
    }

    public static Comparator<Order> sortByTotalCostAsc() {
        return Comparator.comparing(Order::getTotalcost);
    }

    public static Comparator<Order> sortByTotalCostDesc() {
        return Comparator.comparing(Order::getTotalcost).reversed();
    }

    public static Comparator<Order> sortByStatusAsc() {
        return Comparator.comparingInt(order -> statusOrder.indexOf(order.getStatus()));
    }

    // Phương thức trả về Comparator để sắp xếp Order theo trạng thái giảm dần
    public static Comparator<Order> sortByStatusDesc() {
        return sortByStatusAsc().reversed();
    }

    public ArrayList<Order> sortOrderList(ArrayList<Order> orderList, String sortby, ArrayList<User> userList) {
        if (sortby.equals("dateAsc")) {
            Collections.sort(orderList, ComparatorHelper.sortByOrderDateAsc());
            return orderList;
        } else if (sortby.equals("dateDesc")) {
            Collections.sort(orderList, ComparatorHelper.sortByOrderDateDesc());
            return orderList;
        } else if (sortby.equals("nameAsc")) {
            Collections.sort(userList, ComparatorHelper.sortByNameAsc());
            ArrayList<Order> sortedOrders = new ArrayList<>();
            for (User user : userList) {
                for (Order order : orderList) {
                    if (user.getId() == order.getCustomer_id()) {
                        sortedOrders.add(order);
                    }
                }
            }
            return sortedOrders;
        } else if (sortby.equals("nameDesc")) {
            Collections.sort(userList, ComparatorHelper.sortByNameDesc());
            ArrayList<Order> sortedOrders = new ArrayList<>();
            for (User user : userList) {
                for (Order order : orderList) {
                    if (user.getId() == order.getCustomer_id()) {
                        sortedOrders.add(order);
                    }
                }
            }
            return sortedOrders;
        } else if (sortby.equals("totalCostAsc")) {
            Collections.sort(orderList, ComparatorHelper.sortByTotalCostAsc());
            return orderList;
        } else if (sortby.equals("totalCostDesc")) {
            Collections.sort(orderList, ComparatorHelper.sortByTotalCostDesc());
            return orderList;
        } else if (sortby.equals("statusAsc")) {
            Collections.sort(orderList, ComparatorHelper.sortByStatusAsc());
            return orderList;
        } else {
            Collections.sort(orderList, ComparatorHelper.sortByStatusDesc());
            return orderList;
        }
    }

    public static Comparator<User> sortByIdAsc() {
        return Comparator.comparing(User::getId);
    }

    public static Comparator<User> sortByIdDesc() {
        return Comparator.comparing(User::getId).reversed();
    }

//    public static Comparator<User> sortByFullNameAsc() {
//        return Comparator.comparing(User::getFullname);
//    }
//    public static Comparator<User> sortByFullNameDesc() {
//        return Comparator.comparing(User::getFullname).reversed();
//    }
    public static Comparator<User> sortByGenderAsc() {
        return Comparator.comparing(User::getGender);
    }

    public static Comparator<User> sortByGenderDesc() {
        return Comparator.comparing(User::getGender).reversed();
    }

    public static Comparator<User> sortByEmailAsc() {
        return Comparator.comparing(User::getEmail);
    }

    public static Comparator<User> sortByEmailDesc() {
        return Comparator.comparing(User::getEmail).reversed();
    }

    public static Comparator<User> sortByPhoneAsc() {
        return Comparator.comparing(User::getPhonenumber);
    }

    public static Comparator<User> sortByPhoneDesc() {
        return Comparator.comparing(User::getPhonenumber).reversed();
    }
//    public static Comparator<User> sortByRole_idAsc() {
//        return Comparator.comparing(User::getRole_id);
//    }
//    public static Comparator<User> sortByRole_idDesc() {
//        return Comparator.comparing(User::getRole_id).reversed();
//    }

    public static Comparator<UserRole> sortByUserRoleAsc() {
        return Comparator.comparing(UserRole::getRolename);
    }

    public static Comparator<UserRole> sortByUserRoleDesc() {
        return Comparator.comparing(UserRole::getRolename).reversed();
    }

    public static Comparator<User> sortByStatusUserAsc() {
        return Comparator.comparing(User::getStatus);
    }

    public static Comparator<User> sortByStatusUserDesc() {
        return Comparator.comparing(User::getStatus).reversed();
    }

    public ArrayList<User> sortUserList(ArrayList<User> userList, String sortby, ArrayList<UserRole> userRole) {
        ArrayList<User> sortedList = new ArrayList<>();
        if (sortby.equals("IdAsc")) {
            Collections.sort(userList, ComparatorHelper.sortByIdAsc());
            return userList;
        } else if (sortby.equals("IdDesc")) {
            Collections.sort(userList, ComparatorHelper.sortByIdDesc());
            return userList;
        } else if (sortby.equals("fullnameAsc")) {
            Collections.sort(userList, ComparatorHelper.sortByNameAsc());
            return userList;
        } else if (sortby.equals("fullnameDesc")) {
            Collections.sort(userList, ComparatorHelper.sortByNameDesc());
            return userList;
        } else if (sortby.equals("genderAsc")) {
            Collections.sort(userList, ComparatorHelper.sortByGenderAsc());
            return userList;
        } else if (sortby.equals("genderDesc")) {
            Collections.sort(userList, ComparatorHelper.sortByGenderDesc());
            return userList;
        } else if (sortby.equals("emailAsc")) {
            Collections.sort(userList, ComparatorHelper.sortByEmailAsc());
            return userList;
        } else if (sortby.equals("emailDesc")) {
            Collections.sort(userList, ComparatorHelper.sortByEmailDesc());
            return userList;
        } else if (sortby.equals("phoneAsc")) {
            Collections.sort(userList, ComparatorHelper.sortByPhoneAsc());
            return userList;
        } else if (sortby.equals("phoneDesc")) {
            Collections.sort(userList, ComparatorHelper.sortByPhoneDesc());
            return userList;
        } else if (sortby.equals("roleAsc")) {
            Collections.sort(userRole, ComparatorHelper.sortByUserRoleAsc());
            for (UserRole uRole : userRole) {
                for (User user : userList) {
                    if (user.getRole_id() == uRole.getId()) {
                        sortedList.add(user);
                    }
                }
            }
            return sortedList;
        } else if (sortby.equals("roleDesc")) {
            Collections.sort(userRole, ComparatorHelper.sortByUserRoleDesc());
            for (UserRole uRole : userRole) {
                for (User user : userList) {
                    if (user.getRole_id() == uRole.getId()) {
                        sortedList.add(user);
                    }
                }
            }
            return sortedList;

        } else if (sortby.equals("statusUserAsc")) {
            Collections.sort(userList, ComparatorHelper.sortByStatusUserAsc());
            return userList;
        } else if (sortby.equals("statusUserDesc")) {
            Collections.sort(userList, ComparatorHelper.sortByStatusUserDesc());
            return userList;
        }
        return null;
    }

    public static void main(String[] args) {
        ProductDAO productDAO = new ProductDAO();
        ArrayList<Product> products = productDAO.getProductList();
        UserDAO userDAO = new UserDAO();
        ArrayList<User> user = userDAO.getUserList();
        String sortby = "emailDesc";
        ComparatorHelper comparatorHelper = new ComparatorHelper();
//        products = comparatorHelper.sortProductList(products, sortby);
//        for (Product product : products) {
//            System.out.println(product.getStaravg());
//        }
//        UserRoleDAO userRoleDAO = new UserRoleDAO();
//        ArrayList<UserRole> userRoles = userRoleDAO.getUserRoleList();
//        user = comparatorHelper.sortUserList(user, sortby, userRoles);
//        for (User user1 : user) {
//            for (UserRole userRole : userRoles) {
//                if(user1.getRole_id() == userRole.getId()){
//                    System.out.println(userRole.getRolename());
//                }
//            }
//            
//        }
        for (User user1 : user) {
            System.out.println(user1.getEmail());
        }
    }
}
