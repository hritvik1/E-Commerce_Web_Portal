package com.shopping.no_mad_gear.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Product {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "p_id")
    private int productId;
    
    @Column(name = "p_name")
    private String productName;
    
    @Column(name = "p_desc")
    private String productDescription;
    
    @Column(name = "p_pic")
    private String productPic;
    
    @Column(name = "p_price")
    private int productPrice;
    
    @Column(name = "p_disc")
    private int productDiscount;
    
    @Column(name = "p_qty")
    private int productQuantity;
    
    @ManyToOne
    @JoinColumn(name = "cat_pro_id")
    private Category category;

    public Product(String productName, String productDescription, String productPic, int productPrice, int productDiscount, int productQuantity, Category categoty) {
        this.productName = productName;
        this.productDescription = productDescription;
        this.productPic = productPic;
        this.productPrice = productPrice;
        this.productDiscount = productDiscount;
        this.productQuantity = productQuantity;
        this.category = categoty;
    }

    public Product() {
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public String getProductPic() {
        return productPic;
    }

    public void setProductPic(String productPic) {
        this.productPic = productPic;
    }

    public int getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(int productPrice) {
        this.productPrice = productPrice;
    }

    public int getProductDiscount() {
        return productDiscount;
    }

    public void setProductDiscount(int productDiscount) {
        this.productDiscount = productDiscount;
    }

    public int getProductQuantity() {
        return productQuantity;
    }

    public void setProductQuantity(int productQuantity) {
        this.productQuantity = productQuantity;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
    
    @Override
    public String toString() {
        return "Product{" + "productId=" + productId + ", productName=" + productName + ", productDescription=" + productDescription + ", productPic=" + productPic + ", productPrice=" + productPrice + ", productDiscount=" + productDiscount + ", productQuantity=" + productQuantity + '}';
    }
    
    public int getActualPrice() {
        int discount = (int)((this.getProductDiscount()/100.0)*this.getProductPrice());
        return this.getProductPrice()-discount;
    }
}