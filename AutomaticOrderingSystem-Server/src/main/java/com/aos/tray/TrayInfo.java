package com.aos.tray;

import java.io.Serializable;

public class TrayInfo implements Serializable {
	private String no;
	private String ingredientName;
	private String orderWeight;
	private String orderAmount;
	private String zeroValue;
	
	private int itemStart = 0;
    private int itemSizePerPage = 10;
	
	public TrayInfo() {
	}

	public TrayInfo(String no, String ingredientName, String orderWeight, String orderAmount, String zeroValue) {
        this.no = no;
        this.ingredientName = ingredientName;
        this.orderWeight = orderWeight;
        this.orderAmount = orderAmount;
        this.zeroValue = zeroValue;
	}
	
	public TrayInfo(String ingredientName, Tray tray) {
		this.ingredientName = ingredientName;
		this.no = tray.getNo();
		this.orderWeight = tray.getOrderWeight();
		this.orderAmount = tray.getOrderAmount();
	}
	
	public TrayInfo(Tray tray) {
		this.no = tray.getNo();
		this.ingredientName = null;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getNo() {
		return this.no;
	}

	public void setingredientName(String ingredientName) {
		this.ingredientName = ingredientName;
	}

	public String getingredientName() {
		return this.ingredientName;
	}

	public void setOrderWeight(String orderWeight) {
		this.orderWeight = orderWeight;
	}

	public String getOrderWeight() {
		return this.orderWeight;
	}

	public void setOrderAmount(String orderAmount) {
		this.orderAmount = orderAmount;
	}

	public String getOrderAmount() {
		return this.orderAmount;
	}
	
	public void setZeroValue(String zeroValue) {
		this.zeroValue = zeroValue;
	}

	public String getZeroValue() {
		return zeroValue;
	}
}
