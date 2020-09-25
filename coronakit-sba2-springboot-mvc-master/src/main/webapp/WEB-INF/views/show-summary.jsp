<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="core"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CoronaKit - Order Summary</title>
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
</style>
</head>
<body>
<div class="container">
	<jsp:include page="header.jsp"/>
	<h3 align="center">Order Summary</h3>
	<h4 align="center" style="color: green;">Wishing you speedy recovery</h4>
	<hr>
	<div align="right">
		<a href="${pageContext.request.contextPath}/logout">
			<button>Home</button>
		</a>
	</div>
	<div>
		<label>Name: <security:authentication property="principal.username" /></label>
		<br/>
		<label>Order Date: ${orderDate}</label>
		<br/>
		<label>Address: ${address}</label>
		<br/>
	</div>
	<br/><br/>
	<div align="center">
		<label>Order Details</label>
	</div>
	<core:choose>
		<core:when test="${kitDetails.size() > 0}">
			<table border="1" class="table-striped">
				<thead>
					<tr>
						<th>Product Name</th>
						<th>Quantity</th>
						<th>Amount</th>
					</tr>
				</thead>
				<tbody>
					<core:forEach var="eachKit" items="${kitDetails}" varStatus="i">
						<tr>
							<td>${product[i.index].productName }</td>
							<td>${eachKit.quantity }</td>
							<td>${eachKit.amount }</td>
						</tr>				
					</core:forEach>
					<tr>
						<th colspan="2">Total Amount</th>
						<td align="center" style="font-weight: bold;">${totalAmount}</td>
					</tr>
				</tbody>
			</table>
		</core:when>
		<core:otherwise>
			<i>Cart is Empty!!! Please add items</i>
			<div align="right">
				<a href="${pageContext.request.contextPath}/user/show-list">
					<button>Add Items</button>
				</a>
			</div>
		</core:otherwise>
	</core:choose>
	<jsp:include page="footer.jsp"/>
</div>
</body>
</html>