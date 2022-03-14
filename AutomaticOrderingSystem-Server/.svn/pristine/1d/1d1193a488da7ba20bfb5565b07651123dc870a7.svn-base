package com.aos.tray;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class TrayValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		return Tray.class.isAssignableFrom(clazz) || TrayInfo.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		Tray tray = (Tray) target;
		
		if (isStringDouble(tray.getOrderWeight()) != true) {
			errors.rejectValue("orderWeight", "required", "무게는 숫자만 가능합니다.");
		}
		
		if (isStringDouble(tray.getOrderAmount()) != true) {
			errors.rejectValue("orderAmount", "required", "수량은 숫자만 가능합니다.");
		}
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "ingredientNo", "required", "식자재 선택은 필수입니다.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "orderWeight", "required", "무게설정은 필수입니다.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "orderAmount", "required", "수량설정은 필수입니다.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "zeroValue", "required", "영점 설정은 필수입니다.");
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
