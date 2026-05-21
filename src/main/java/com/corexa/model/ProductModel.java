package com.corexa.model;

public class ProductModel {

	private int productId;
	private String productName;
	private String description;
	private double price;
	private int quantity;
	private String category;
	private String productImage;
	private String sku;
	private String brand;
	private String rackNumber;

	//constructors
	public ProductModel() {
	}

	public ProductModel(int productId) {
		this.productId = productId;
	}

	
	public ProductModel(int productId, String productName, String description, double price, int quantity, String category,
			String productImage) {
		this.productId = productId;
		this.productName = productName;
		this.description = description;
		this.price = price;
		this.quantity = quantity;
		this.category = category;
		this.productImage = productImage;
	}

	public ProductModel(int productId, String productName, String description, double price, int quantity, String category,
			String productImage, String sku, String brand, String rackNumber) {
		this(productId, productName, description, price, quantity, category, productImage);
		this.sku = sku;
		this.brand = brand;
		this.rackNumber = rackNumber;
	}

	//getter and setters
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


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public double getPrice() {
		return price;
	}


	public void setPrice(double price) {
		this.price = price;
	}


	public int getQuantity() {
		return quantity;
	}


	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}


	public String getProductImage() {
		return productImage;
	}


	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}

	public String getSku() {
		return sku;
	}

	public void setSku(String sku) {
		this.sku = sku;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getRackNumber() {
		return rackNumber;
	}

	public void setRackNumber(String rackNumber) {
		this.rackNumber = rackNumber;
	}
	

}
