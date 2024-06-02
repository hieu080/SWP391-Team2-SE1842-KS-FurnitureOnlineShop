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

    public ArrayList<Product> sortProductList(ArrayList<Product> productList, String sortby) {
        if (sortby.equals("priceAsc")) {
            Collections.sort(productList, ComparatorHelper.sortByPriceAsc());
        }else{
            Collections.sort(productList, ComparatorHelper.sortByPriceDesc());
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
