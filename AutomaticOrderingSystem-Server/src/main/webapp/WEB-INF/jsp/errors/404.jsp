<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>AOS</title>

    <!-- Vendor css -->
    <link href="/lib/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="/lib/Ionicons/css/ionicons.css" rel="stylesheet">

    <!-- Slim CSS -->
    <link rel="stylesheet" href="/css/slim.css">

  </head>
  <body>

    <div class="page-error-wrapper">
      <div>
        <h1 class="error-title">404</h1>
        <h5 class="tx-sm-24 tx-normal">죄송합니다. 찾고있는 페이지가 존재하지 않습니다.</h5>
        <p class="mg-b-50">주소를 잘못 입력했거나 페이지가 변경되었을 수도 있습니다.</p>
        <p class="mg-b-50"><a href="<%=request.getContextPath()%>/aos/main" class="btn btn-error">메인 화면으로 이동</a></p>
        <p class="error-footer">&copy; Copyright 2020. All Rights Reserved.</p>
      </div>

    </div><!-- page-error-wrapper -->

    <script src="/lib/jquery/js/jquery.js"></script>
    <script src="/lib/popper.js/js/popper.js"></script>
    <script src="/lib/bootstrap/js/bootstrap.js"></script>

    <script src="/js/slim.js"></script>

  </body>
</html>
