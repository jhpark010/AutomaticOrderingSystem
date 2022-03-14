package com.aos.ingredient;

import java.io.Serializable;

import javax.validation.constraints.Digits;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

public class Ingredient implements Serializable {
    private String no;
    private String name;
    private String unitWeight;
    private String unitPrice;
    private String status;

    private int itemStart;
    private int itemSizePerPage;

    public Ingredient() {
    }
    
    public Ingredient(String no, String name, String unitWeight, String unitPrice, String status) {
    	this.no = no;
        this.name = name;
        this.unitWeight = unitWeight;
        this.unitPrice = unitPrice;
        this.status = status;
    }

    public Ingredient(String no, String name, String unitWeight, String unitPrice, String status, int itemStart, int itemSizePerPage) {
        this.no = no;
        this.name = name;
        this.unitWeight = unitWeight;
        this.unitPrice = unitPrice;
        this.status = status;

        this.itemStart = itemStart;
        this.itemSizePerPage = itemSizePerPage;
    }


	public void setNo(String no) {
        this.no = no;
    }

    public String getNo() {
        return this.no;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return this.name;
    }

    public void setUnitWeight(String unitWeight) {
        this.unitWeight = unitWeight;
    }

    public String getUnitWeight() {
        return this.unitWeight;
    }

    public void setUnitPrice(String unitPrice) {
        this.unitPrice = unitPrice;
    }

    public String getUnitPrice() {
        return this.unitPrice;
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
		return "Ingredient [no=" + no + ", name=" + name + ", unitWeight=" + unitWeight + ", unitPrice=" + unitPrice
				+ ", status=" + status + ", itemStart=" + itemStart + ", itemSizePerPage=" + itemSizePerPage + "]";
	}

    
    
}