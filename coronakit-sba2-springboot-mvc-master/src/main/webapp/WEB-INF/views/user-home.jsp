<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form"
	prefix="spring-form"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CoronaKit - User Homepage</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
</head>
<body>
	<div class="container">
		<jsp:include page="header.jsp"/>
		<h3 align="center">
			Hello
			<security:authentication property="principal.username" />
		</h3>
		<hr>
		<div>
			<a href="${pageContext.request.contextPath}/user/show-kit">
				<button>Show Cart</button>
			</a> <a href="${pageContext.request.contextPath}/user/show-list">
				<button>Show All Products</button>
			</a>
		</div>
		<hr>
		<jsp:include page="footer.jsp"/>
	</div>
</body>
</html>