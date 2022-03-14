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
				<li class="breadcrumb-item">식자재 목록</li>
			</ol>
			<h6 class="slim-pagetitle">식자재 목록</h6>
		</div>
		<div class="section-wrapper mg-t-20">
			<label class="section-title">식자재 목록</label>
			<p class="mg-b-20 mg-sm-b-40">현재 시스템에 등록된 식자재입니다.</p>
			<div class="search-box" style="border-radius: 0px; width: 200px; height: 40px;">
				<input id="income" type="text" class="form-control" name="user_name"
					placeholder="식자재를 입력하세요." style="border-radius: 0px; width: 200px; height: 40px;">
				<button class="btn btn-primary" id="btn" style="border-radius: 0px;">
					<i class="fa fa-search"></i>
				</button>
			</div>
			<br>
			<div id="display">
				<div class="table-responsive">
					<table class="table table-striped mg-b-0">
						<thead>
							<tr>
								<th>번호</th>
								<th>식자재 명</th>
								<th>주 거래처 명</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="list" items="${data}" varStatus="status">
								<tr>
									<td>${status.count}</td>
									<td><a href="/aos/ingredient/${list.ingredientName}">
											${list.ingredientName} </a></td>
									<td>${list.supplierName}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6 col-md-12 mg-t-10">
					<div class="btn-demo" style="float:right;">
						<button class="btn btn-primary" type="button" style="width:150px;"
							onclick="location.href='<%=request.getContextPath()%>/aos/ingredient/registform'">등록하기</button>
					</div>
				</div>
			</div>
			<p style="color: red;">${log}</p>
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
							+ "	<tr>" + "		<th>번호</th>" + "		<th>식자재 명</th>"
							+ "		<th>주 거래처 명</th>" + "	</tr>" + "</thead>";

					var msg = JSON.parse(xhr.responseText);
					console.log(msg);
					html += "<tbody>";

					for (var i = 0; i < msg.length; i++) {
						var no = msg[i];
						html += "<tr>";
						html += "	<td>" + (i + 1) + "</td>";
						html += "	<td><a href=\"/aos/ingredient/" + msg[i].ingredientName + "\">"
								+ msg[i].ingredientName + "</a></td>";
						html += "	<td>" + msg[i].supplierName + "</td>";
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
		xhr.open("POST", "http://localhost/aos/ingredientsearch", true);
		xhr.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");
		xhr.send(date);
	};
</script>

</html>