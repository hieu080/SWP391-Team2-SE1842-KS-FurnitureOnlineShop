import DAL.ProductDAO;
import Models.Product;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

public class ComparatorHelper {

    public static Comparator<Product> sortByNameAsc() {
        return Comparator.comparing(Product::getName);
    }

    public static Comparator<Product> sortByNameDesc() {
        return Comparator.comparing(Product::getName).reversed();
    }

    public static Comparator<Product> sortByPriceAsc() {
        return Comparator.comparingDouble(Product::getPrice);
    }

    public static Comparator<Product> sortByPriceDesc() {
        return Comparator.comparingDouble(Product::getPrice).reversed();
    }

//    
//    
//    public static void main(String[] args) {
//        ProductDAO productDAO = new ProductDAO();
//        ArrayList<Product> products = productDAO.getProductList();
//        Collections.sort(products, ComparatorHelper.sortByPriceDesc());
//        for (Product product : products) {
//            System.out.println(product.getName());
//        }
//    }
}
