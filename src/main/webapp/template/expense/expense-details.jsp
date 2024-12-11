<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../common/header.jsp"></c:import>
</head>
<body>

	<c:import url="../common/nav.jsp"></c:import>

	
	<div class="container">
			
				
					<div class="col-lg-6 mt-5">
						<div class="card h-100" style="width: 100%; mb-5">
							<img src="${expenses.image}" class="card-img-top" style="height:100%;" alt="expense Details">
							<div class="card-body">
								<h5 class="card-title">${expenses.name}</h5>
								<p class="card-text text-primary">
								$ Price: ${expenses.price } <br>
								  qty: ${expenses.qty} items <br>
							   ${expenses.price } X ${expenses.qty}  =  ${expenses.subTotal} <br>
							   issutes at ${expenses.issuedDate } 
								</p>
								<h5>Description</h5>
								<p>${expenses.description }</p>
								 
								<c:url var="updateLink" value="expense">
									<c:param  name="mode" value="LOAD"/>
									<c:param  name="expenseId" value= "${expenses.id}"/>
								
								</c:url>
								
								<c:url var="deleteLink" value="expense">
									<c:param  name="mode" value="DELETE"/>
									<c:param  name="expenseId" value= "${expenses.id}"/>
								
								</c:url>
								
								<a href="${updateLink }" class="btn btn-primary">Edit</a>
								<a href="${deleteLink}" class="btn btn-danger">Delete</a>
							</div>
						</div>
					</div>
		</div>


	<c:import url="../common/footer.jsp"></c:import>

</body>
</html>
</body>
</html>