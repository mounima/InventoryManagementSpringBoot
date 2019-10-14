<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<body background="shopkeeper.png">
<meta charset="utf-8">
<title>Create an account</title>
<link href="${contextPath}/resources/css/bootstrap.min.css"
rel="stylesheet">
<style>
body {background-color: #fffdd0;}

</style>
</head>
<body>
        <nav class="navbar navbar-inverse" style="background-color: #3c8000">

 <div class="container-fluid">




<div class="navbar-header">
<a><image src="${contextPath}/images/inventorymgmt.png" style="width:30%"></image></a>

</div>

<ul class="nav navbar-nav navbar-right">
<br>
<br>
<br>
<button type="button" class="btn btn-primary-md"><a href="${contextPath}/welcome">HOME</a></button>
<button type="button" class="btn btn-primary-md"><a href="${contextPath}/p">PRODUCT</a></button>

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

<c:if test="${pageContext.request.userPrincipal.name != null}">
<form id="logoutForm" method="POST" action="${contextPath}/logout">
<input type="hidden" name="${_csrf.parameterName}"
value="${_csrf.token}" />
<table>
<tr>
        <td><h2>${pageContext.request.userPrincipal.name} | <a
onclick="document.forms['logoutForm'].submit()">Logout</a></h2></td>
    </tr>
</table>
</form>
<br>
<marquee>
		<h1 class="text-danger">Welcome To Online Inventory Management System!!</h1>
	</marquee>
	<h3 class="text-info"><center>Please add customer before placing an order</center></h3>
<div>
<br>
<br>
<form action="${contextPath}/c">
<table width="100%">
<!-- 
    <tr>
        <td align="right"><h2>${pageContext.request.userPrincipal.name} | <a
onclick="document.forms['logoutForm'].submit()">Logout</a></h2></td>
    </tr>
    -->
    <tr>   
          <td align="center" colspan="2"><input type="submit" style="height:50px; width:150px; background-color:red; font-size:20px" value="Add Customer" /><br><br></td>    
         </tr>
</table>
</form>
</div>


<!-- 
<h2 class="alignright">
Welcome ${pageContext.request.userPrincipal.name} | <a
onclick="document.forms['logoutForm'].submit()">Logout</a>
</h2>

</div>
</c:if>
<input type="submit" value="Add Customer" />
-->
</div>

<script
src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>