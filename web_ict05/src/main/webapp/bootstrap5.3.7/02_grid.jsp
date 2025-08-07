<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" crossorigin="anonymous">
</script>
</head>
<body>

   <!-- Layout > Grid -->
     <!-- 1개의 행은 12개의 컬럼으로 쪼개져있다. -->
  
     <!-- 
   .col-sm-숫자          .col-md-숫자      .col-lg-숫자
   576px이하               768px이하          992px이하
    -->
    
    <div class="container-fluid">		<!-- container-fluid : 왼쪽 끝에서부터 시작    cf) container : 가운데서 시작--> 
		<b>lg</b>
		<br>
		<div class="row">		<!-- row 는 하나의 행 : 12개의 컬럼 -->
			<div class="col-lg-6 border">홍차</div>
			<div class="col-lg-6 border">녹차</div>
		</div>
		
		<b>md</b>
		<br>
		<div class="row">
			<div class="col-md-4 border"> 치킨 </div>
			<div class="col-md-4 border"> 피자 </div>
			<div class="col-md-4 border"> 파스타 </div>
		</div>
		
		<b>sm</b>
		<br>
		<div class="row">
			<div class="col-sm-4 border"> 만두 </div>
			<div class="col-sm-4 border"> 호떡 </div>
			<div class="col-sm-4 border"> 붕어빵 </div>
		</div>
    </div>

</body>
</html>