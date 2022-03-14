package com.aos.supplier;

import java.io.Serializable;

public class Supplier implements Serializable {
    private String no;
    private String name;
    private String phoneNo;
    private String email;
	private String zipCode;
    private String address;
    private String detailAddress;
    private String status;

    private int itemStart;
    private int itemSizePerPage;

    public Supplier() {
    }
    
    public Supplier(String no, String name, String phoneNo, String email, String zipCode, String address, String detailAddress, String status) {
    	 this.no = no;
         this.name = name;
         this.phoneNo = phoneNo;
         this.email = email;
         this.zipCode = zipCode;
         this.address = address;
         this.detailAddress = detailAddress;
         this.status = status;
    }

    public Supplier(String no, String name, String phoneNo, String email, String zipCode, String address, String detailAddress, String status, int itemStart, int itemSizePerPage) {
        this.no = no;
        this.name = name;
        this.phoneNo = phoneNo;
        this.email = email;
        this.zipCode = zipCode;
        this.address = address;
        this.detailAddress = detailAddress;
        this.status = status;

        this.itemStart = itemStart;
        this.itemSizePerPage = itemSizePerPage;
    }

    @Override
	public String toString() {
		return "Supplier [no=" + no + ", name=" + name + ", phoneNo=" + phoneNo + ", email=" + email + ", zipCode="
				+ zipCode + ", address=" + address + ", detailAddress=" + detailAddress + ", status=" + status + "]";
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

    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo;
    }

    public String getPhoneNo() {
        return this.phoneNo;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmail() {
        return this.email;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    public String getZipCode() {
        return this.zipCode;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAddress() {
        return this.address;
    }

    public void setDetailAddress(String detailAddress) {
        this.detailAddress = detailAddress;
    }

    public String getDetailAddress() {
        return this.detailAddress;
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