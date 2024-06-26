package Helper;

import DAL.OrderDAO;
import DAL.ProductDAO;
import DAL.UserDAO;
import Models.Order;
import Models.Product;
import Models.User;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    public ArrayList<Product> sortProductList(ArrayList<Product> productList, String sortby) {
        if (sortby.equals("priceAsc")) {
            Collections.sort(productList, ComparatorHelper.sortByPriceAsc());
        } else if (sortby.equals("priceDesc")) {
            Collections.sort(productList, ComparatorHelper.sortByPriceDesc());
        } else if (sortby.equals("quantityAsc")) {
            Collections.sort(productList, ComparatorHelper.sortByQuantityAsc());
        } else if (sortby.equals("quantityDesc")) {
            Collections.sort(productList, ComparatorHelper.sortByQuantityDesc());
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
        }else {
            Collections.sort(orderList, ComparatorHelper.sortByStatusDesc());
            return orderList;
        }
    }

    public static void main(String[] args) {
//        ProductDAO productDAO = new ProductDAO();
//        ArrayList<Product> products = productDAO.getProductList();
//        String sortby = "priceDesc";
        ComparatorHelper comparatorHelper = new ComparatorHelper();
//        products = comparatorHelper.sortProductList(products, sortby);
//        for (Product product : products) {
//            System.out.println(product.getPrice());
//        }

        OrderDAO orderDAO = new OrderDAO();
        ArrayList<Order> orders = orderDAO.getOrderList();
        UserDAO userDAO = new UserDAO();
        ArrayList<User> user = userDAO.getUserList();
        String sortby = "statusAsc";
        orders = comparatorHelper.sortOrderList(orders, sortby, user);

        for (Order order : orders) {
            for (User user1 : user) {
                if (user1.getId() == order.getCustomer_id()) {
                    System.out.println(user1.getFullname());
                }
            }
        }
        for (Order order : orders) {
            System.out.println(order.getStatus());
        }
    }
}
