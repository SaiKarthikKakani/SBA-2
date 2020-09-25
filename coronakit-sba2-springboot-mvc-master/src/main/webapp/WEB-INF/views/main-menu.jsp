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
<title>CoronaKit - Welcome <security:authentication
		property="principal.username" /></title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<jsp:include page="header.jsp"/>
		<h3 align="center">
			Hello
			<security:authentication property="principal.username" />
		</h3>
		<hr>
		<br />
		<spring-form:form action="${pageContext.request.contextPath}/logout"
			method="POST">
			<input type="submit" value="Logout">
		</spring-form:form>
		<hr />
		<h1>Welcome to Corona Kit Dashboard!!!</h1>

		<security:authorize access="hasRole('ADMIN')">
			<hr />
			<a href="${pageContext.request.contextPath}/admin/home">ADMIN
				DASHBOARD</a>
		</security:authorize>

		<security:authorize access="hasRole('USER')">
			<hr />
			<a href="${pageContext.request.contextPath}/user/home">USER
				DASHBOARD</a>
		</security:authorize>
		<hr>
		<jsp:include page="footer.jsp"/>
	</div>
</body>
</html>