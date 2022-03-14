package com.aos.supplier;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aos.handling.Handling;
import com.aos.handling.HandlingMapper;
import com.aos.ingredient.Ingredient;
import com.aos.ingredient.IngredientMapper;

@Service
public class SupplierServiceImpl implements SupplierService {
	@Autowired
	private SupplierMapper supplierMapper;

	@Autowired
	private HandlingMapper handlingMapper;

	@Autowired
	private IngredientMapper ingredientMapper;

	@Override
	public void registSupplier(Supplier supplier, String[] handlingIngredients) {
		if (supplier != null) {
			try {
				Supplier oneSupplier = new Supplier();
				oneSupplier.setName(supplier.getName());

				if (supplierMapper.count(oneSupplier) < 1) {
					supplier.setStatus("Y");
					supplierMapper.insert(supplier);
					supplier = supplierMapper.select(supplier);

					for (int i = 0; i < handlingIngredients.length; i++) {
						Ingredient ingredient = new Ingredient();
						ingredient.setName(handlingIngredients[i]);
						ingredient.setStatus("Y");
						ingredient = ingredientMapper.select(ingredient);
						Handling handling = new Handling();
						handling.setIngredientNo(ingredient.getNo());
						handling.setStatus("Y");

						if (handlingMapper.select(handling) != null) {
							handling = new Handling();
							handling.setIngredientNo(ingredient.getNo());
							handling.setSupplierNo(supplier.getNo());
							handling.setStatus("N");
							handlingMapper.insert(handling);
						} else {
							handling = new Handling();
							handling.setIngredientNo(ingredient.getNo());
							handling.setSupplierNo(supplier.getNo());
							handling.setStatus("Y");
							handlingMapper.insert(handling);
						}
					}
				} else {
					Supplier twoSupplier = new Supplier();
					twoSupplier.setName(supplier.getName());
					twoSupplier.setStatus("N");
					twoSupplier = supplierMapper.select(twoSupplier);

					if (twoSupplier != null) {
						twoSupplier.setPhoneNo(supplier.getPhoneNo());
						twoSupplier.setZipCode(supplier.getZipCode());
						twoSupplier.setAddress(supplier.getAddress());
						twoSupplier.setDetailAddress(supplier.getDetailAddress());
						twoSupplier.setStatus("Y");
						supplierMapper.update(twoSupplier);
						twoSupplier = supplierMapper.select(twoSupplier);
						Handling handling = new Handling();
						handling.setSupplierNo(twoSupplier.getNo());
						handlingMapper.delete(handling);

						for (int i = 0; i < handlingIngredients.length; i++) {
							Ingredient ingredient = new Ingredient();
							ingredient.setName(handlingIngredients[i]);
							ingredient.setStatus("Y");
							ingredient = ingredientMapper.select(ingredient);
							handling = new Handling();
							handling.setIngredientNo(ingredient.getNo());
							handling.setStatus("Y");

							if (handlingMapper.select(handling) != null) {
								handling = new Handling();
								handling.setIngredientNo(ingredient.getNo());
								handling.setSupplierNo(twoSupplier.getNo());
								handling.setStatus("N");
								handlingMapper.insert(handling);
							} else {
								handling = new Handling();
								handling.setIngredientNo(ingredient.getNo());
								handling.setSupplierNo(twoSupplier.getNo());
								handling.setStatus("Y");
								handlingMapper.insert(handling);
							}
						}
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public Supplier viewSupplier(Supplier supplier) {
		Supplier oneSupplier = new Supplier();
		oneSupplier.setNo(supplier.getNo());

		try {
			oneSupplier = supplierMapper.select(oneSupplier);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return oneSupplier;
	}

	@Override
	public Map<String, String> handlingListBySupplierNo(Supplier supplier) {
		Handling handling = new Handling();
		Ingredient ingredient = new Ingredient();
		Map<String, String> handlingIngredients = new HashMap<>();

		handling.setSupplierNo(supplier.getNo());

		try {
			List<Handling> handlingList = handlingMapper.list(handling);

			for (int i = 0; i < handlingList.size(); i++) {
				ingredient.setNo(handlingList.get(i).getIngredientNo());
				handlingIngredients.put(handlingList.get(i).getIngredientNo(),
						ingredientMapper.select(ingredient).getName());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return handlingIngredients;
	}

	@Override
	public List<Supplier> supplierList() {
		List<Supplier> supplierList = new ArrayList<>();
		Supplier supplier = new Supplier();
		supplier.setStatus("Y");

		try {
			supplierList = supplierMapper.list(supplier);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return supplierList;
	}

	@Override
	public List<Supplier> searchResultList(String keyword) {
		List<Supplier> supplierList = new ArrayList<>();
		try {
			supplierList = supplierMapper.searchResult(keyword);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return supplierList;
	}

	@Override
	public void editSupplier(Supplier supplier, String[] newHandlingIngredients) {
		if (supplier != null) {
			Handling handling = new Handling();
			handling.setSupplierNo(supplier.getNo());
			handling.setStatus("N");
			try {
				List<Handling> handlingList = handlingMapper.list(handling);

				for (int i = 0; i < handlingList.size(); i++) {
					Handling deleteHandling = new Handling();
					deleteHandling.setIngredientNo(handlingList.get(i).getIngredientNo());
					deleteHandling.setSupplierNo(handlingList.get(i).getSupplierNo());
					deleteHandling.setStatus("N");
					handlingMapper.delete(deleteHandling);
				}

				for (int i = 0; i < newHandlingIngredients.length; i++) {
					Ingredient ingredient = new Ingredient();
					ingredient.setName(newHandlingIngredients[i]);
					ingredient.setStatus("Y");
					ingredient = ingredientMapper.select(ingredient);
					handling = new Handling();
					handling.setIngredientNo(ingredient.getNo());
					handling.setStatus("Y");

					if (handlingMapper.select(handling) != null) {
						handling.setSupplierNo(supplier.getNo());
						if (handlingMapper.select(handling) == null) {
							handling.setStatus("N");
							handlingMapper.insert(handling);
						}
					} else {
						handling = new Handling();
						handling.setIngredientNo(ingredient.getNo());
						handling.setSupplierNo(supplier.getNo());
						handling.setStatus("Y");
						handlingMapper.insert(handling);
					}
				}
				supplierMapper.update(supplier);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public String deleteSupplier(Supplier supplier) {
		if (supplier != null) {
			Handling handling = new Handling();
			handling.setSupplierNo(supplier.getNo());

			try {
				List<Handling> handlingList = handlingMapper.list(handling);
				List<Supplier> list = supplierMapper.selectSupplierOnTray();
				List<String> noList = new ArrayList<>();
				for (int i = 0; i < list.size(); i++) {
					noList.add(list.get(i).getNo());
				}

				for (int i = 0; i < handlingList.size(); i++) {
					if (!noList.contains(handlingList.get(i).getSupplierNo())) {
						handlingMapper.delete(handlingList.get(i));
					} else {
						return "fail"; // 트레이에 올라간 식자재 중에 해당 거래처가 주 거래처로 설정되어 있어서 거래처 삭제 불가능
					}
				}
				supplierMapper.delete(supplier);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "success";
	}

	@Override
	public boolean checkSupplier(String name) {
		Supplier supplier = new Supplier();
		int count = 0;

		try {
			supplier.setName(name);
			supplier.setStatus("Y");
			count = supplierMapper.count(supplier);
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (count > 0) {
			return false;
		} else {
			return true;
		}
	}

	@Override
	public List<String> getIngredientList() {
		List<String> ingredientNameList = new ArrayList<>();
		Ingredient ingredient = new Ingredient();
		try {
			ingredient.setStatus("Y");
			List<Ingredient> ingredients = ingredientMapper.list(ingredient);
			for (int i = 0; i < ingredients.size(); i++) {
				ingredientNameList.add(ingredients.get(i).getName());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ingredientNameList;
	}
}
