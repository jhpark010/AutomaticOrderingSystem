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
					href="<%=request.getContextPath()%>/aos/requestorderinfo">발주 관리</a></li>
				<li class="breadcrumb-item">발주 목록</li>
			</ol>
			<h6 class="slim-pagetitle">발주 목록</h6>
		</div>

		<div class="section-wrapper mg-t-20">
			<label class="section-title">발주 목록</label>
			<p class="mg-b-20 mg-sm-b-40">발주 처리된 기록들입니다.</p>

			<div class="search-box">
				<input id="income" type="date" class="form-control" name="user_name"
					size=5 placeholder="날짜입력 예) 2020-11-11">
				<button class="btn btn-primary" id="btn">
					<i class="fa fa-search"></i>
				</button>
			</div>

			<div id="display">
				<div class="table-responsive">
					<table class="table table-striped mg-b-0">
						<thead>
							<tr>
								<th>발주날짜</th>
								<th>거래처 명</th>
								<th>식자재 명</th>
								<th style="width: 70px; text-align: center;">상태</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach var="order" items="${data}" varStatus="status">
								<tr>
									<td style="vertical-align: middle;"><a
										href="/aos/requestorderinfo/${order.orderDate}">
											${order.orderDate} </a></td>
									<td style="vertical-align: middle;">${order.supplierName}
									</td>
									<td style="vertical-align: middle;">
										${order.ingredientName}</td>
									<td style="text-align: center; vertical-align: middle;">
									<c:choose>
										<c:when test="${order.status eq 'O'}">
											<button class="btn btn-success mg-l-auto" type="button" id="warehousingBtn" value="${order.orderDate }" data-toggle="modal" data-target="#wareHousingModal">입고</button>
										</c:when>
										<c:otherwise>완료	</c:otherwise>
									</c:choose>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="modal fade" id="wareHousingModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">입고 완료 처리</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">해당 발주 건에 대한 입고 완료 처리를 하시겠습니까?
						<div style="color: red;">#주의 : 입고된 식자재를 트레이에<br>적재한 후 입고 완료 처리를 완료해야합니다.</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary"
							onclick="clickDel()">확인</button>
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
	document.getElementById('btn').addEventListener('click', ajax_call);

	function ajax_call() {
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			console.log("----->" + xhr.readyState + " / " + xhr.DONE);

			if (xhr.readyState === xhr.DONE) {
				if (xhr.status === 200 || xhr.status === 201) {
					var html = "<div class=\"table-responsive\">"
							+ "<table class=\"table mg-b-0\">" + "<thead>"
							+ "	<tr>" + "		<th>발주날짜</th>" + "		<th>거래처 명</th>"
							+ "		<th>식자재 명</th>" + "	</tr>" + "</thead>";

					var msg = JSON.parse(xhr.responseText);
					console.log(msg);
					html += "<tbody>";
					for (var i = 0; i < msg.length; i++) {
						var no = msg[i];
						html += "<tr>";
						html += "	<td><a href=\"/aos/requestorderinfo/" + msg[i].orderDate + "\">"
								+ msg[i].orderDate + "</a></td>";
						html += "	<td>" + msg[i].supplierName + "</td>";
						html += "	<td>" + msg[i].ingredientName + "</td>";
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
		var date = "income=" + document.getElementById('income').value;
		xhr.open("POST", "http://localhost/aos/requestorderinfo", true);
		xhr.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");
		xhr.send(date);
	};
</script>
<script>
	function clickDel() {
		var date = document.getElementById('warehousingBtn').value;
		location.href="http://localhost/aos/requestorderinfo/"+ date +"/warehousing";
	}
</script>
</html>