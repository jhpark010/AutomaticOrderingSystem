<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ include file="../include/header.jsp" %>

<div class="slim-mainpanel">
<div class="container">

<div class="slim-pageheader">
			<ol class="breadcrumb slim-breadcrumb">
				<li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/aos/main">메인</a></li>
				<li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/aos/requestorderinfo">발주 관리</a></li>
				<li class="breadcrumb-item">발주 상세</li>
			</ol>
			<h6 class="slim-pagetitle">발주 상세</h6>
</div>	

<div class="card card-invoice">

	<div id="print_page" class="card-body">
            <div class="invoice-header">
              <h1 class="invoice-title">Invoice</h1>
              <div class="billed-from">
                <label class="section-label-sm tx-gray-500">발주처</label>
                <h6 style="color : #343a40;">${storeInfo.name}</h6>
                <p> ${storeInfo.zipCode}, ${storeInfo.address}, ${storeInfo.detailAddress}<br>
                연락처: ${storeInfo.phoneNo}<br>
                이메일: ${storeInfo.email}</p>
              </div><!-- billed-from -->
            </div><!-- invoice-header -->

            <div class="row mg-t-20">
              <div class="col-md">
                <label class="section-label-sm tx-gray-500">거래처</label>
                <div class="billed-to">
                  <h6 class="tx-gray-800"> ${data.supplierName} </h6>
                  <p> ${data.zipCode}, ${data.address}, ${data.detailAddress}  <br>
                  연락처: ${data.phoneNo}<br>
                  이메일: ${data.email}</p>
                </div>
              </div><!-- col -->
              <div class="col-md">
                <label class="section-label-sm tx-gray-500">발주 정보</label>
                
                <p class="invoice-info-row">
                  <span>발행 일시:</span>
                  <span>${data.orderDate}</span>
                </p>
              
              </div><!-- col -->
            </div><!-- row -->

            <div class="table-responsive mg-t-40">
              <table class="table table-invoice">
                <thead>
                  <tr>
                    <th class="wd-20p">번호</th>
                    <th class="wd-40p">식자재명</th>
                    <th class="tx-center">발주 수량</th>
                    <th class="tx-right">단위 가격</th>
                    <th class="tx-right">합계</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>1</td>
                    <td>${data.ingredientName}</td>
                    <td class="tx-center">${data.orderAmount}</td>
                    <td class="tx-right">₩ <fmt:formatNumber value="${data.unitPrice}" groupingUsed="true"/></td>
                    <td class="tx-right">₩ <fmt:formatNumber value="${data.orderPrice}" groupingUsed="true"/></td>
                  </tr>
                  
                  <tr>
                    <td colspan="2" rowspan="4" class="valign-middle">
                      <div class="invoice-notes">
                        <label class="section-label-sm tx-gray-500">Notes</label>
                        <p> 발주기록 입니다. </p>
                      </div><!-- invoice-notes -->
                    </td>
                 	<td class="tx-right">소계</td>
                    <td colspan="2" class="tx-right">₩ <fmt:formatNumber value="${data.orderPrice}" groupingUsed="true"/></td>
                  </tr>
                  
                  <tr>
                    <td class="tx-right tx-uppercase tx-bold tx-inverse">합계</td>
                    <td colspan="2" class="tx-right"><h4 class="tx-primary tx-bold tx-lato">₩ <fmt:formatNumber value="${data.orderPrice}" groupingUsed="true"/></h4></td>
                  </tr>
                </tbody>
              </table>
            </div><!-- table-responsive -->

          </div><!-- card-body -->

<input class="btn btn-primary" type='button' value='  Print  ' onclick="pageprint()">
 
</div>

</div>
</div>
	<%@ include file="../include/footer.jsp" %>

</body>
<script>
document.getElementById('btn').addEventListener('click', onPrint);

var initBody;
function beforePrint()
{ 
   initBody = document.body.innerHTML; 
   document.body.innerHTML = print_page.innerHTML;
} 

function afterPrint()
{ 
  document.body.innerHTML = initBody; 
} 

function pageprint()
{
     window.onbeforeprint = beforePrint; 
     window.onafterprint = afterPrint; 
     window.print(); 
}

</script>

<script>
function numberWithCommas(x) {
	  x = x.replace(/[^0-9]/g,'');   // 입력값이 숫자가 아니면 공백
	  x = x.replace(/,/g,'');          // ,값 공백처리
	  $("#money").val(x.replace(/\B(?=(\d{3})+(?!\d))/g, ",")); // 정규식을 이용해서 3자리 마다 , 추가 
	}
</script>
</html>