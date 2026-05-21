package com.corexa.model;

public class UserActivityModel {

	private int totalOrders;
	private int totalItems;
	private int wishlistItems;
	private String favoriteCategory;

	public int getTotalOrders() {
		return totalOrders;
	}

	public void setTotalOrders(int totalOrders) {
		this.totalOrders = totalOrders;
	}

	public int getTotalItems() {
		return totalItems;
	}

	public void setTotalItems(int totalItems) {
		this.totalItems = totalItems;
	}

	public int getWishlistItems() {
		return wishlistItems;
	}

	public void setWishlistItems(int wishlistItems) {
		this.wishlistItems = wishlistItems;
	}

	public String getFavoriteCategory() {
		return favoriteCategory;
	}

	public void setFavoriteCategory(String favoriteCategory) {
		this.favoriteCategory = favoriteCategory;
	}
}
