<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<c:import url="common/header.jsp"></c:import>
</head>
<body>

	<div class="container-fluid">
	
		<c:import url="common/nav.jsp"></c:import>
		

		<div class="container">
			<div class="row mt-3">
				<c:forEach var="expense" items="${expenses}">
					<div class="col-sm-6 col-md-4 col-lg-3 col-xl-2 col-xxl-2 mb-3">
						<div class="card h-100" style="width: 100%; mb-3">
							<img src="${expense.image}" class="card-img-top" style="height:100%;" alt="...">
							<div class="card-body">
								<h5 class="card-title">${expense.name}</h5>
								<p class="card-text text-primary">
								$ Price: ${expense.price } <br>
								qty: ${expense.qty} items
								</p>
								
								<c:url var="detailsLink" value="expense">
  								  <c:param name="mode" value="DETAILS"/>
   								<c:param name="expenseId" value="${expense.id}"/>
								</c:url>

								<a href="${detailsLink}" class="btn btn-secondary">View</a>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>



<c:import url="common/footer.jsp"></c:import>
	
</body>
</html>