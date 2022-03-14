	document.getElementById('trayForm').addEventListener('click', form_call);
	
	document.getElementById('isDuplicate').addEventListener('click', duplicate_check);
	

	function form_call() {
		location.href = "/aos/tray/form";
	}
	
	function isWeightValid() {
		var weight = document.getElementById('orderWeight').value;
		var weightValid = document.getElementById('weightValid');
		
		console.log("유효값 검증 : weight");
		
		if (weight == '' || weight == null || weight > 999.999 || weight < 0 || !($.isNumeric(weight))) {
			var msg = "유효한 값이 아닙니다. 다시 입력해주세요";
			
			weightValid.innerHTML = msg;
			
			return false;
		} else {
			var msg = "정상 값입니다.";
			
			weightValid.innerHTML = msg;
			
			return true;
		}
	};
	
	function isAmountValid() {
		var amount = document.getElementById('orderAmount').value;
		var amountValid = document.getElementById('amountValid');
		
		console.log("유효값 검증 : amount");
		
		console.log(amount);
		
		if (amount == '' || amount == null || amount < 0 || !($.isNumeric(amount))) {
			var msg = "유효한 값이 아닙니다. 다시 입력해주세요";
			
			amountValid.innerHTML = msg;
			
			return false;
		} else {
			var msg = "정상 값입니다.";
			
			amountValid.innerHTML = msg;
			
			return true;
		}
	}
	
	function duplicate_check() {
		console.log("중복 체크");
		
		var weightStatus = isWeightValid();
		var amountStatus = isAmountValid();
		
		var value = document.getElementById('ingredientNo').value;
		console.log("값 : " + value);
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			console.log("----->" + xhr.readyState + " / " + xhr.DONE);

			if (xhr.readyState === xhr.DONE) {
				if (xhr.status === 200 || xhr.status === 201) {
					var msg = xhr.responseText;

					var submit = document.getElementById('submit_btn');
					
					if (msg == 'true' && value != '' && weightStatus && amountStatus) {
						submit.disabled = false;
					} else if (msg == 'false' || !(weightStatus) || !(amountStatus)) {
						submit.disabled = 'disabled';
					} else {
						submit.disabled = 'disabled';
					}
			
				} else {
					console.error(xhr.responseText);
				}
			}
		};
		var ingredientNo = "no="
				+ document.getElementById('ingredientNo').value;
		xhr.open("POST", "http://localhost/aos/tray/check", true);
		xhr.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");
		xhr.send(ingredientNo);
	};
	
	
		function isValid() {
		var weightStatus = isWeightValid();
		var amountStatus = isAmountValid();
		
		var submit = document.getElementById('submit_btn');
		
		if (weightStatus && amountStatus) {
			submit.disabled = false;
		} else {
			submit.disabled = 'disabled';	
		}
		
	}

	function isWeightValid() {
		var weight = document.getElementById('orderWeight').value;
		var weightValid = document.getElementById('weightValid');
		
		console.log("유효값 검증 : weight");
		
		if (weight == '' || weight == null || weight > 999.999 || weight < 0 || !($.isNumeric(weight))) {
			var msg = "유효한 값이 아닙니다. 다시 입력해주세요";
			
			weightValid.innerHTML = msg;
			
			return false;
		} else {
			var msg = "정상 값입니다.";
			
			weightValid.innerHTML = msg;
			
			return true;
		}
	};
	
	function isAmountValid() {
		var amount = document.getElementById('orderAmount').value;
		var amountValid = document.getElementById('amountValid');
		
		console.log("유효값 검증 : amount");
		
		console.log(amount);
		
		if (amount == '' || amount == null || amount < 0 || !($.isNumeric(amount))) {
			var msg = "유효한 값이 아닙니다. 다시 입력해주세요";
			
			amountValid.innerHTML = msg;
			
			return false;
		} else {
			var msg = "정상 값입니다.";
			
			amountValid.innerHTML = msg;
			
			return true;
		}
	}