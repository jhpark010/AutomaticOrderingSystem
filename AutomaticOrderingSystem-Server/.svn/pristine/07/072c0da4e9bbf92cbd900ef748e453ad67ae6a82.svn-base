<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>

<div class="slim-mainpanel">
	<div class="container">
		<div class="slim-pageheader">
			<ol class="breadcrumb slim-breadcrumb">
				<li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/aos/main">메인</a></li>
				<li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/aos/tray">트레이 관리</a></li>
				<li class="breadcrumb-item active" aria-current="page">트레이 수정</li>
			</ol> <h6 class="slim-pagetitle">트레이 수정</h6>
		</div> <!-- slim-pageheader -->

		<div class="section-wrapper mg-t-20">
			<div class="col-lg-12">
				<form action="/aos/tray/${trayInfo.no}" method="post">
					<div class="section-wrapper">
						<label class="section-title">트레이 수정</label>
						<p class="mg-b-20 mg-sm-b-40">트레이에 대한 정보를 수정할 수 있습니다.</p>
						<div class="col-lg-4">
							<div class="form-group">
								<label class="form-control-label">트레이 번호: <span
									class="tx-danger"></span></label> <input class="form-control"
									type="text" value="${trayInfo.no}" placeholder="트레이 번호"
									readonly>
							</div>
						</div>

						<div class="col-lg-4">
							<div class="form-group">
								<label class="form-control-label">식자재 명: <span
									class="tx-danger"></span></label> <input class="form-control"
									type="text" value="${trayInfo.ingredientName}"
									placeholder="발주 무게" readonly>
							</div>
						</div>

						<div class="col-lg-4">
							<div class="form-group">
								<label class="form-control-label">트레이 영점(kg): <span
									class="tx-danger"></span></label> <input class="form-control"
									type="text" id="zeroValue" name="zeroValue"
									value="${trayInfo.zeroValue}" placeholder="트레이 영점">
								<div id="zeroValid" style="color: red;"></div>
							</div>
						</div>

						<div class="col-lg-4">
							<div class="form-group">
								<label class="form-control-label">발주 무게(kg): <span
									class="tx-danger"></span></label> <input class="form-control"
									type="text" id="orderWeight" name="orderWeight"
									value="${trayInfo.orderWeight}" placeholder="발주 무게">
								<div id="weightValid" style="color: red;"></div>
							</div>
						</div>

						<div class="col-lg-4">
							<div class="form-group">
								<label class="form-control-label">발주 수량(EA): <span
									class="tx-danger"></span></label> <input class="form-control"
									type="text" id="orderAmount" name="orderAmount"
									value="${trayInfo.orderAmount}" placeholder="발주 수량">
								<div id="amountValid" style="color: red;"></div>
							</div>
						</div>
					</div> <!-- section-wrapper -->
					<div class="row">
						<div class="col-sm-6 col-md-12 mg-t-10">
							<div class="btn-demo" style="float:right;">
								<button type="button" class="btn btn-primary" style="width:150px;"
									id="validCheck">유효확인</button>
								<input type="hidden" name="_method" value="PUT" /> 
								<input class="btn btn-primary" type="submit" style="width:150px;"
									id="submit_btn" disabled="disabled" value="수정" />
								<input type="button" class="btn btn-secondary" style="width:150px;"
									onClick="location.href='<%=request.getContextPath()%>/aos/tray/${trayInfo.no }'"
									value="뒤로">
							</div> <!-- btn-demo -->
						</div> <!-- col-sm-3 -->
					</div> <!-- row -->
				</form>
			</div>
		</div>
	</div> <!-- container -->
</div> <!-- slim-mainpanel -->

<%@ include file="../include/footer.jsp"%>
</body>
<script>
	document.getElementById('validCheck').addEventListener('click', isValid);

	function isValid() {
		var weightStatus = isWeightValid();
		var amountStatus = isAmountValid();
		var zeroStatus = isZeroValid();

		var submit = document.getElementById('submit_btn');

		if (weightStatus && amountStatus && zeroStatus) {
			submit.disabled = false;
		} else {
			submit.disabled = 'disabled';
		}

	}

	function isWeightValid() {
		var weight = document.getElementById('orderWeight').value;
		var weightValid = document.getElementById('weightValid');

		console.log("유효값 검증 : weight");

		if (weight == '' || weight == null || weight > 999.999 || weight < 0
				|| !($.isNumeric(weight))) {
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

		if (amount == '' || amount == null || amount < 0
				|| !($.isNumeric(amount))) {
			var msg = "유효한 값이 아닙니다. 다시 입력해주세요";

			amountValid.innerHTML = msg;

			return false;
		} else {
			var msg = "정상 값입니다.";

			amountValid.innerHTML = msg;

			return true;
		}
	};
	
	function isZeroValid() {
		var zero = document.getElementById('zeroValue').value;
		var zeroValid = document.getElementById('zeroValid');
		
		console.log("유효값 검증 : zeroValud");
		
		console.log(zeroValid);
		
		if (zero == '' || zero == null || zero < 0
				|| !($.isNumeric(zero))) {
			var msg = "유효한 값이 아닙니다. 다시 입력해 주세요";
			
			zeroValidValid.innerHTML = msg;
			
			return false;
		} else {
			var msg = "정상 값입니다";
			
			zeroValid.innerHTML = msg;
			
			return true;
		}
	};
</script>
</html>