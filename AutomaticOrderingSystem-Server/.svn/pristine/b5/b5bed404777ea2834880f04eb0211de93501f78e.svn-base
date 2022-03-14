<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<div class="slim-mainpanel">
	<div class="container">

		<div class="slim-pageheader">
			<ol class="breadcrumb slim-breadcrumb">
				<li class="breadcrumb-item"><a
					href="<%=request.getContextPath()%>/aos/main">메인</a></li>
				<li class="breadcrumb-item"><a
					href="<%=request.getContextPath()%>/aos/ingredient">식자재 관리</a></li>
				<li class="breadcrumb-item">식자재 정보</li>
			</ol>
			<h6 class="slim-pagetitle">식자재 정보</h6>
		</div>


		<div class="section-wrapper mg-t-20">

			<div class="col-lg-12">
				<div class="section-wrapper">
					<label class="section-title">식자재 정보</label>
					<p class="mg-b-20 mg-sm-b-40">${ingredient.name}에 대한 정보입니다.</p>
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
								<label class="form-control-label">단위 무게(kg):</label> <input
									type="text" class="form-control" name="unitWeight"
									value="${ingredient.unitWeight}" readonly>
							</div>
						</div>
						<div class="row mg-t-20">
							<div class="col-sm-8 mg-t-10 mg-sm-t-0">
								<label class="form-control-label">단위 가격(₩):</label> <input
									type="text" class="form-control" name="unitPrice"
									value="${ingredient.unitPrice}" readonly>
							</div>
						</div>
						<div class="row mg-t-20">
							<div class="col-sm-8 mg-t-10 mg-sm-t-0">
								<label class="form-control-label">주 거래처 명: <span
									class="tx-danger">*</span></label> <input type="text"
									class="form-control" name="mainSupplier"
									value="${mainSupplierName}" readonly>
							</div>
						</div>

						<div class="form-layout-footer mg-t-30"></div>

					</div>
				</div>
				
				<div class="row">
					<div class="col-sm-6 col-md-12 mg-t-10">
						<div class="btn-demo" style="float:right;">
							<button type="button" class="btn btn-primary" style="width:150px;"
								onclick="location.href='<%=request.getContextPath()%>/aos/ingredient/${ingredient.name}/editform'">수정</button>
							<button type="button" class="btn btn-primary" style="width:150px;"
								data-toggle="modal" data-target="#exampleModal">삭제</button>
							<button type="button" class="btn btn-secondary" style="width:150px;"
								onClick="history.go(-1)">목록</button>
						</div>
					</div>
				</div>
			</div>
		</div>

		<form name="boardInfo">
			<input type="hidden" name="_method" value="DELETE" /> <input
				type="hidden" name="no" value="${ingredient.no}">
		</form>


		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">식자재 삭제</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">식자재를 정말 삭제하시겠습니까?</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary"
							onclick="clickDel(boardInfo)">삭제</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">취소하기</button>
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
   formName.action = "/aos/ingredient";
   formName.method = "post";
   formName.submit();
}



</script>

</html>