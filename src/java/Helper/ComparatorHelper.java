package Helper;

import DAL.ProductDAO;
import Models.Product;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

public class ComparatorHelper {

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

    public static void main(String[] args) {
        ProductDAO productDAO = new ProductDAO();
        ArrayList<Product> products = productDAO.getProductList();
        String sortby = "priceDesc";
        ComparatorHelper comparatorHelper = new ComparatorHelper();
        products = comparatorHelper.sortProductList(products, sortby);
        for (Product product : products) {
            System.out.println(product.getPrice());
        }
    }
}
