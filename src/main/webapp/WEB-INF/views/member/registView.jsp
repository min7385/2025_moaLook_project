<%--
/**
 * <pre>
 * 1. 프로젝트명 : moa Look
 * 2. 작성일 : 2025. 4. 10. 오후 12:52:07
 * 3. 작성자 : Kmh
 * 4. 화면ID : 
 * 5. 화면명 : 회원가입 화면
 * 6. 설명 : 회원가입 화면
 * </pre>
 */
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입</title>
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<!-- 정적 리소스 연결 (CSS 등) -->
 	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/registView.css">
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<script>
    	const contextPath = "${pageContext.request.contextPath}";
	</script>
	
</head>
<body>
	<div class="container">
		<!-- Heading -->
		<h1>로그인</h1>

		<!-- Links -->
		<ul class="links">
			<li><a href="#" id="signin">로그인</a></li>
			<li><a href="#" id="signup">회원가입</a></li>
			<li><a href="#" id="reset">초기화</a></li>
		</ul>

		<!-- login Form -->
		<form action="${pageContext.request.contextPath}/loginDo" method="post">
			<!-- id input -->
			<div class="first-input input__block first-input__block">
				<input type="text" placeholder="ID" class="input" id="id" name="memId" required value="${cookie.rememberId.value}" />
			</div>
			<!-- password input -->
			<div class="input__block">
				<input type="password" placeholder="PW" class="input" id="pw" name="memPw" required />
			</div>
			<!-- repeat password input -->
			<div class="input__block">
				<input type="text" placeholder="닉네임" class="input" id="name" name="memName" style="display: none; opacity: 0;" />
			</div>
			<!-- password remember checkbox -->
			<div class="form-floating mb-3">
				<input class="form-check-input" id="remember" name="remember" type="checkbox"${cookie.rememberId.value == null? "" : "checked"} />아이디 기억하기
			</div>
			<!-- sign in button -->
			<div class="input__block">
 				<button type="sumbit" class="signin__btn">로그인</button>
			</div>
		</form>
		
		<!-- separator -->
		<div class="separator">
			<p>OR</p>
		</div>

		<!-- social buttons -->
		<button class="google__btn">
			<i class="fa fa-google"></i>
			Sign in with Google
		</button>
		<button class="github__btn">
			<i class="fa fa-github"></i>
			Sign in with GitHub
		</button>
	</div>

	<!-- JS 파일 -->
	<script src="${pageContext.request.contextPath}/resources/js/registView.js"></script>
	
</body>
</html>