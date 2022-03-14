package com.aos.ingredient;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class IngredientValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		return Ingredient.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		Ingredient ingredient = (Ingredient) target;
		
		if (isStringDouble(ingredient.getUnitWeight()) != true) {
			errors.rejectValue("unitWeight", "required", "무게는 숫자만 가능합니다.");
		}
		
		if (isStringDouble(ingredient.getUnitPrice()) != true) {
			errors.rejectValue("unitPrice", "required", "가격은 숫자만 가능합니다.");
		}
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "required", "이름은 필수항목입니다.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "unitWeight", "required", "무게설정은 필수입니다.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "unitPrice", "required", "금액은 필수항목입니다.");
	}
	
	public boolean isStringDouble(String value) {
		try {
			Double.parseDouble(value); // 숫자
			return true;
		} catch (NumberFormatException e) {
			return false; //문자
		}
	}

}
