<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp" %>

	<div class="slim-mainpanel">
		<div class="container">
			<div class="slim-pageheader">
				<ol class="breadcrumb slim-breadcrumb">
					<li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/aos/main">메인</a></li>
					<li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/aos/tray">트레이 관리</a></li>
					<li class="breadcrumb-item active" aria-current="page">트레이 목록</li>
				</ol>
				<h6 class="slim-pagetitle">트레이 목록</h6>
			</div> <!-- slim-pageheader -->

			<div class="section-wrapper mg-t-20">
				<label class="section-title">트레이 목록</label>
				<p class="mg-b-20 mg-sm-b-40">현재 시스템에 등록된 트레이입니다.</p>

				<div class="table-responsive">
					<table class="table table-striped mg-b-0">
						<thead>
							<tr>
								<th>트레이 번호</th>
								<th>식자재 명</th>
								<th>트레이 영점값(kg)</th>
								<th>발주 무게(kg)</th>
								<th>발주 수량(EA)</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${trayList}" var="tray">
								<tr>
									<td>${tray.no}</td>
									<td><a href="/aos/tray/${tray.no}">${tray.ingredientName}</a></td>
									<td>${tray.zeroValue}</td>
									<td>${tray.orderWeight}</td>
									<td>${tray.orderAmount}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="row">
					<div class="col-sm-6 col-md-12 mg-t-10">
					<div class="btn-demo" style="float:right;">
							<button class="btn btn-primary" id="trayRegistForm" style="width:150px;"
								onclick="form_call()" disabled="false">등록하기</button>
						</div> <!-- btn-demo -->
					</div> <!-- col-sm-3 -->
				</div> <!-- row -->
			</div> <!-- section-wrapper -->
		</div> <!-- container -->
	</div> <!-- slim-mainpanel -->
<%@ include file="../include/footer.jsp" %>
</body>
<script>
	document.getElementById('trayRegistForm').addEventListener('click', form_call);
	
	function isFull() {
		var size = ${trayNo};
		var registForm = document.getElementById('trayRegistForm');

		if (size != 0) {
			registForm.disabled = false;
		} else {
			registForm.disabled = true;
		}
	}
	
	window.onload = isFull
	
	function form_call() {
		location.href = "/aos/tray/registform";
	}
</script>
</html>