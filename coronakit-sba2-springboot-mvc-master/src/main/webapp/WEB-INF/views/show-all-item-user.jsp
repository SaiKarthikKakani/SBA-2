<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CoronaKit - Add to Cart</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
	table {
		margin-left: auto;
		margin-right: auto;
	}
	th {
		text-align: center;
		background-color: lightgray;
		font-weight: bold;
	}
	i {
		color: red;
	}
</style>
</head>
<body>
<div class="container">
	<jsp:include page="header.jsp"/>
	<h3 align="center">Add to Cart</h3>
	<hr>
	<div align="right">
		<a href="${pageContext.request.contextPath}/logout">
			<button>Logout</button>
		</a>
	</div>
	<core:choose>
		<core:when test="${allProducts.size() > 0}">
			<table border="1" class="table-striped">
				<thead>
					<tr>
						<th>Product Name</th>
						<th>Product Cost</th>
						<th>Product Description</th>
						<th/>
					</tr>
				</thead>
				<tbody>
					<core:forEach var="eachProduct" items="${allProducts}">
						<tr>
							<td>${eachProduct.productName }</td>
							<td>${eachProduct.cost }</td>
							<td>${eachProduct.productDescription }</td>
							<td>
								<a href="${pageContext.request.contextPath}/user/add-to-cart/${eachProduct.id }">
									<button>Add</button>
								</a>
							</td>
						</tr>				
					</core:forEach>
				</tbody>
			</table>
			<div align="right">
				<a href="${pageContext.request.contextPath}/user/show-kit">
					<button>Show Cart</button>
				</a>
			</div>
		</core:when>
		<core:otherwise>
			<i>No Products available!!! Please contact store administrator</i>
		</core:otherwise>
	</core:choose>
	<jsp:include page="footer.jsp"/>
</div>
</body>
</html>