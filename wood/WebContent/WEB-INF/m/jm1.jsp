<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
ul li:HOVER>a {
	background: #0078ff;
	color: white;
	text-shadow: - 1px 1px rgba( 0, 0, 0, 0);
}

ul li:FIRST-CHILD>a {
	border-top-left-raius: 8px;
	border-top-right-raius: 8px;
}

ul li:last-CHILD>a {
	border-bottom-left-raius: 8px;
	border-bottom-right-raius: 8px;
}
</style>


<link rel="stylesheet"
	href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script
	src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
</head>
<body>
	<ul>
		<li><a href=#> home</a></li>
		<li>
			<a href=#>회사소개</a>
			<ul>
				<li><a href=#> 1</a></li>
				<li><a href=#> 2</a></li>
			</ul>
		</li>
	</ul>

</body>
</html>