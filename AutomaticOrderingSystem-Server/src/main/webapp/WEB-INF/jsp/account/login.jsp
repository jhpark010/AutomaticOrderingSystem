<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AOS : Login</title>
<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- vendor css -->
    <link href="/lib/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="/lib/Ionicons/css/ionicons.css" rel="stylesheet">
    <link href="/lib/chartist/css/chartist.css" rel="stylesheet">
    <link href="/lib/rickshaw/css/rickshaw.min.css" rel="stylesheet">

    <!-- Slim CSS -->
    <link rel="stylesheet" href="/css/slim.css">
    
   <style>
		@import url('https://fonts.googleapis.com/css2?family=Didact+Gothic&family=Nanum+Gothic:wght@700&display=swap');
	</style>

</head>
<body>

<div class="signin-wrapper">

      <div class="signin-box">
        <h3 class="slim-logo" style="word-spacing: 0px;">
        	<a href="/aos/login" style="color: black;font-family:Nanum Gothic;">자동 발주 시스템</a> <br>
        	<a href="/aos/login" style="color: black; font-size:20px;font-family:Didact Gothic;letter-spacing: 0px;"> : Automatic Ordering System</a>
        </h3>
        <h5 class="signin-title-primary">환영합니다!</h5>
        <h6 class="signin-title-secondary">자동 발주 시스템을 이용하기 위해서<br> 로그인이 필요합니다.</h6>
		
		<form action="/aos/login" method="post">
			<div class="form-group">
          	<input type="text" class="form-control" placeholder="ID" name="id">
			</div>        
			<div class="form-group mg-b-50">
          	<input type="password" class="form-control" placeholder="Password" name="password">
          	</div>
          	<input type="submit" class="btn btn-primary btn-block btn-signin" value="Login">
        </form>
		</div>
		
    </div>

    <script src="/lib/jquery/js/jquery.js"></script>
    <script src="/lib/popper.js/js/popper.js"></script>
    <script src="/lib/bootstrap/js/bootstrap.js"></script>

    <script src="/js/slim.js"></script>

</body>
</html>