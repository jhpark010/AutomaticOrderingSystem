package com.aos.supplier;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SupplierMapper {
    public int count(Supplier supplier) throws Exception;
    public List<Supplier> list(Supplier supplier) throws Exception;
    public List<Supplier> searchResult(String keyword) throws Exception;
    public Supplier select(Supplier supplier) throws Exception;
    public Supplier selectbyIngredientNo(String ingredientNo) throws Exception;
    public List<Supplier> selectSupplierOnTray() throws Exception;
    public void insert(Supplier supplier) throws Exception;
    public void update(Supplier supplier) throws Exception;
    public void delete(Supplier supplier) throws Exception;
}