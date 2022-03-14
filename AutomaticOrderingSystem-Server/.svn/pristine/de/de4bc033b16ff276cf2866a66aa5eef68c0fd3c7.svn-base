<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>AOS</title>

    <!-- vendor css -->
    <link href="/lib/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="/lib/Ionicons/css/ionicons.css" rel="stylesheet">
    <link href="/lib/chartist/css/chartist.css" rel="stylesheet">
    <link href="/lib/rickshaw/css/rickshaw.min.css" rel="stylesheet">
    <link href="/lib/select2/css/select2.min.css" rel="stylesheet">
    <link href="/lib/jquery-toggles/css/toggles-full.css" rel="stylesheet">
    <link href="/lib/spectrum/css/spectrum.css" rel="stylesheet">
    <link href="/lib/bootstrap-tagsinput/css/bootstrap-tagsinput.css" rel="stylesheet">
    
    <!-- Slim CSS -->
    <link rel="stylesheet" href="/css/slim.css">
    
    <style>
		@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
	</style>
	<style>
		@import url('https://fonts.googleapis.com/css2?family=Didact+Gothic&family=Nanum+Gothic:wght@700&display=swap');
	</style>
</head>
<body>

    <div class="slim-header">
      <div class="container">
        <div class="slim-header-left">
          <h2 class="slim-logo">
          	<a href="<%=request.getContextPath() %>/aos/main" style="font-family:Nanum Gothic">자동 발주 시스템</a>
          	<a href="<%=request.getContextPath() %>/aos/main" style="font-size:18px;font-family:Didact Gothic;letter-spacing: 0px;"> : Automatic Ordering System</a>
          </h2>
        </div><!-- slim-header-left -->
        <div class="slim-header-right">
        	<a class="logged-user" style="margin-right: 15px" href="<%=request.getContextPath() %>/aos/requestorderinfo">발주 관리</a>
        	<a class="logged-user" style="margin-right: 15px" href="<%=request.getContextPath() %>/aos/tray">트레이 관리</a>
        	<a class="logged-user" style="margin-right: 15px" href="<%=request.getContextPath() %>/aos/ingredient">식자재 관리</a>
        	<a class="logged-user" style="margin-right: 15px" href="<%=request.getContextPath() %>/aos/supplier">거래처 관리</a>
          <div class="dropdown dropdown-c">
            <a href="#" class="logged-user" data-toggle="dropdown">
              <img src="https://icon-library.com/images/food-app-icon/food-app-icon-9.jpg" alt="">
              <span><%=session.getAttribute("storeName") %></span>
              <i class="fa fa-angle-down"></i>
            </a>
            <div class="dropdown-menu dropdown-menu-right">
              <nav class="nav">
                <a href="<%=request.getContextPath() %>/aos/logout" class="nav-link"><i class="icon ion-forward"></i> Log Out</a>
              </nav>
            </div><!-- dropdown-menu -->
          </div><!-- dropdown -->
        </div><!-- header-right -->
      </div><!-- container -->
    </div><!-- slim-header -->