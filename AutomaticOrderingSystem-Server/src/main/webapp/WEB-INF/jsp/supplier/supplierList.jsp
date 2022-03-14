<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>
<c:set var="errors" value="${errors }" />
<c:set var="supplierList" value="${supplierList }" />
<c:set var="log" value="${log }" />

<div class="slim-mainpanel">
	<div class="container">
		<div class="slim-pageheader">
			<ol class="breadcrumb slim-breadcrumb">
				<li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/aos/main">메인</a></li>
				<li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/aos/supplier">거래처 관리</a></li>
				<li class="breadcrumb-item">거래처 목록</li>
			</ol>
			<h6 class="slim-pagetitle">거래처 목록</h6>
		</div>
		<div class="section-wrapper mg-t-20">
			<label class="section-title">거래처 목록</label>
			<p class="mg-b-20 mg-sm-b-40">현재 시스템에 등록된 거래처입니다.</p>
			<div class="search-box" style="border-radius: 0px; width: 200px; height: 40px;">
				<input type="text" class="form-control" placeholder="거래처를 입력하세요." id="keyword" style="width: 200px; height: 40px;">
				<button class="btn btn-primary" id="btn" style="border-radius: 0%;"><i class="fa fa-search"></i></button>
			</div>
			<br>
			<div id="display">
				<div class="table-responsive">
					<table class="table table-striped mg-b-0">
						<thead>
							<tr>
								<td>번호</td>
								<td>거래처</td>
								<td>연락처</td>
								<td>우편번호</td>
								<td>주소</td>
							</tr>
						</thead>
						<tbody>

							<c:forEach var="list" items="${supplierList }" varStatus="status">
								<tr>
									<td>${status.count }</td>
									<td><a href="<%=request.getContextPath()%>/aos/supplier/${list.no}">${list.name }</a></td>
									<td>${list.phoneNo }</td>
									<td>${list.zipCode }</td>
									<td>${list.address }</td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6 col-md-12 mg-t-10">
					<div class="btn-demo" style="float:right;">
						<button class="btn btn-primary" style="width:150px;" onclick="location.href='<%=request.getContextPath()%>/aos/supplier/registform'">등록하기</button>
					</div>
				</div>
			</div>
			
			<c:if test="${not empty log }">
				<c:choose>
					<c:when test="${log }">
						<p style="color:green;">정상적으로 거래처를 삭제했습니다.</p>
					</c:when>
					<c:otherwise>
						<p style="color:red;">#경고<br>트레이에 등록된 식자재들 중에서 주 거래처가 해당 거래처로 되어있는 것이 있어서 거래처를 삭제할 수 없습니다.</p>
					</c:otherwise>
				</c:choose>
			</c:if>
				
			<p class="mg-b-20 mg-sm-b-40" style="color: red;">
				<c:if test="${not empty errorMessages }">
					#경고 : 아래와 같은 문제로 인해 거래처 수정을 완료하지 못했습니다.<br>
					<c:forEach items="${errorMessages }" var="errorMessage">
						● ${errorMessage }<br>
					</c:forEach>
				</c:if>
			</p>
		</div>
	</div>
</div>
<%@ include file="../include/footer.jsp"%>
</body>
<script>
	document.getElementById('btn').addEventListener('click', ajax_call);

	function ajax_call() {
		var xhr = new XMLHttpRequest();
		var data = "keyword=" + document.getElementById('keyword').value;
		xhr.onreadystatechange = function() {
			if (xhr.readyState === xhr.DONE) {
				if (xhr.status === 200 || xhr.status === 201) {
					var html = "<div class=\"table-responsive\">"
							+ "<table class=\"table mg-b-0\">"
							+ "<thead>"
							+ "<tr>"
							+ "<td>번호</td>"
							+ "<td>거래처</td>"
							+ "<td>연락처</td>"
							+ "<td>우편번호</td>"
							+ "<td>주소</td>"
							+ "</tr>"
							+ "</thead>";
					var msg = JSON.parse(xhr.responseText);
					html += "<tbody>";
					for (var i = 0; i < msg.length; i++) {
						var no = msg[i].no;
						html += "<tr>";
						html += "<td>" + (i + 1) + "</td>";
						html += "<td><a href=\"/aos/supplier/" + no + "\">"
								+ msg[i].name + "</a></td>";
						html += "<td>" + msg[i].phoneNo + "</td>";
						html += "<td>" + msg[i].zipCode + "</td>";
						html += "<td>" + msg[i].address + "</td>";
						html += "</tr>";
					}
					html += "</tbody>";
					html += "</div>";
					document.getElementById('display').innerHTML = html;
				} else {
					console.error(xhr.responseText);
				}
			}
		};
		xhr.open("POST", "http://localhost/aos/suppliersearch", true);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send(data);
	};
</script>
</html>