<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CoronaKit - Checkout</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<jsp:include page="header.jsp"/>
	<h3 align="center">Checkout order</h3>
	<hr>
	<form action="${pageContext.request.contextPath}/user/finalize" method="POST">
		<label>Enter Address : </label>
		<textarea name="address" required="required"></textarea>
		<div align="right">
			<input type="submit" value="Place Order" />
		</div>
	</form>
	<div align="right">
		<a href="${pageContext.request.contextPath}/user/show-kit">
			<button>Review Order</button>
		</a>
	</div>
	<hr>
	<jsp:include page="footer.jsp"/>
</div>
</body>
</html>