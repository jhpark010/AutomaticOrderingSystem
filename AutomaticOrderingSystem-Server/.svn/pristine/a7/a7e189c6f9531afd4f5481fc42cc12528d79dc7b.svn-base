<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" href="/css/led.css">

<div class="slim-mainpanel">
	<div class="container">
		<div class="slim-pageheader">
			<ol class="breadcrumb slim-breadcrumb">
			</ol>
			<h6 class="slim-pagetitle">Home</h6>
		</div>


		<div class="card card-pricing-one">
			현재시각 <span class="pricing-price" id="clock" style="font-weight: bold"></span>
			<div class="row">

				<c:forEach var="list" items="${relationData}">
					<div class="col-lg">
						<div class="pricing-item">
							<div class="pricing-icon">
								<i class="fa fa-balance-scale"></i>
							</div>
							<h5 class="pricing-title">${list.ingredientName}</h5>
							<p class="pricing-text">
								<c:choose>
									<c:when test="${list.ingredientName eq '미등록'}">트레이 정보를 등록해주세요</c:when>
									
									<c:otherwise> 발주무게 : ${list.orderWeight} kg<br>
									현재무게 : ${list.weight} kg</c:otherwise>
								</c:choose>
							</p>
							<c:choose>
								<c:when test="${list.ingredientName eq '미등록'}">
									
									<div class="btn-demo">
										<a class="btn btn-primary btn-block mg-b-10" type="button" style="color: white;"
											onclick="location.href='<%=request.getContextPath()%>/aos/tray/registform'">등록하세요.</a>
									</div>
								</c:when>
								<c:when test="${list.status eq 'false'}">
									<div class="led-green"></div> <br>
									정상
								</c:when>
								<c:when test="${list.status eq 'true'}">
									<div class="led-red"></div> <br>
									발주
								</c:when>
								<c:otherwise>
									<h1 class="pricing-price">${list.status}</h1>
								</c:otherwise>
							</c:choose>
							
    						
    								
						</div>
					</div>
				</c:forEach>

			</div>
		</div>

	</div>
</div>
<%@ include file="../include/footer.jsp"%>
</body>
<script>
function printTime() {

    var clock = document.getElementById("clock");        

    var now = new Date();                                      

    var nowTime = now.getFullYear() + "년 " + (now.getMonth()+1) + "월 " + now.getDate() + "일 " + now.getHours() + "시" + now.getMinutes() + "분" + now.getSeconds() + "초";

    clock.innerHTML = nowTime;        

    setTimeout("printTime()",1000);        

}

window.onload = function() {                      

    printTime();

}

</script>


</html>