package com.corexa.model;

public class CategoryReportModel {

	private String category;
	private int orderedQuantity;
	private int availableQuantity;

	public CategoryReportModel() {
	}

	public CategoryReportModel(String category, int orderedQuantity, int availableQuantity) {
		this.category = category;
		this.orderedQuantity = orderedQuantity;
		this.availableQuantity = availableQuantity;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getOrderedQuantity() {
		return orderedQuantity;
	}

	public void setOrderedQuantity(int orderedQuantity) {
		this.orderedQuantity = orderedQuantity;
	}

	public int getAvailableQuantity() {
		return availableQuantity;
	}

	public void setAvailableQuantity(int availableQuantity) {
		this.availableQuantity = availableQuantity;
	}
}
