<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form"
	prefix="spring-form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CoronaKit - Create New Product</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
	.error {
		color: red;
	}
</style>
</head>
<body>
	<div class="container">
		<jsp:include page="header.jsp" />
		<h3 align="center">Add New Item</h3>
		<hr>
		<div align="right">
			<a href="${pageContext.request.contextPath}/logout">
				<button>Logout</button>
			</a>
		</div>
		<spring-form:form
			action="${pageContext.request.contextPath}/admin/product-save"
			method="POST" modelAttribute="product">
			<div>
				<div>
					<spring-form:label path="productName">Enter product name : </spring-form:label>
				</div>
				<div>
					<spring-form:input path="productName" />
					<spring-form:errors path="productName" cssClass="error" />
				</div>
			</div>
			<br>
			<br>
			<div>
				<div>
					<spring-form:label path="cost">Enter product cost : </spring-form:label>
				</div>
				<div>
					<spring-form:input path="cost" />
					<spring-form:errors path="cost" cssClass="error" />
				</div>
			</div>
			<br>
			<br>
			<div>
				<div>
					<spring-form:label path="productDescription">Enter product description : </spring-form:label>
				</div>
				<div>
					<spring-form:input path="productDescription" />
					<spring-form:errors path="productDescription" cssClass="error" />
				</div>
			</div>
			<br>
			<br>
			<div align="right">
				<input type="submit" value="Submit" />
			</div>
		</spring-form:form>
		<hr>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>