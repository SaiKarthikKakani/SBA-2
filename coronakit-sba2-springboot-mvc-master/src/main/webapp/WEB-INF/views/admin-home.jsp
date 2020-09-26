<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CoronaKit - Admin Homepage</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<jsp:include page="header.jsp" />
		<h3 align="center">Hello Admin</h3>
		<hr>
		<div align="right">
			<a href="${pageContext.request.contextPath}/logout">
				<button>Logout</button>
			</a>
		</div>
		<div>
			<a href="${pageContext.request.contextPath}/admin/product-list">
				<button>Show All Products</button>
			</a>
			<a href="${pageContext.request.contextPath}/admin/product-entry">
				<button>Add	New Product</button>
			</a>
		</div>
		<hr>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>