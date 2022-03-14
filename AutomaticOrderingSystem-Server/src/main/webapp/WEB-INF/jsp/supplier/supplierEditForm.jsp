<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../include/header.jsp"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<c:set var="supplier" value="${supplier }" />
<c:set var="handlingIngredients" value="${handlingIngredients }"/>
<div class="slim-mainpanel">
	<div class="container">
		<div class="slim-pageheader">
			<ol class="breadcrumb slim-breadcrumb">
				<li class="breadcrumb-item"><a
					href="<%=request.getContextPath()%>/aos/main">메인</a></li>
				<li class="breadcrumb-item"><a
					href="<%=request.getContextPath()%>/aos/supplier">거래처 관리</a></li>
				<li class="breadcrumb-item">거래처 수정</li>
			</ol>
			<h6 class="slim-pagetitle">거래처 수정</h6>
		</div>
		<div class="section-wrapper mg-t-20">
			<div class="col-lg-12">
				<div class="section-wrapper">
					<label class="section-title">거래처 수정</label>
					<p class="mg-b-20 mg-sm-b-40">시스템에 거래처를 수정할 수 있는 정보는 아래와 같습니다.<br><br>
							<a style="color:red;"><b>#주의사항</b><br>거래처 수정에서의 취급 식자재 변경이 제한되는 경우는 아래와 같다.<br>
							●취급하는 식자재가 트레이에 등록되어 있으며, 주 거래처가 해당 거래처일 경우에<br>
							　해당 식자재는 취급 목록에서 수정(삭제)할 수 없다.<br>
							● 다만, 식자재 관리에서 해당 식자재의 주 거래처를 변경하면 취급 목록에서 수정(삭제)할 수 있다.</a>
					</p>
					<div class="form-layout form-layout-4">
						<form action="<%=request.getContextPath()%>/aos/supplier"
							method="post" name="editForm">
							<input type="hidden" name="_method" value="PUT" /> <input
								type="hidden" name="no" value="${supplier.no }"> <input
								type="hidden" name="status" value="${supplier.status }">
							<div class="row">
								<label class="col-sm-4 form-control-label">거래처명 :</label>
								<div class="col-sm-8 mg-t-10 mg-sm-t-0">
									<input type="text" name="name" class="form-control" style="width: 230px;"
										value="${supplier.name }" readonly>
								</div>
							</div>
							<!-- row -->
							<div class="row mg-t-20">
								<label class="col-sm-4 form-control-label">취급 식자재 목록 : <span
									class="tx-danger">*</span></label>
								<div class="col-sm-8 mg-t-10 mg-sm-t-0">
									<!-- modal로 목록 출력 -->
									<div class="search-box" style="border-radius: 0px; width: 200px; height: 40px;">
									<input type="text" class="form-control" name="handlingIngredients" style="width: 200px; height: 40px;"readonly/>
									<button type="button" class="btn btn-primary" style="border-radius: 0%;"
										data-toggle="modal" data-target="#exampleModal">
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
										style="width: 200px; height: 40px;"
										value="${supplier.phoneNo }" numberonly/>
									<div id="phoneNoValid" style="color: red;"></div>
								</div>
							</div>
							<div class="row mg-t-20">
								<label class="col-sm-4 form-control-label">이메일 : <span
									class="tx-danger">*</span></label>
								<div class="col-sm-8 mg-t-10 mg-sm-t-0">
									<input type="text" name="email" class="form-control" style="width: 200px;"
										value="${supplier.email }">
									<div id="emailValid" style="color: red;"></div>
								</div>
							</div>
							<div class="row mg-t-20">
								<label class="col-sm-4 form-control-label">우편번호 : <span
									class="tx-danger">*</span></label>
								<div class="col-sm-8 mg-t-10 mg-sm-t-0">
									<div class="search-box" style="border-radius: 0px; width: 120px; height: 40px;">
									<input type="text" name="zipCode" class="form-control" style="width: 110px; height: 40px;" value="${supplier.zipCode }" readonly/>
									<div id="zipCodeValid" style="color: red;"></div>
									<button type="button" class="btn btn-primary" id="zipCodeBtn" style="border-radius: 0%;">
										<i class="fa fa-search"></i>
									</button>
									</div>
								</div>
							</div>
							<div class="row mg-t-20">
								<label class="col-sm-4 form-control-label">주소 : <span
									class="tx-danger">*</span></label>
								<div class="col-sm-8 mg-t-10 mg-sm-t-0">
									<input type="text" name="address" class="form-control"
										value="${supplier.address }" readonly>
									<div id="addressValid" style="color: red;"></div>
								</div>
							</div>
							<div class="row mg-t-20">
								<label class="col-sm-4 form-control-label">상세주소 : <span
									class="tx-danger">*</span></label>
								<div class="col-sm-8 mg-t-10 mg-sm-t-0">
									<input type="text" name="detailAddress" class="form-control"
										value="${supplier.detailAddress }">
									<div id="detailAddressValid" style="color: red;"></div>
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6 col-md-12 mg-t-10">
						<div class="btn-demo" style="float:right;">
							<button class="btn btn-primary" type="button" style="width:150px;"
								onclick="validCheck()">확인</button>
							<button type="button" class="btn btn-secondary" style="width:150px;"
								onClick="history.go(-1)">뒤로</button>
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
								<td><input type="checkbox" name="ingredient" value="${ingredient }" /></td>
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
			document.editForm.handlingIngredients.value = array;
		});
	});
</script>
<script>
		function validCheck(){
			var msg = "";
			var phoneNoValid = document.getElementById('phoneNoValid');
			var emailValid = document.getElementById('emailValid');
			var zipCodeValid = document.getElementById('zipCodeValid');
			var addressValid = document.getElementById('addressValid');
			var detailAddressValid = document.getElementById('detailAddressValid');
		
			if(document.editForm.phoneNo.value==''){
				msg = "연락처는 필수 사항입니다.";
				phoneNoValid.innerHTML = msg;
				return;
			}else if(document.editForm.phoneNo.value.length < 11 || document.editForm.phoneNo.value.length > 11){
				msg = "-제외한 11자리를 입력해주세요.";
				phoneNoValid.innerHTML = msg;
				return;
			}else {
				phoneNoValid.innerHTML = "";
			}
			
			if(document.editForm.email.value==''){
				msg = "이메일은 필수 사항입니다.";
				emailValid.innerHTML = msg;
				return;
			}else {
				emailValid.innerHTML = "";
			}
			
			if(document.editForm.zipCode.value==''){
				msg = "우편번호는 필수 사항입니다.";
				zipCodeValid.innerHTML = msg;
				return;
			}else {
				zipCodeValid.innerHTML = "";
			}
			
			if(document.editForm.address.value==''){
				msg = "주소는 필수 사항입니다.";
				addressValid.innerHTML = msg;
				return;
			}else {
				addressValid.innerHTML = "";
			}
			
			if(document.editForm.detailAddress.value==''){
				msg = "상세주소는 필수 사항입니다.";
				detailAddressValid.innerHTML = msg;
				return;
			}else if(document.editForm.detailAddress.value!=''){
				detailAddressValid.innerHTML = "";
			}
			document.editForm.submit();				
		}
</script>
<script>
	var ingredients = new Array();
	<c:forEach items="${handlingIngredients}" var="ingredient">
		ingredients.push("${ingredient}");
	</c:forEach>
	document.editForm.handlingIngredients.value = ingredients;
</script>
</html>