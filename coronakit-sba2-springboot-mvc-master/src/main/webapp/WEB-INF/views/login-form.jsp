<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form"
	prefix="spring-form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CoronaKit - Login</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
	i {
		font-style: italic;
		color: red;
	}
</style>
</head>
<body>
	<hr>
	<div class="container">
		<jsp:include page="header.jsp"/>
		<h3 align="center">Login Page</h3>
		<hr>
		<core:if test="${param.error != null}">
			<i>Invalid Credentials!!!</i>
		</core:if>
		<fieldset name="loginFieldSet" title="Login Here">
			<spring-form:form action="${pageContext.request.contextPath}/validate"
				method="POST">
				<br />
				<br />
				<label>Enter user name : </label>
				<input type="text" name="username" />
				<br />
				<br />
				<label>Enter password : </label>
				<input type="password" name="password" />
				<br />
				<br />
				<input type="submit" value="Login" />
			</spring-form:form>
		</fieldset>
		<core:if test="${param.logout != null}">
			<i>You have been logged out successfully!!!</i>
		</core:if>
		<hr>
		<jsp:include page="footer.jsp"/>
	</div>
	<hr>
</body>
</html>