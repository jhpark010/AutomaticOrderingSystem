package com.aos.account;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class AccountValidator  implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		return Account.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "id", "required", "Id는 필수입력입니다.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "required", "Password는 필수 입력입니다.");
	}

}
