<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="../include/header.jsp"%>

<div class="slim-mainpanel">
	<div class="container">
		<div class="slim-pageheader">
			<ol class="breadcrumb slim-breadcrumb">
				<li class="breadcrumb-item"><a
					href="<%=request.getContextPath()%>/aos/main">메인</a></li>
				<li class="breadcrumb-item"><a
					href="<%=request.getContextPath()%>/aos/tray">트레이 관리</a></li>
				<li class="breadcrumb-item active" aria-current="page">트레이 정보</li>
			</ol>
			<h6 class="slim-pagetitle">트레이 정보</h6>
		</div>
		<!-- slim-pageheader -->

		<div class="section-wrapper mg-t-20">
			<div class="col-lg-12">
				<div class="section-wrapper">
					<label class="section-title">트레이 정보</label>
					<p class="mg-b-20 mg-sm-b-40">${tray.no}번트레이 정보입니다.</p>
					<div class="form-layout form-layout-4">
						<div class="row">
							<div class="col-sm-8 mg-t-10 mg-sm-t-0">
								<label class="form-control-label">트레이 번호: <span
									class="tx-danger">*</span></label>
								<div id="display"></div>
								<input id="ingredientName" type="text" class="form-control"
									name="trayNo" value="${tray.no}" readonly>
							</div>
						</div>
						<!-- row -->
						<div class="row mg-t-20">
							<div class="col-sm-8 mg-t-10 mg-sm-t-0">
								<label class="form-control-label">식자재: <span
									class="tx-danger">*</span>
								</label> <input type="text" class="form-control" name="ingredientName"
									value="${tray.ingredientName}" readonly>
							</div>
						</div>
						<!-- row -->

						<div class="row mg-t-20">
							<div class="col-sm-8 mg-t-10 mg-sm-t-0">
								<label class="form-control-label">트레이 영점(kg): <span
									class="tx-danger">*</span></label> <input type="text"
									class="form-control" name="zeroValue" value="${tray.zeroValue}"
									readonly>
							</div>
						</div>
						<!-- row -->

						<div class="row mg-t-20">
							<div class="col-sm-8 mg-t-10 mg-sm-t-0">
								<label class="form-control-label">발주 무게(kg): <span
									class="tx-danger">*</span></label> <input type="text"
									class="form-control" name="orderWeight"
									value="${tray.orderWeight}" readonly>
							</div>
						</div>
						<!-- row -->
						<div class="row mg-t-20">
							<div class="col-sm-8 mg-t-10 mg-sm-t-0">
								<label class="form-control-label">발주 수량(EA): <span
									class="tx-danger">*</span></label> <input type="text"
									class="form-control" name="orderAmount"
									value="${tray.orderAmount}" readonly>
							</div>
						</div>
						<!-- row -->

						<div class="form-layout-footer mg-t-30"></div>
						<!-- form-layout-footer -->
					</div>
					<!-- form-layout -->
				</div>
				<!-- section-wrapper -->

				<div class="row">
					<div class="col-sm-6 col-md-12 mg-t-10">
						<div class="btn-demo" style="float: right;">
							<button class="btn btn-primary" id="trayEdit" style="width:150px;"
								onclick="edit_form()">수정</button>
							<button class="btn btn-primary" style="width:150px;"
								class="btn btn-primary btn-block mg-b-10" data-toggle="modal"
								data-target="#exampleModal">삭제</button>
							<button type="button" class="btn btn-secondary" style="width:150px;"
								onClick="location.href='<%=request.getContextPath()%>/aos/tray'">목록</button>
						</div>
						<!-- btn-demo -->
					</div>
					<!-- col-sm-3 -->
				</div>
				<!-- row -->
			</div>
			<!-- section-wrapper -->
		</div>
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">트레이 삭제</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">해당 트레이(${tray.no }번)를 정말 삭제하시겠습니까?</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="trayDelete">확인</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
		<!-- container -->
	</div>
</div>
<!-- slim-mainpanel -->
<%@ include file="../include/footer.jsp"%>
</body>

<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script>
	document.getElementById('trayEdit').addEventListener('click', edit_form);
	// document.getElementById('trayDelete').addEventListener('click', edit_form);

	$('#trayDelete').click(function() {
		$.ajax({
			url : '/aos/tray/${tray.no}',
			method : "DELETE",
			async : false
		}).done(function(result) {
			if (result == true) {
				location.href = '/aos/tray';
			} else if (result == false) {
				alert("발주 요청된 상품은 삭제가 불가능 합니다.");
			}
		});
	});

	function edit_form() {
		location.href = "/aos/tray/${tray.no}/editform";
	}
</script>
</html>