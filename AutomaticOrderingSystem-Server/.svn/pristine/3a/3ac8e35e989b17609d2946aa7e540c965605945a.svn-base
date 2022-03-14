package com.aos.main;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aos.ingredient.Ingredient;
import com.aos.ingredient.IngredientMapper;
import com.aos.tray.Tray;
import com.aos.tray.TrayMapper;

@Service
public class MainServiceImpl implements MainService{
	
	@Autowired
	private TrayMapper trayMapper;
	@Autowired
	private IngredientMapper ingredientMapper;

	@Override
	public List<Map<String, String>> prepareMain() {
		List<Map<String, String>> resultList = new ArrayList<Map<String, String>>();
		Map<String, String> result = null;
		try {
			List<Tray> trays = trayMapper.selectAll();
			for (int i = 0; i < trays.size(); i++) {
				result = new HashMap<String, String>();
				if (trays.get(i).getIngredientNo() != null) { // 트레이에 식자재 등록 되어있을때
					String ingredientNo = trays.get(i).getIngredientNo();
					String orderWeight = trays.get(i).getOrderWeight();
					
					Ingredient ingredient = new Ingredient();
					ingredient.setNo(ingredientNo);
					String ingredientName = ingredientMapper.select(ingredient).getName();
					
					result.put("no", trays.get(i).getNo());
					result.put("ingredientName", ingredientName);
					
					Properties pro = new Properties();
					try {
						File upperDir = new File("src\\main\\resources" + File.separator + "income.properties");
						pro.load(new FileInputStream(upperDir.getAbsoluteFile()));
					} catch (IOException e) {
						e.printStackTrace();
					}
					
					result.put("weight", pro.getProperty(trays.get(i).getNo() + ".tray.weight"));
					result.put("status", pro.getProperty(trays.get(i).getNo() + ".tray.status"));
					result.put("orderWeight", orderWeight);
					
					resultList.add(result);
				} else { // 트레이에 식자재가 등록 안되있을때
					result.put("no", trays.get(i).getNo());
					result.put("ingredientName", "미등록");
					resultList.add(result);
				}

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultList;
	}

}
