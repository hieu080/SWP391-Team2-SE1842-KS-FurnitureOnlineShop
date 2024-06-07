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

    public static void main(String[] args) {
        ProductDAO productDAO = new ProductDAO();
        ArrayList<Product> products = productDAO.getProductList();
        String sortby = "starDesc";
        ComparatorHelper comparatorHelper = new ComparatorHelper();
        products = comparatorHelper.sortProductList(products, sortby);
        for (Product product : products) {
            System.out.println(product.getStaravg());
        }
    }
}
