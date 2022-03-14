package com.aos.handling;

import java.io.Serializable;

public class Handling implements Serializable {
    private String no;
    private String ingredientNo;
    private String supplierNo;
    private String status;

    private int itemStart;
    private int itemSizePerPage;

    public Handling() {
    }
    
    public Handling(String no, String ingredientNo, String supplierNo, String status) {
    	this.no = no;
        this.ingredientNo = ingredientNo;
        this.supplierNo = supplierNo;
        this.status = status;
    }
    
    public Handling(String no, String ingredientNo, String supplierNo, String status, int itemStart, int itemSizePerPage) {
        this.no = no;
        this.ingredientNo = ingredientNo;
        this.supplierNo = supplierNo;
        this.status = status;

        this.itemStart = itemStart;
        this.itemSizePerPage = itemSizePerPage;
    }

    @Override
	public String toString() {
		return "Handling [no=" + no + ", ingredientNo=" + ingredientNo + ", supplierNo=" + supplierNo
				+ ", status=" + status + "]";
	}

	public void setNo(String no) {
        this.no = no;
    }

    public String getNo() {
        return this.no;
    }

    public void setIngredientNo(String ingredientNo) {
        this.ingredientNo = ingredientNo;
    }

    public String getIngredientNo() {
        return this.ingredientNo;
    }

    public void setSupplierNo(String supplierNo) {
        this.supplierNo = supplierNo;
    }

    public String getSupplierNo() {
        return this.supplierNo;
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
}