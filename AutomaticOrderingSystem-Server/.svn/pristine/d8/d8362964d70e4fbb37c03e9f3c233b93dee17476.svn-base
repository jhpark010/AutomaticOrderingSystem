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
				<li class="breadcrumb-item active" aria-current="page">트레이 등록</li>
			</ol>
			<h6 class="slim-pagetitle">트레이 등록</h6>
		</div> <!-- slim-pageheader -->

		<form action="/aos/tray" method="post">
			<div class="section-wrapper mg-t-20">
				<div class="col-lg-12">
					<div class="section-wrapper mg-t-20">
						<label class="section-title">트레이 등록</label>
						<p class="mg-b-20 mg-sm-b-40">
							트레이 등록에 필요한 정보를 입력하세요.<br>
							<br> <a style="color: red;"><b>#주의사항</b><br>주 거래처가
								설정된 식자재만 선택 가능합니다.<br> 기존 트레이에 등록된 식자재는 중복 등록할 수 없습니다.</a>
						</p>

						<c:forEach var="messagelist" items="${message}">
							<label style="color: red;"> ${messagelist} </label>
							<br>
						</c:forEach>

						<div class="form-layout form-layout-4">
							<div class="row">
								<div class="col-sm-8 mg-t-10 mg-sm-t-0">
									<label class="form-control-label">트레이 번호: <span class="tx-danger">*</span></label>
									<select name="no" class="form-control select2" style="width: 250px; height: 40px;">
										<option value="none">트레이를 선택하세요</option>
										<c:forEach items="${trayList}" var="tray">
											<option value="${tray.no}">${tray.no}</option>
										</c:forEach>
									</select>
								</div>
							</div> <!-- col-4 -->

							<div class="row mg-t-20">
								<label class="col-sm-8 mg-t-10 mg-sm-t-0">식자재<span	class="tx-danger">*</span></label>
								<div class="col-sm-8 mg-t-10 mg-sm-t-0">
									<div class="search-box"
										style="border-radius: 0px; width: 300px; height: 40px; padding: 0px">
										<input class="form-control" type="text" id="modalValueName"
											placeholder="식자재 명" readonly>
										<button type="button" class="btn btn-primary"
											style="border-radius: 0%; width: 50px" data-toggle="modal"
											data-target="#modaldemo1"
											data-effect="effect-slide-in-bottom">
											<i class="fa fa-search"></i>
										</button>
									</div>
									<div id="ingredientValid" style="color: red;"></div>
								</div>
							</div>
							<!-- 모달 시작 -->
							<div id="modaldemo1" class="modal fade">
								<div class="modal-dialog modal-dialog-vertical-center"
									role="document">
									<div class="modal-content bd-0 tx-14">
										<div class="modal-header">
											<h6 class="tx-14 mg-b-0 tx-uppercase tx-inverse tx-bold">식자재를 선택</h6>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body pd-25">
											<h5 class="lh-3 mg-b-20 tx-inverse hover-primary">트레이에서 취급할 식자재 입니다.</h5>
											<c:forEach items="${ingredientList}" var="ingredient">
												<label class="rdiobox"> <input type="radio"
													id="radioIngredient" name="ingredientNo"
													value="${ingredient.no}"> <span
													id="ingredientName${ingredient.no}">${ingredient.name}</span>
												</label>
											</c:forEach>

										</div>
										<div class="modal-footer">
											<button id="apply" type="button" class="btn btn-primary"
												onclick="selectIngredient()">적용</button>
											<button type="button" class="btn btn-secondary"
												data-dismiss="modal">취소</button>
										</div>
									</div>
								</div> <!-- modal-dialog -->
							</div> <!-- modal -->
							<!-- 모달 종료 -->
							<input name="modalIngredientNo" class="form-control"
								type="hidden" id="modalValue" placeholder="모달값" readonly>

							<div class="row mg-t-20">
								<div class="col-sm-8 mg-t-10 mg-sm-t-0">
									<label class="form-control-label">트레이 영점(kg): <span
										class="tx-danger">*</span></label> <input class="form-control"
										type="text" id="zeroValue" name="zeroValue"
										placeholder="트레이 영점" style="width: 250px;" />
									<div id="zeroValid" style="color: red;"></div>
								</div>
							</div>

							<div class="row mg-t-20">
								<div class="col-sm-8 mg-t-10 mg-sm-t-0">
									<label class="form-control-label">발주 무게(kg): <span
										class="tx-danger">*</span></label> <input class="form-control"
										type="text" id="orderWeight" name="orderWeight"
										placeholder="발주 무게" style="width: 250px;" />
									<div id="weightValid" style="color: red;"></div>
								</div>
							</div>

							<div class="row mg-t-20">
								<div class="col-sm-8 mg-t-10 mg-sm-t-0">
									<label class="form-control-label">발주 수량(EA): <span
										class="tx-danger">*</span></label> <input class="form-control"
										type="text" id="orderAmount" name="orderAmount"
										placeholder="발주 수량" style="width: 250px;" />
									<div id="amountValid" style="color: red;"></div>
								</div>
							</div>

							<div class="row">
								<!-- col-sm-3 -->
							</div> <!-- row -->
						</div> <!-- form layout -->
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-12 mg-t-10">
							<div class="btn-demo" style="float: right;">
								<input class="btn btn-primary" id="submit_btn" style="width:150px;"
									type="submit" value="등록" disabled="disabled" />
								<button type="button" class="btn btn-primary" style="width:150px;"
									id="isDuplicate">유효확인</button>
								<button type="button" class="btn btn-secondary" style="width:150px;"
									onclick="location.href='<%=request.getContextPath()%>/aos/tray'">목록</button>
							</div>
						</div>
						<div class="col-sm-6 col-md-3 mg-t-10">
							<div class="btn-demo">
							</div>
						</div>
						<div class="col-sm-6 col-md-3 mg-t-10">
							<div class="btn-demo">
							</div>
						</div>
					</div>
				</div> <!-- col-lg-12 -->
			</div> <!-- section-wrapper mg-t-20 -->
		</form>
	</div> <!-- container -->
</div> <!-- slim-mainpanel -->

</body>
<%@ include file="../include/footer.jsp"%>
<script>
	document.getElementById('isDuplicate').addEventListener('click',
			duplicate_check);

	document.getElementById('apply')
			.addEventListener('click', selectIngredient);

	function selectIngredient() {
		var ingredientNo = $('input:radio[name="ingredientNo"]:checked').val();
		var ingredientNameView = document.getElementById('modalValue');

		var value = "ingredientName" + ingredientNo;
		var ingredientName = document.getElementById(value).innerHTML

		ingredientNameView.value = ingredientNo;

		console.log(ingredientName);

		document.getElementById('modalValueName').value = ingredientName;

		$('#modaldemo1').modal('hide');
	};

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
	
	function isZeroValid() {
		var zero = document.getElementById('zeroValue').value;
		var zeroValid = document.getElementById('zeroValid');
		
		console.log("유효값 검증 :  zeroValue");
		
		if (zero == '' || zero == null || zero > 999.999 || zero < 0 || !($.isNumeric(zero))) {
			var msg = "유효한 값이 아닙니다. 다시 입력해 주세요";
			
			zeroValid.innerHTML = msg;
			
			return false;
		} else {
			var msg = "정상 값입니다.";
			
			zeroValid.innerHTML = msg;
			
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
	}

	function duplicate_check() {
		console.log("중복 체크");

		var weightStatus = isWeightValid();
		var amountStatus = isAmountValid();
		var zeroStatus = isZeroValid();

		var value = document.getElementById('modalValue').value;
		console.log("값 : " + value);
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			console.log("----->" + xhr.readyState + " / " + xhr.DONE);

			if (xhr.readyState === xhr.DONE) {
				if (xhr.status === 200 || xhr.status === 201) {
					var msg = xhr.responseText;

					var submit = document.getElementById('submit_btn');

					if (msg == 'true') {
						document.getElementById('ingredientValid').innerHTML = "정상 값입니다.";
					} else {
						document.getElementById('ingredientValid').innerHTML = "유효한 값이 아닙니다. 다시 입력해주세요";
					}

					if (msg == 'true' && value != '' && weightStatus
							&& amountStatus && zeroStatus) {
						submit.disabled = false;
					} else if (msg == 'false' || !(weightStatus)
							|| !(amountStatus) || !(zeroStatus)) {
						submit.disabled = 'disabled';
					} else {
						submit.disabled = 'disabled';
					}

				} else {
					console.error(xhr.responseText);
				}
			}
		};
		var ingredientNo = "no=" + document.getElementById('modalValue').value;
		xhr.open("POST", "http://localhost/aos/tray/check", true);
		xhr.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");
		xhr.send(ingredientNo);
	};
</script>

<script>
	$(function() {

		// showing modal with effect
		$('.modal-effect').on('click', function(e) {
			e.preventDefault();
			var effect = $(this).attr('data-effect');
			$('#modaldemo8').addClass(effect);
		});

		// hide modal with effect
		$('#modaldemo8').on('hidden.bs.modal', function(e) {
			$(this).removeClass(function(index, className) {
				return (className.match(/(^|\s)effect-\S+/g) || []).join(' ');
			});
		});
	});
</script>

</html>