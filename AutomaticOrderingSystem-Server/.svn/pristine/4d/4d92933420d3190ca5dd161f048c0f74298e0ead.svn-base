package com.aos.ingredient;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aos.handling.Handling;
import com.aos.handling.HandlingMapper;
import com.aos.requestorder.RequestOrder;
import com.aos.requestorder.RequestOrderMapper;
import com.aos.supplier.Supplier;
import com.aos.supplier.SupplierMapper;
import com.aos.tray.Tray;
import com.aos.tray.TrayMapper;

@Service
public class IngredientServiceImpl implements IngredientService {
	@Autowired
	private IngredientMapper ingredientMapper;
	@Autowired
	private SupplierMapper supplierMapper;
	@Autowired
	private TrayMapper trayMapper;
	@Autowired
	private HandlingMapper handlingMapper;
	@Autowired
	private RequestOrderMapper requestOrderMapper;
	
	@Override
	public List<Map<String, String>> ingredientList() { // 식자재 리스트(식자재명과 주거래처명 바인딩)
		List<Ingredient> ingredientList = null;
		Map<String, String> result = null;
		List<Map<String, String>> resultList = new ArrayList<Map<String, String>>();
		String ingredientNo = null;
		String notFound = "주거래처 없음";
		
		try {
			Ingredient ingredient = new Ingredient();
			ingredient.setStatus("Y");
			ingredientList = ingredientMapper.list(ingredient);
			
			for (int i = 0; i < ingredientList.size(); i++) {
				result = new HashMap<String, String>();
				ingredientNo = ingredientList.get(i).getNo();
				Supplier resultbyingredientNo = supplierMapper.selectbyIngredientNo(ingredientNo);
				if (resultbyingredientNo == null) {
					result.put("ingredientName", ingredientList.get(i).getName());
					result.put("supplierName", notFound);
					resultList.add(result);
				} else {
					result.put("ingredientName", ingredientList.get(i).getName());
					result.put("supplierName", resultbyingredientNo.getName());
					resultList.add(result);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultList;
	}

	@Override
	public List<String> getSupplierList() { // 식자재 등록 시 사용할 거래처 목록
		List<String> supplierName = new ArrayList<String>();
		try {
			Supplier supplier = new Supplier();
			supplier.setStatus("Y");
			List<Supplier> supplierList = supplierMapper.list(supplier);
			for (int i = 0; i < supplierList.size(); i++) {
				supplierName.add(supplierList.get(i).getName());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return supplierName;
	}

	@Override
	public void registIngredient(Ingredient ingredient, String mainSupplier) { // 식자재 등록
		Ingredient clone = new Ingredient();
		clone.setName(ingredient.getName());
		clone.setUnitWeight(null);
		clone.setUnitPrice(null);
		clone.setStatus("N");
		
		try {
			Ingredient result = ingredientMapper.select(clone);
			if (result == null) {
				// 식자재 상태가 N인게 존재하지 않으면
				ingredient.setStatus("Y");
				ingredientMapper.insert(ingredient); // ingredient 테이블 insert 먼저
			} else {
				// 식자재 상태가 N인게 존재
				result.setUnitWeight(ingredient.getUnitWeight());
				result.setUnitPrice(ingredient.getUnitPrice());
				result.setStatus("Y");
				ingredientMapper.updateWithWhere(result); // ingredient 테이블 update 실행
			}

			if (mainSupplier.trim().isEmpty() == false) { // 주거래처 선택시
				Ingredient needForingredientNo = ingredientMapper.selectByName(ingredient.getName());
				Supplier setSupplier = new Supplier();
				setSupplier.setName(mainSupplier);
				Supplier supplier = supplierMapper.select(setSupplier);
				
				Handling handling = new Handling();
				handling.setIngredientNo(needForingredientNo.getNo());
				handling.setSupplierNo(supplier.getNo());
				handling.setStatus("Y");
				handlingMapper.insert(handling); // handling 테이블 insert
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public Ingredient viewIngredient(String name) { // 식자재 조회
		Ingredient result = new Ingredient();
		try {
			result = ingredientMapper.selectByName(name);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public String getMainSupplierName(String name) { // 식자재 수정 시 필요한 정보 제공
		Ingredient forIngredientNo = null;
		Supplier supplier = null;
		String result = null;
		
		try {
			forIngredientNo = ingredientMapper.selectByName(name);
			forIngredientNo.getName();
			supplier = supplierMapper.selectbyIngredientNo(forIngredientNo.getNo());
			if (supplier == null) {
				result = "주거래처 없음";
			} else {
				result = supplier.getName();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public void editIngredient(Ingredient ingredient, String presentSupplier, String mainSupplier) { // 식자재 수정
		try {
			ingredientMapper.updateWithWhere(ingredient); // 수정한 식자재 정보 update

			Supplier suppliergetNo = new Supplier();
			suppliergetNo.setName(presentSupplier);
			suppliergetNo = supplierMapper.select(suppliergetNo);

			if (suppliergetNo == null) { 
				// 기존의 주거래처 정보가 없고, 새로운 주 거래처를 설정한 경우
			} else { // 전의 주 거래처 정보가 있고, 새로운 주 거래처 정보가 들어옴
				Handling oldHandling = new Handling();
				oldHandling.setIngredientNo(ingredient.getNo());
				oldHandling.setSupplierNo(suppliergetNo.getNo());
				oldHandling.setStatus("N");
				handlingMapper.updatebyNo(oldHandling); // 기존 거래처의 주거래처 상태 N으로 변환....OK
			}

			Supplier supplier = new Supplier();
			supplier.setName(mainSupplier);
			Supplier resultSupplier = supplierMapper.select(supplier); // 거래처 정보 가져옴(새로운 거래처 이름으로 번호를)

			Handling handling = new Handling();
			handling.setIngredientNo(ingredient.getNo());
			handling.setSupplierNo(resultSupplier.getNo());
			Handling resultHandling = handlingMapper.select(handling);
			if (resultHandling == null) { // 기존의 정보가 없을경우
				handling.setStatus("Y");
				handlingMapper.insert(handling); // insert;
			} else {
				resultHandling.setStatus("Y");
				handlingMapper.updatebyNo(resultHandling); // update
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	@Override
	public String deleteIngredient(String no) { // 식자재 삭제
		String status = "false";
		try {
			RequestOrder requestOrder = new RequestOrder();
			requestOrder.setIngredientNo(no);
			requestOrder.setStatus("O");
			RequestOrder order = requestOrderMapper.select(requestOrder);
			if (order == null) {
				// 식자재 번호와 상태가 O인게 없으면 진행 해도됨.
				Tray tray = new Tray();
				tray.setIngredientNo(no);
				Tray result = trayMapper.select(tray);
				
				if (result != null) { // tray에 데이터가 존재하면
					status = "onTray";
					// 식자재 삭제를 막아야됨
					// 먼저 해당 식자재가 올라가 있는 트레이를 삭제하라고 알려줌
				} else {
					Handling handling = new Handling();
					handling.setIngredientNo(no);
					handlingMapper.delete(handling);
					
					Ingredient ingredient = new Ingredient();
					ingredient.setNo(no);
					ingredient.setStatus("N");
					ingredientMapper.delete(ingredient);
					status = "true";					
				}
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	
	@Override
	public List<Map<String, String>> searchIngredient(String name) { // 식자재 검색
		List<Ingredient> ingredientList = null;
		Map<String, String> result = null;
		List<Map<String, String>> resultList = new ArrayList<Map<String, String>>();
		String ingredientNo = null;
		String notFound = "주거래처 없음";
		
		try {
			Ingredient ingredient = new Ingredient();
			ingredient.setName(name);
			ingredient.setStatus("Y");
			ingredientList = ingredientMapper.searchResult(ingredient);
			
			for (int i = 0; i < ingredientList.size(); i++) {
				result = new HashMap<String, String>();
				ingredientNo = ingredientList.get(i).getNo();
				Supplier resultbyingredientNo = supplierMapper.selectbyIngredientNo(ingredientNo);
				if (resultbyingredientNo == null) {
					result.put("ingredientName", ingredientList.get(i).getName());
					result.put("supplierName", notFound);
					resultList.add(result);
				} else {
					result.put("ingredientName", ingredientList.get(i).getName());
					result.put("supplierName", resultbyingredientNo.getName());
					resultList.add(result);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultList;		
	}

	@Override
	public boolean checkIngredient(String name) { // 식자재 명 중복체크
		Ingredient ingredient = new Ingredient();
		ingredient.setName(name);
		ingredient.setStatus("Y");
		try {
			int count = ingredientMapper.count(ingredient);
			if (count > 0) {
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return true;
	}
}
