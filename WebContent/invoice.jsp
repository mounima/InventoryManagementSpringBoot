<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Customer Invoice</title>
<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style>
body, html {
	background: #EEE;
	color: #333;
	font-family: Arial;
	font-size: 12px;
	height: 100%;
	margin: 0;
	padding: 0;
	width: 100%;
}


#container {
	background: #FFF;
	margin: 0 30px;
	min-height: 100%;
	padding: 40px;
}

table {
	width: 100%;
}

table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}

th, td {
	padding: 15px;
	text-align: left;
}

table#t01 tr:nth-child(even) {
	background-color: #eee;
}

table#t01 tr:nth-child(odd) {
	background-color: #fff;
}

table#t01 th {
	background-color: black;
	color: white;
}


</style>

</head>
<body>

       <nav class="navbar navbar-inverse" style="background-color: #3c8000">

<div class="container-fluid">




<div class="navbar-header">
<a><image src="images/inventorymgmt.png" alt="Logo" style="width:30%"></image></a>

</div>

<ul class="nav navbar-nav navbar-right">
<br>
<br>
<br>
<button type="button" class="btn btn-primary-md">
<a href="${contextPath}/welcome">HOME</a>
</button>
<button type="button" class="btn btn-primary-md">
<a href="${contextPath}/p">PRODUCT</a>
</button>

<button type="button" class="btn btn-primary-md">
					<a href="${contextPath}/productslist">INBOUND PRODUCTLIST 
				</button>
				</a>

				<button type="button" class="btn btn-primary-md"><a href="${contextPath}/productsinvlist">INVENTORY TRACKING</button></a>
				<button type="button" class="btn btn-primary-md"><a href="${contextPath}/saleslist">SALES TRACKING</button></a>
</ul>
<br> <br>
</div>
</nav>

	<div id='container'>
	<h1 align="center" style="color:red;">Invoice Number:</h2>
		<h3 align="center">${invcode}</h3>
		<br>
		<br>
		<h1 align="center" style="color:blue;">Products Sold</h2>
		<br>
		<br>
		<table border='4px' class="table table-striped" id="myTable">
		<thead>
			<tr>

				<th>Product Name</th>
				<th>Product Serial Number</th>
				<th>Price per Unit</th>
				<th>Quantities Sold</th>
				

			</tr>
		</thead>

		<tbody>

			<c:forEach var="clist" items="${clistitems}">
				<tr>
					<td>${clist.product.productname}</td>
					<td>${clist.product.productserialnumber}</td>
					<td>${clist.product.priceperunit}</td>
					<td>${clist.quantitysold}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br>
	
	<div align="center">
	<form:form target="_blank" method="GET" action="${contextPath}/invoicep"
			modelAttribute="GetInvoiceForm">			
					<button class="btn btn-success" type="submit" onclick="window.open('location.href='${contextPath}/invoicep','_blank')" style="height:50px; width:130px; background-color:green; font-size:30px; text-align: center; vertical-align: middle; "value=${invcode}>Print</button>
					
		</form:form>
	</div>
	</div>
	
	</body>
</html>