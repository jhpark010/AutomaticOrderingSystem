package com.aos.tray;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aos.handling.Handling;
import com.aos.handling.HandlingMapper;
import com.aos.ingredient.Ingredient;
import com.aos.ingredient.IngredientMapper;
import com.aos.requestorder.RequestOrder;
import com.aos.requestorder.RequestOrderMapper;

@Service
public class TrayServiceImpl implements TrayService {
	@Autowired
	TrayMapper trayMapper;
	
	@Autowired
	IngredientMapper ingredientMapper;
	
	@Autowired
	HandlingMapper handlingMapper;
	
	@Autowired
	RequestOrderMapper requestOrderMapper;
	
	@Override
	public List<Ingredient> ingredientList() throws Exception {
		Handling handling = new Handling();
		
		List<Ingredient> handlingIngredient = new ArrayList<Ingredient>();
		
		handling.setStatus("Y");
		List<Handling> list = handlingMapper.list(handling);
		
		for (Handling handle : list) {
			Ingredient ingredient = new Ingredient();
			ingredient.setNo(handle.getIngredientNo());
			
			ingredient = ingredientMapper.select(ingredient);
			
			handlingIngredient.add(ingredient);
		}
		
		return handlingIngredient;
	}

	@Override
	public void registTray(Tray tray) throws Exception {
		String value = tray.getIngredientNo();
		
		System.out.println(tray.toString());

		if (checkTray(value)) {
			trayMapper.dmlTray(tray);
		}
	}

	@Override
	public TrayInfo viewTray(Tray tray) throws Exception {
		Tray selectTray = trayMapper.select(tray);
		
		String no = selectTray.getIngredientNo();
		
		if(no != null) {
			TrayInfo trayInfo = trayMapper.selectTrayInfo(tray);
			
			return trayInfo;
		} else {
			TrayInfo trayInfo = new TrayInfo(selectTray);
			return trayInfo;
		}
	}

	@Override
	public List<TrayInfo> trayList() throws Exception {
		List<Tray> list = trayMapper.list(new Tray());
		List<TrayInfo> trayInfoList = new ArrayList<TrayInfo>();
		
		for(Tray tray : list) {
			if (tray.getIngredientNo() != null) {
				trayInfoList.add(viewTray(tray));
			} else {
				TrayInfo trayInfo = new TrayInfo(null, tray);
				trayInfoList.add(trayInfo);
			}
		}
		
		return trayInfoList;
	}

	@Override
	public void editTray(Tray tray) throws Exception {
		Tray selectTray = new Tray();
		selectTray.setNo(tray.getNo());
		
		tray.setIngredientNo(trayMapper.select(selectTray).getIngredientNo());
		trayMapper.dmlTray(tray);
	}

	@Override
	public boolean deleteTray(Tray tray) throws Exception {
		boolean returnValue = false;
		Tray selectTray = trayMapper.select(tray);
		
		Handling handling = new Handling();
		handling.setIngredientNo(selectTray.getIngredientNo());
		handling.setStatus("Y");
		handling = handlingMapper.select(handling);
		
		RequestOrder requestOrder = new RequestOrder();
		requestOrder.setSupplierNo(handling.getSupplierNo());
		requestOrder.setStatus("O");
		
		requestOrder = requestOrderMapper.select(requestOrder);
		
		try {
			if (requestOrder == null) {
				trayMapper.dmlTray(tray);
				returnValue = true;
			} else {
				returnValue = false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return returnValue;
	}

	@Override
	public boolean checkTray(String ingredientNo) throws Exception {
		Tray tray = new Tray();
		tray.setIngredientNo(ingredientNo);

		try {
			trayMapper.select(tray).getIngredientNo();
		} catch (Exception e) {
			return true;
		}
		
		return false;
	}

	@Override
	public List<Tray> getTrayNo() throws Exception {
		List<Tray> list = trayMapper.selectTrayNo();
		return list;
	}
}
