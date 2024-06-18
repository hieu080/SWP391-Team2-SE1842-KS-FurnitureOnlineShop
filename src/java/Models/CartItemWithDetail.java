/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author ADMIN
 */
public class CartItemWithDetail {
    private Product product;
    private ProductDetail productDetail;
    private Color color;
    private User user;
    private CartItem cartItem;
    private Brand brand;
    private Category category;

    public CartItemWithDetail(Product product, ProductDetail productDetail, Color color, User user, CartItem cartItem, Brand brand, Category category) {
        this.product = product;
        this.productDetail = productDetail;
        this.color = color;
        this.user = user;
        this.cartItem = cartItem;
        this.brand = brand;
        this.category = category;
    }

    public CartItemWithDetail() {
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public ProductDetail getProductDetail() {
        return productDetail;
    }

    public void setProductDetail(ProductDetail productDetail) {
        this.productDetail = productDetail;
    }

    public Color getColor() {
        return color;
    }

    public void setColor(Color color) {
        this.color = color;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public CartItem getCartItem() {
        return cartItem;
    }

    public void setCartItem(CartItem cartItem) {
        this.cartItem = cartItem;
    }

    public Brand getBrand() {
        return brand;
    }

    public void setBrand(Brand brand) {
        this.brand = brand;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

   
    
}
