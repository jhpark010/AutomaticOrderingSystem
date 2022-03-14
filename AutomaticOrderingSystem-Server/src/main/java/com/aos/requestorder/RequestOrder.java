package com.aos.requestorder;

import java.io.Serializable;

public class RequestOrder implements Serializable { // orderDate 타입이 Date -> String으로 변경
	private String orderDate;
    private String supplierNo;
    private String ingredientNo;
    private String orderAmount;
    private String orderPrice;
    private String status;

    private int itemStart;
    private int itemSizePerPage;

    public RequestOrder() {
    }

    public RequestOrder(String orderDate, String supplierNo, String ingredientNo, String orderAmount, String orderPrice, String status, int itemStart, int itemSizePerPage) {
        this.orderDate = orderDate;
        this.supplierNo = supplierNo;
        this.ingredientNo = ingredientNo;
        this.orderAmount = orderAmount;
        this.orderPrice = orderPrice;
        this.status = status;

        this.itemStart = itemStart;
        this.itemSizePerPage = itemSizePerPage;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public String getOrderDate() {
        return this.orderDate;
    }

    public void setSupplierNo(String supplierNo) {
        this.supplierNo = supplierNo;
    }

    public String getSupplierNo() {
        return this.supplierNo;
    }

    public void setIngredientNo(String ingredientNo) {
        this.ingredientNo = ingredientNo;
    }

    public String getIngredientNo() {
        return this.ingredientNo;
    }

    public void setOrderAmount(String orderAmount) {
        this.orderAmount = orderAmount;
    }

    public String getOrderAmount() {
        return this.orderAmount;
    }

    public void setOrderPrice(String orderPrice) {
        this.orderPrice = orderPrice;
    }

    public String getOrderPrice() {
        return this.orderPrice;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getStatus() {
        return this.status;
    }

    public void setItemStart(int itemStart) {
        this.itemStart = itemStart;
    }

    public int getItemStart() {
        return this.itemStart;
    }

    public void setItemSizePerPage(int itemSizePerPage) {
        this.itemSizePerPage = itemSizePerPage;
    }

    public int getItemSizePerPage() {
        return this.itemSizePerPage;
    }

	@Override
	public String toString() {
		return "RequestOrder [orderDate=" + orderDate + ", supplierNo=" + supplierNo + ", ingredientNo=" + ingredientNo
				+ ", orderAmount=" + orderAmount + ", orderPrice=" + orderPrice + ", status=" + status
				+ ", itemStart=" + itemStart + ", itemSizePerPage=" + itemSizePerPage + "]";
	}
}