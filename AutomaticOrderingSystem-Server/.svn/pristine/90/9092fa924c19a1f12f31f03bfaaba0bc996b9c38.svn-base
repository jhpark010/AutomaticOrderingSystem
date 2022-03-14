package com.aos.tray;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TrayMapper {
    public List<Tray> list(Tray tray) throws Exception;
    public Tray select(Tray tray) throws Exception;
    public void dmlTray(Tray tray) throws Exception;

    public List<Tray> selectAll() throws Exception;
    public List<Tray> selectTrayNo() throws Exception;
    public TrayInfo selectTrayInfo(Tray tray) throws Exception;
}