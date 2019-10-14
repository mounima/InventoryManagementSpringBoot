<%@ taglib
	prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Customer List</title>
<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#myModal").modal('show');
	});
</script>
<style>
body {background-color: #fffdd0;}
</style>
</head>
<body>
	<nav class="navbar navbar-inverse" style="background-color: #3c8000">

		<div class="container-fluid">




			<div class="navbar-header">
				<a><image src="images/inventorymgmt.png" style="width:30%"></image></a>

			</div>

			<ul class="nav navbar-nav navbar-right">
				<br>
                <br>
                <br>
				<button type="button" class="btn btn-primary-md">
					<a href="${contextPath}/welcome">HOME 
				</button>
				<button type="button" class="btn btn-primary-md">
					<a href="${contextPath}/p">PRODUCT 
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

	<style>
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
	<form action="${contextPath}/order">
		<div class="row" style="font-family: verdana">
			<div class="col-md-12">
				<div class="accordion_students">
					<h1 class="container text-center" style="font-family: verdana">Customer
						Details:</h1>
					<hr>

					<div class="main-content">


						<div class="trainee_wrap">
							<div class="row">


								<div class="col-md-2 col-sm-4">
									<b>
										<h4>Name</h4>
										<h4>Address</h4>
										<h4>Street</h4>
										<h4>City</h4>
										<h4>Pincode</h4>
										<h4>Date</h4>
									</b>
								</div>
								<div class="col-md-5 col-sm-4">
									<h4>
										: <span class="inner-name"> ${c.customername}</span>
									</h4>

									<h4>
										: <span class="inner-name">${c.customeraddress}</span>
									</h4>
									<h4>
										: <span class="inner-name">${c.customerstreet}</span>
									</h4>
									<h4>
										: <span class="inner-name">${c.customercity}</span>
									</h4>
									<h4>
										: <span class="inner-name">${c.customerpincode}</span>
									</h4>
									<h4>
										: <span class="inner-name">${c.currentdate}</span>
									</h4>
									<button style ="height:40px; width:150px; background-color: red; font-size:20px" value="${c.custid}" name="cid">Place Order</button>
								</div>

<%
    session.setAttribute("cid", "${c.custid}");
        %>

							</div>
						</div>
					</div>
				</div>
	</form>
</body>
