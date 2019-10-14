<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add a Customer</title>
<link href="${contextPath}/resources/css/bootstrap.min.css"
rel="stylesheet">
<script type='text/css'>
table {
    border-collapse: separate;
    border-spacing: 0 1em;
}

td
{
    padding:0 15px 0 15px;
}

</script>
<style>
body {background-color: #fffdd0;}
</style>
</head>

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

				<button type="button" class="btn btn-primary-md"><a href="${contextPath}/productsinvlist">INVENTORY TRACKING</a></button>
				<button type="button" class="btn btn-primary-md"><a href="${contextPath}/saleslist">SALES TRACKING</button></a>

			</ul>
			<br> <br>
		</div>
	</nav>

<div class="container">
<br>
<h1 class="text-center text-danger">Customer Form</h1>
<br>
<br>
<form:form method="POST" action="${contextPath}/savec" modelAttribute="customerForm">
             <table align="center">
         <tr>     
          <td style="padding-right: 10px"><form:label path = "customername" value = "customername" name = "customername">Customer Name</form:label><br><br></td>  
          <td><form:input path="customername"  /><br><br></td>
           
         </tr>
                 
         <tr>    
          <td><form:label path = "customeraddress">Customer Address </form:label><br><br></td>   
          <td><form:input path="customeraddress" /><br><br></td>  
         </tr> 
         
         <tr>    
          <td><form:label path = "customerstreet">Customer Street</form:label><br><br></td>        
          <td><form:input path="customerstreet" /><br><br></td>  
         </tr> 
          <tr>    
          <td><form:label path = "customercity">Customer City</form:label><br><br></td>        
          <td><form:input path="customercity" /><br><br></td>  
         </tr>
         <tr>    
          <td><form:label path = "customerpincode">Customer PinCode </form:label><br><br></td>        
          <td><form:input path="customerpincode" /><br><br></td>  
         </tr>  
         <tr>    
          <td colspan="2"><center><br><input type="submit" style="height:40px; width:150px; background-color:blue; font-size:20px" value="Save" /><center><br><br></td>    
         </tr>    
        </table>    
        </form:form>
</div>
</body>
</html>