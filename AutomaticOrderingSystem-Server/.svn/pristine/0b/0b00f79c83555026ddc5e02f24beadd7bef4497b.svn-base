<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>

<div class="slim-mainpanel">
	<div class="container">

		<div class="slim-pageheader">
			<ol class="breadcrumb slim-breadcrumb">
				<li class="breadcrumb-item"><a
					href="<%=request.getContextPath()%>/aos/main">메인</a></li>
				<li class="breadcrumb-item"><a
					href="<%=request.getContextPath()%>/aos/ingredient">식자재 관리</a></li>
				<li class="breadcrumb-item">식자재 등록</li>
			</ol>
			<h6 class="slim-pagetitle">식자재 등록</h6>
		</div>

		<div class="section-wrapper mg-t-20">
			<form name='regit' action="/aos/ingredient" method="post">
				<div class="col-lg-12">
					<div class="section-wrapper mg-t-20">
						<label class="section-title">식자재 등록</label>
						<p class="mg-b-20 mg-sm-b-40">항목에 정보를 입력하세요.</p>
						<div class="form-layout form-layout-4">

							<c:forEach var="messagelist" items="${message}">
								<label style="color: red;"> ${messagelist} </label>
								<br>
							</c:forEach>

							<div class="row mg-t-20">
								<div class="col-sm-8 mg-t-10 mg-sm-t-0">
									<label class="form-control-label">식자재 명: <span
										class="tx-danger">*</span></label>
									<div class="search-box"
										style="border-radius: 0px; width: 200px; height: 40px; background-color: white;">
										<input type="text" class="form-control" name="name"
											id="ingredientName" placeholder="식자재를 입력하세요."
											style="width: 200px; height: 40px;" /> 
										<input id="btn" class="btn btn-primary" 
											style="border-radius: 0px; width: 100px; height: 40px;"
											type="button" value="중복체크"/>
									</div>
									<div id="display" style="color: red;"></div>
								</div>
							</div>
							
							<div class="row mg-t-20">
								<div class="col-sm-8 mg-t-10 mg-sm-t-0">
									<label class="form-control-label">단위 무게(kg): <span
										class="tx-danger">*</span></label> <input id="unitWeight" type="text"
										class="form-control" placeholder="단위 무게 입력" name="unitWeight"
										numberOnly>
									<div id="weightValid" style="color: red;"></div>
								</div>
							</div>
							<div class="row mg-t-20">
								<div class="col-sm-8 mg-t-10 mg-sm-t-0">
									<label class="form-control-label">단위 가격(₩): <span
										class="tx-danger">*</span>
									</label> <input id="unitPrice" type="text" class="form-control"
										placeholder="단위 가격 입력" name="unitPrice" numberOnly>
									<div id="priceValid" style="color: red;"></div>
								</div>
							</div>

							<div class="row mg-t-20">
								<label class="col-sm-8 mg-t-10 mg-sm-t-0">주 거래처 명: <span
									class="tx-danger">*</span></label>

								<div class="col-sm-8 mg-t-10 mg-sm-t-0">

									<div class="search-box"
										style="border-radius: 0px; width: 200px; height: 40px;">
										<input id="presentSupplier1" type="text" class="form-control"
											name="presentSupplier1" style="width: 200px; height: 40px;"
											disabled />
										<button type="button" class="btn btn-primary"
											style="border-radius: 0%;" data-toggle="modal"
											data-target="#exampleModal">
											<i class="fa fa-search"></i>
										</button>
									</div>

								</div>

							</div>

							<!-- 모달 -->
							<div class="modal fade" id="exampleModal" tabindex="-1"
								role="dialog" aria-labelledby="exampleModalLabel"
								aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">등록된 거래처
												목록</h5>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>

										<div class="modal-body" style="text-align: center">
											<table style="width: 100%">
												<c:forEach var="list" items="${supplierList}">
													<tr>
														<td>${list}</td>
														<td><input type="radio" name="mainSupplier"
															value="${list}" /></td>
													</tr>
												</c:forEach>
											</table>
										</div>

										<div class="modal-footer">
											<button type="button" class="btn btn-primary" id="confirm"
												data-dismiss="modal">확인</button>
											<button type="button" class="btn btn-secondary"
												data-dismiss="modal">닫기</button>
										</div>

									</div>
								</div>
							</div>

						</div>

					</div>
					<div class="row">
						<div class="col-sm-6 col-md-12 mg-t-10">
							<div class="btn-demo" style="float:right;">
								<button class="btn btn-primary" type="button" style="width:150px;"
								onclick="validCheck()" id="submit_btn" disabled="disabled">등록</button>
								<button class="btn btn-secondary" type="button" style="width:150px;"
									onClick="location.href='<%=request.getContextPath()%>/aos/ingredient'">목록</button>
							</div>
						</div>
						<div class="col-sm-6 col-md-3 mg-t-10">
							<div class="btn-demo">
							</div>
						</div>
					</div>

				</div>
			</form>
		</div>

	</div>
</div>


<%@ include file="../include/footer.jsp"%>
</body>

<script>
	$("input:text[numberOnly]").on("keyup", function() {
		$(this).val($(this).val().replace(/[^0-9]/g, ""));
	});
</script>

<script>
	document.getElementById('confirm')
			.addEventListener('click', selectSupplier);

	function selectSupplier() {
		var supplierName = $('input:radio[name="mainSupplier"]:checked').val();
		if (supplierName == null) {
			supplierName = "주 거래처 없음";
		}
		console.log(supplierName);
		var value = "" + supplierName;
		document.getElementById('presentSupplier1').value = value;
	}
</script>

<script>
	document.getElementById('btn').addEventListener('click', ajax_call);

	function ajax_call() {

		var submit = document.getElementById('submit_btn');

		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			console.log("----->" + xhr.readyState + " / " + xhr.DONE);

			if (xhr.readyState === xhr.DONE) {
				if (xhr.status === 200 || xhr.status === 201) {
					var msg = xhr.responseText;

					if (msg == 'true') {
						document.getElementById('display').innerHTML = "사용 가능 합니다.";
					} else {
						document.getElementById('display').innerHTML = "식자재 명이 중복됩니다.";
					}

					if (msg == 'true') {
						submit.disabled = false;
						regit.name.readOnly = true;
					} else if (msg == 'false') {
						submit.disabled = 'disabled';
					} else {
						submit.disabled = 'disabled';
					}

				} else {
					console.error(xhr.responseText);
				}
			}
		};
		var date = "ingredientName="
				+ document.getElementById('ingredientName').value;
		xhr.open("POST", "http://localhost/aos/ingredient/check", true);
		xhr.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");
		xhr.send(date);
	};
</script>

<script>
	function validCheck() {
		var msg = "";
		var weight = document.getElementById('unitWeight').value;
		var weightValid = document.getElementById('weightValid');
		var price = document.getElementById('unitPrice').value;
		var priceValid = document.getElementById('priceValid');

		if (weight == '' || weight == null || weight > 999.999 || weight < 0
				|| !($.isNumeric(weight))) {
			msg = "단위 무게는 필수사항입니다."
			weightValid.innerHTML = msg;
			return;
		} else {
			msg = "정상 값입니다.";
			weightValid.innerHTML = msg;
		}

		if (price == '' || price == null || price > 999999.999 || price < 0
				|| !($.isNumeric(price))) {
			msg = "단위 가격는 필수사항입니다."
			priceValid.innerHTML = msg;
			return;
		} else {
			msg = "정상 값입니다.";
			priceValid.innerHTML = msg;
		}
		document.regit.submit();
	}
</script>

</html>