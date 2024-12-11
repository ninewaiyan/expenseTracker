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
		
		<div class="card mt-5 col-md-6 col-sm-12 mx-auto">
			<div class="card-body">
			
				
			<c:if test= "{not empty ok and not ok}">
			
			<div class ="alert alert-danger">
			
			Expense creation is failed
			
			</div>
			
			
			
			</c:if>
				<h5 class="card-title">Create New Expense</h5>
				<form action="expense" method="post">
				<input type="hidden" name="mode" value="CREATE">
					<div class="mb-3">
						<div> 
						<label for="name" class="form-label"> Name</label>
						 <input type="text" class="form-control"
							id="name" name="name">
						</div>
						
						<div> 
						<label for="qty" class="form-label">Qty</label>
						 <input type="text" class="form-control"
							id="qty" name="qty">
						</div>
						
						<div> 
						<label for="price" class="form-label">price</label>
						 <input type="text" class="form-control"
							id="price" name="price">
						</div>
						
						<div> 
						<label for="image" class="form-label">Image URL</label>
						 <input type="url" class="form-control"
							id="image" name="image">
						</div>
						<br>
						
						<div> 
						<label for="description" class="form-label">Description</label>
						<textarea class="form-control" rows="4" cols="" id="description" name="description" > </textarea>
						</div>
						<br>
						<button type="submit" class="btn btn-primary float-end" >Create</button>
					
				</form>
			</div>
		</div>

	</div>



	<c:import url="../common/footer.jsp"></c:import>

</body>
</html>