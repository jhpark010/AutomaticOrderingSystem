<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>
<c:set var="msn" value="${mainSupplierName}" />

<div class="slim-mainpanel">
	<div class="container">

		<div class="slim-pageheader">
			<ol class="breadcrumb slim-breadcrumb">
				<li class="breadcrumb-item"><a
					href="<%=request.getContextPath()%>/aos/main">메인</a></li>
				<li class="breadcrumb-item"><a
					href="<%=request.getContextPath()%>/aos/ingredient">식자재 관리</a></li>
				<li class="breadcrumb-item">식자재 수정</li>
			</ol>
			<h6 class="slim-pagetitle">식자재 수정</h6>
		</div>
		<div class="section-wrapper mg-t-20">
			<form action="/aos/ingredient" method="post" name="editForm">
				<input type="hidden" name="_method" value="PUT" /> <input
					id="ingredientName" type="hidden" name="no"
					value="${ingredient.no}">
				<div class="col-lg-12">
					<div class="section-wrapper">
						<label class="section-title">식자재 수정</label>
						<p class="mg-b-20 mg-sm-b-40">${ingredient.name}를수정하세요.</p>
						<div class="form-layout form-layout-4">
							<div class="row">
								<div class="col-sm-8 mg-t-10 mg-sm-t-0">
									<label class="form-control-label">식자재 명: <span
										class="tx-danger">*</span></label>
									<div id="display"></div>
									<input id="ingredientName" type="text" class="form-control"
										name="name" value="${ingredient.name}" readonly>
								</div>
							</div>
							<div class="row mg-t-20">
								<div class="col-sm-8 mg-t-10 mg-sm-t-0">
									<label class="form-control-label">단위 무게(kg): <span
										class="tx-danger">*</span></label> <input id="unitWeight" type="text"
										class="form-control" name="unitWeight"
										value="${ingredient.unitWeight}">
									<div id="weightValid" style="color: red;"></div>
								</div>
							</div>
							<div class="row mg-t-20">
								<div class="col-sm-8 mg-t-10 mg-sm-t-0">
									<label class="form-control-label">단위 가격(₩): <span
										class="tx-danger">*</span></label> <input type="hidden" name="status"
										value="${ingredient.status}"> <input id="unitPrice"
										type="text" class="form-control" name="unitPrice"
										value="${ingredient.unitPrice}">
									<div id="priceValid" style="color: red;"></div>
								</div>
							</div>
							<input id="presentSupplier" type="hidden" class="form-control"
								name="presentSupplier" value="${mainSupplierName}">
							<div class="row mg-t-20">
								<label class="col-sm-8 mg-t-10 mg-sm-t-0">주 거래처 명: <span
									class="tx-danger">*</span></label>
								<div class="col-sm-8 mg-t-10 mg-sm-t-0">

									<div class="search-box"
										style="border-radius: 0px; width: 200px; height: 40px;">
										<input id="presentSupplier1" type="text" class="form-control"
											name="presentSupplier1" style="width: 200px; height: 40px;"
											value="${mainSupplierName}" readonly />
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
														<c:choose>
															<c:when test="${list eq msn }">
																<td><input type="radio" name="mainSupplier"
																	value="${list}" checked /></td>
															</c:when>
															<c:otherwise>
																<td><input type="radio" name="mainSupplier"
																	value="${list}" /></td>
															</c:otherwise>
														</c:choose>
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
							<div class="btn-demo" style="float: right;">
								<button class="btn btn-primary" type="button"
									style="width: 150px;" onclick="validCheck()" id="submit_btn">등록</button>
								<button type="button" class="btn btn-secondary"
									style="width: 150px;"
									onclick="location.href ='<%=request.getContextPath()%>/aos/ingredient'"
									id="backList">뒤로</button>
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
	function validCheck() {
		var msg = "";
		var weight = document.getElementById('unitWeight').value;
		var weightValid = document.getElementById('weightValid');
		var price = document.getElementById('unitPrice').value;
		var priceValid = document.getElementById('priceValid');

		if (weight == '' || weight == null || weight > 999.999 || weight < 0
				|| !($.isNumeric(weight))) {
			msg = "단위 무게는 필수사항이며, 숫자만 가능합니다."
			weightValid.innerHTML = msg;
			return;
		} else {
			msg = "정상 값입니다.";
			weightValid.innerHTML = msg;
		}

		if (price == '' || price == null || price > 999999.999 || price < 0
				|| !($.isNumeric(price))) {
			msg = "단위 가격는 필수사항이며, 숫자만 가능합니다."
			priceValid.innerHTML = msg;
			return;
		} else {
			msg = "정상 값입니다.";
			priceValid.innerHTML = msg;
		}
		document.editForm.submit();

	}
</script>

<script>
	document.getElementById('confirm')
			.addEventListener('click', selectSupplier);

	function selectSupplier() {
		var supplierName = $('input:radio[name="mainSupplier"]:checked').val();
		console.log(supplierName);
		if (supplierName == null) {
			supplierName = "주 거래처 없음";
		}
		var value = "" + supplierName;
		document.getElementById('presentSupplier1').value = value;
	}
</script>

</html>