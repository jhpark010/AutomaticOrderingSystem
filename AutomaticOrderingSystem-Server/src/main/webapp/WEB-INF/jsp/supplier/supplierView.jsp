<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="../include/header.jsp"%>
<c:set var="ingredients" value="${ingredients }" />
<c:set var="supplier" value="${supplier }" />
<div class="slim-mainpanel">
	<div class="container">
		<div class="slim-pageheader">
			<ol class="breadcrumb slim-breadcrumb">
				<li class="breadcrumb-item"><a
					href="<%=request.getContextPath()%>/aos/main">메인</a></li>
				<li class="breadcrumb-item"><a
					href="<%=request.getContextPath()%>/aos/supplier">거래처 관리</a></li>
				<li class="breadcrumb-item">거래처 정보</li>
			</ol>
			<h6 class="slim-pagetitle">거래처 정보</h6>
		</div>
		<div class="section-wrapper mg-t-20">
			<div class="col-lg-12">
				<div class="section-wrapper mg-t-20">
					<label class="section-title">거래처 정보</label>
					<p class="mg-b-20 mg-sm-b-40">
						시스템에 등록된 <strong>${supplier.name }</strong>에 대한 정보입니다.
					</p>
					<div class="form-layout form-layout-4">
						<div class="row">
							<label class="col-sm-4 form-control-label">거래처명 :</label>
							<div class="col-sm-8 mg-t-10 mg-sm-t-0">
								<input type="text" name="name" class="form-control"
									id="supplierName" value="${supplier.name }" readonly>
							</div>
						</div>
						<!-- row -->
						<div class="row mg-t-20">
							<label class="col-sm-4 form-control-label">취급 식자재 목록 :</label>
							<div class="col-sm-8 mg-t-10 mg-sm-t-0">
								<c:forEach var="ingredient" items="${ingredients }">
									<li><c:out value="${ingredient}" /></li>
								</c:forEach>
							</div>
						</div>
						<div class="row mg-t-20">
							<label class="col-sm-4 form-control-label">연락처 :</label>
							<div class="col-sm-8 mg-t-10 mg-sm-t-0">
								<input type="text" name="phoneNo" class="form-control"
									value="${supplier.phoneNo }"
									style="width: 200px; height: 40px;" readonly />
							</div>
						</div>
						<div class="row mg-t-20">
							<label class="col-sm-4 form-control-label">이메일 :</label>
							<div class="col-sm-8 mg-t-10 mg-sm-t-0">
								<input type="text" name="email" class="form-control"
									value="${supplier.email }" readonly>
							</div>
						</div>
						<div class="row mg-t-20">
							<label class="col-sm-4 form-control-label">우편번호 :</label>
							<div class="col-sm-8 mg-t-10 mg-sm-t-0">
								<input type="text" name="zipCode" class="form-control"
									style="width: 120px; height: 40px;"
									value="${supplier.zipCode }" readonly />
							</div>
						</div>
						<div class="row mg-t-20">
							<label class="col-sm-4 form-control-label">주소 :</label>
							<div class="col-sm-8 mg-t-10 mg-sm-t-0">
								<input type="text" name="address" class="form-control"
									value="${supplier.address }" readonly>
							</div>
						</div>
						<div class="row mg-t-20">
							<label class="col-sm-4 form-control-label">상세주소 :</label>
							<div class="col-sm-8 mg-t-10 mg-sm-t-0">
								<input type="text" name="detailAddress" class="form-control"
									value="${supplier.detailAddress }" readonly>
							</div>
						</div>

					</div>
				</div>
				<div class="row">
					<div class="col-sm-6 col-md-12 mg-t-10">
						<div class="btn-demo" style="float:right;">
							<button type="button" class="btn btn-primary" style="width:150px;"
								onclick="location.href='<%=request.getContextPath()%>/aos/supplier/${supplier.no }/editform'">수정</button>
							<button type="button" class="btn btn-primary" style="width:150px;"
								data-toggle="modal" data-target="#exampleModal">삭제</button>
							<button type="button" class="btn btn-secondary" style="width:150px;"
								onClick="location.href='<%=request.getContextPath()%>/aos/supplier'">목록</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<form name="supplierInfo">
			<input type="hidden" name="_method" value="DELETE" /> <input
				type="hidden" name="no" value="${supplier.no}">
		</form>

		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">거래처 삭제</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">해당 거래처(${supplier.name })를 정말
						삭제하시겠습니까?
						<div style="color: red;">#주의 : 트레이에 등록된 식자재의 주 거래처가<br> 해당 거래처일 경우 삭제되지 않습니다.</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary"
							onclick="clickDel(supplierInfo)">확인</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../include/footer.jsp"%>
</body>
<script>
	function clickDel(formName) {
		formName.action = "/aos/supplier";
		formName.method = "post";
		formName.submit();
	}
</script>
</html>