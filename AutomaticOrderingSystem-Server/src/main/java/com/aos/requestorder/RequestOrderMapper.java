package com.aos.requestorder;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RequestOrderMapper {
    public List<RequestOrder> list(RequestOrder requestOrder) throws Exception;
    public RequestOrder select(RequestOrder requestOrder) throws Exception;
    public List<RequestOrder> searchByDate(RequestOrder requestOrder) throws Exception;
    public void insert(RequestOrder requestOrder) throws Exception;
    public void update(RequestOrder requestOrder) throws Exception;
}