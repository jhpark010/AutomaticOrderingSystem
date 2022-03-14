package com.aos.supplier;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class SupplierValidator implements Validator {
	private static final String emailRegExp =
            "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@" +
            "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
    private Pattern pattern;
 
    public SupplierValidator() {
        pattern = Pattern.compile(emailRegExp);
    }
 
    @Override
    public boolean supports(Class<?> clazz) {
        return Supplier.class.isAssignableFrom(clazz);
    }
 
    @Override
    public void validate(Object target, Errors errors) {
    	Supplier supplier = (Supplier) target;
        
        if(supplier.getEmail() == null || supplier.getEmail().trim().isEmpty()) {
            errors.rejectValue("email", "required", "이메일은 필수 정보입니다.");
        } else {
            Matcher matcher = pattern.matcher(supplier.getEmail());
            if(!matcher.matches()) {
                errors.rejectValue("email", "required", "올바르지 않는 이메일 형식입니다.");
            }
        }
        
        if(supplier.getPhoneNo() == null || supplier.getPhoneNo().trim().isEmpty()) {
        	errors.rejectValue("phoneNo", "required","연락처는 필수 정보입니다.");
        } else {
        	if (isStringDouble(supplier.getPhoneNo()) != true) {
        		errors.rejectValue("phoneNo", "required", "연락처는 숫자만 입력이 가능합니다.");
        	}
        }
        
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "required", "거래처명은 필수 정보입니다.");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "zipCode", "required", "우편번호는 필수 정보입니다.");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "address", "required", "주소는 필수 정보입니다.");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "detailAddress", "required", "상세 주소는 필수 정보입니다.");
    }

    public boolean isStringDouble(String value) {
		try {
			Double.parseDouble(value);
			return true;
		} catch (NumberFormatException e) {
			return false;
		}
    }
}

