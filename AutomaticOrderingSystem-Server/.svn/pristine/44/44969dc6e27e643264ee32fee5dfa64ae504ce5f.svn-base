<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<div class="slim-mainpanel">
	<div class="container">
		<div class="slim-pageheader">
			<ol class="breadcrumb slim-breadcrumb">
				<li class="breadcrumb-item"><a
					href="<%=request.getContextPath()%>/aos/main">메인</a></li>
				<li class="breadcrumb-item"><a
					href="<%=request.getContextPath()%>/aos/supplier">거래처 관리</a></li>
				<li class="breadcrumb-item">거래처 등록</li>
			</ol>
			<h6 class="slim-pagetitle">거래처 등록</h6>
		</div>
		<div class="section-wrapper mg-t-20">
			<div class="col-lg-12">
				<div class="section-wrapper mg-t-20">
					<label class="section-title">거래처 등록</label>
					<p class="mg-b-20 mg-sm-b-40">시스템에 거래처를 등록하기 위한 필수 입력 정보입니다.</p>
					<p class="mg-b-20 mg-sm-b-40" style="color: red;">
						<c:if test="${not empty errorMessages }">
							#경고 : 아래와 같은 문제로 인해 거래처 등록을 할 수 없습니다.<br>
							<c:forEach items="${errorMessages }" var="errorMessage">
								● ${errorMessage }<br>
							</c:forEach>
						</c:if>
					</p>
					<form action="<%=request.getContextPath()%>/aos/supplier"
						method="post" name="registForm" data-parsley-validate novalidate>
						<div class="form-layout form-layout-4">
							<div class="row">
								<label class="col-sm-4 form-control-label">거래처명 : <span
									class="tx-danger">*</span></label>
								<div class="col-sm-8 mg-t-10 mg-sm-t-0">
									<div class="search-box" id="nameArea"
										style="border-radius: 0px; width: 200px; height: 40px;  background-color: white;">
										<input type="text" class="form-control" name="name"
											id="supplierName" placeholder="거래처를 입력하세요."
											style="width: 200px; height: 40px;"/> 
											<input class="btn btn-primary"
											style="border-radius: 0px; width: 100px; height: 40px;"
											type="button" value="중복체크" id="duplicateBtn" />
									</div>
									<div id="display" style="color: red;"></div>
								</div>
							</div>
							<!-- row -->
							<div class="row mg-t-20">
								<label class="col-sm-4 form-control-label">취급 식자재 목록 :</label>
								<div class="col-sm-8 mg-t-10 mg-sm-t-0">
									<div class="search-box"
										style="border-radius: 0px; width: 200px; height: 40px; background-color: #e9ecef;">
										<input type="text" class="form-control"
											name="handlingIngredients"
											style="width: 200px; height: 40px;" readonly>
										<button type="button" class="btn btn-primary"
											style="border-radius: 0%;" data-toggle="modal"
											data-target="#exampleModal">
											<i class="fa fa-search"></i>
										</button>
									</div>
								</div>
							</div>
							<div class="row mg-t-20">
								<label class="col-sm-4 form-control-label">연락처( - 제외) :
									<span class="tx-danger">*</span>
								</label>
								<div class="col-sm-8 mg-t-10 mg-sm-t-0">
									<input type="text" name="phoneNo" class="form-control"
										style="width: 200px; height: 40px;" placeholder="연락처를 입력하세요."
										numberOnly />
									<div id="phoneNoValid" style="color: red;"></div>
								</div>
							</div>
							<div class="row mg-t-20">
								<label class="col-sm-4 form-control-label">이메일 : <span
									class="tx-danger">*</span></label>
								<div class="col-sm-8 mg-t-10 mg-sm-t-0">
									<input type="email" name="email" class="form-control"
										id="email" placeholder="이메일을 입력하세요.">
									<div id="emailValid" style="color: red;"></div>
								</div>
							</div>
							<div class="row mg-t-20">
								<label class="col-sm-4 form-control-label">우편번호 : <span
									class="tx-danger">*</span></label>
								<div class="col-sm-8 mg-t-10 mg-sm-t-0">
									<div class="search-box"
										style="border-radius: 0px; width: 120px; height: 40px; background-color: #e9ecef;">
										<input type="text" name="zipCode" class="form-control"
											style="width: 110px; height: 40px;" readonly />
										<button type="button" class="btn btn-primary" id="zipCodeBtn"
											style="border-radius: 0%;">
											<i class="fa fa-search"></i>
										</button>
									</div>
									<div id="zipCodeValid" style="color: red;"></div>
								</div>
							</div>
							<div class="row mg-t-20">
								<label class="col-sm-4 form-control-label">주소 : <span
									class="tx-danger">*</span></label>
								<div class="col-sm-8 mg-t-10 mg-sm-t-0" >
									<input type="text" name="address" class="form-control" style="background-color: #e9ecef;" readonly>
									<div id="addressValid" style="color: red;"></div>
								</div>
							</div>
							<div class="row mg-t-20">
								<label class="col-sm-4 form-control-label">상세주소 : <span
									class="tx-danger">*</span></label>
								<div class="col-sm-8 mg-t-10 mg-sm-t-0">
									<input type="text" name="detailAddress" class="form-control">
									<div id="detailAddressValid" style="color: red;"></div>
								</div>
							</div>
						</div>
					</form>
				</div>
				<div class="row">
					<div class="col-sm-6 col-md-12 mg-t-10">
						<div class="btn-demo" style="float:right;">
							<button class="btn btn-primary" type="button" style="width:150px;"
								onclick="validCheck()" id="submitBtn" disabled="disabled">확인</button>
							<input class="btn btn-secondary" type="button" style="width:150px;"
								onClick="location.href='<%=request.getContextPath()%>/aos/supplier'"
								value="목록">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">취급 식자재 목록</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body" style="text-align: center">
				<table style="width: 100%">
					<c:forEach var="ingredient" items="${ingredientNameList }">
						<tr>
							<td>${ingredient }</td>
							<td><input type="checkbox" name="ingredient"
								value="${ingredient }" /></td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="confirm"
					data-dismiss="modal">확인</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<%@ include file="../include/footer.jsp"%>
</body>
<script>
$("input:text[numberOnly]").on("keyup", function() {
    $(this).val($(this).val().replace(/[^0-9]/g,""));
});

</script>
<script>
	document.getElementById('duplicateBtn').addEventListener('click', ajax_call);

	function ajax_call() {
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			console.log("----->" + xhr.readyState + " / " + xhr.DONE);

			if (xhr.readyState === xhr.DONE) {
				if (xhr.status === 200 || xhr.status === 201) {
					var msg = xhr.responseText;
					var submit = document.getElementById('submitBtn');
					if(msg == 'true') {
						document.getElementById('display').innerHTML = "거래처명이 중복되지 않습니다.";
						document.getElementById('supplierName').readOnly = true;
						document.getElementById('nameArea').style.backgroundColor="#e9ecef";
					} else {
						document.getElementById('display').innerHTML = "거래처명이 중복됩니다.";
					}
					
					if (msg == 'true') {
						submit.disabled = false;
					} else if (msg == 'false') {
						submit.disabled = 'disabled';
					}
				} else {
					console.error(xhr.responseText);
				}
			}
		};
		var data = "name="+document.getElementById('supplierName').value;
		xhr.open("POST", "http://localhost/aos/supplier/check", true);
		xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhr.send(data);
	};
</script>
<script>
	document.getElementById('zipCodeBtn').addEventListener('click', openZipSearch);
	function openZipSearch() {
		new daum.Postcode({
			oncomplete : function(data) {
				$('[name=zipCode]').val(data.zonecode);
				$('[name=address]').val(data.address);
				$('[name=detailAddress]').val(data.buildingName);
			}
		}).open();
	}
</script>
<script>
$(document).ready(
		function() {
				$("#confirm").click(function() {
				var test2 = document.getElementsByName("ingredient");
				var len = test2.length;
				var cnt = 0;
				var array = new Array();
 
			for (var i = 0; i < len; i++) {
				if (test2[i].checked == true) {
					array[cnt]=test2[i].value;
					cnt++;
				}
			}
			document.registForm.handlingIngredients.value = array;
		});
	});
</script>
<script>
	function CheckEmail(str){
		var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
		if (!reg_email.test(str)) {
			return false;
		}
		else {
			return true;
		}
	}
</script>
<script>
		function validCheck(){
			var msg = "";
			var phoneNoValid = document.getElementById('phoneNoValid');
			var emailValid = document.getElementById('emailValid');
			var zipCodeValid = document.getElementById('zipCodeValid');
			var addressValid = document.getElementById('addressValid');
			var detailAddressValid = document.getElementById('detailAddressValid');
			var email = document.getElementById('email');
			var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
			
			if(document.registForm.name.value==''){
				alert("거래처는 필수 입력 항목입니다.");
				return;
			}
			
			if(document.registForm.phoneNo.value==''){
				msg = "연락처는 필수 사항입니다.";
				phoneNoValid.innerHTML = msg;
				return;
			}else if(document.registForm.phoneNo.value.length < 11 || document.registForm.phoneNo.value.length > 11){
				msg = "-제외한 11자리를 입력해주세요.";
				phoneNoValid.innerHTML = msg;
				return;
			}else {
				phoneNoValid.innerHTML = "";
			}
			
			if(document.registForm.email.value==''){
				msg = "이메일은 필수 사항입니다.";
				emailValid.innerHTML = msg;
				return;
			}else {
				if(!CheckEmail(email.value)) {
					msg = "올바른 이메일 형식으로 작성해주세요.";
					emailValid.innerHTML = msg;
					return;
				}else {
					emailValid.innerHTML = "";
				}
			}
			
			if(document.registForm.zipCode.value==''){
				msg = "우편번호는 필수 사항입니다.";
				zipCodeValid.innerHTML = msg;
				return;
			}else {
				zipCodeValid.innerHTML = "";
			}
			
			if(document.registForm.address.value==''){
				msg = "주소는 필수 사항입니다.";
				addressValid.innerHTML = msg;
				return;
			}else {
				addressValid.innerHTML = "";
			}
			
			if(document.registForm.detailAddress.value==''){
				msg = "상세주소는 필수 사항입니다.";
				detailAddressValid.innerHTML = msg;
				return;
			}else if(document.registForm.detailAddress.value!=''){
				detailAddressValid.innerHTML = "";
			}
			document.registForm.submit();				
		}
</script>
</html>