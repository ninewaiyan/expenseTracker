<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../common/header.jsp"></c:import>
</head>
<body>


	<div class="container">
		
		<div class="card mt-5 col-md-6 col-sm-12 mx-auto">
			<div class="card-body">
			
			<c:if test="${not empty emailAlreadyExists and emailAlreadyExists }">
			
			<div class="alert alert-danger">
			                Your Email Already Exists !!
			            </div>
			</c:if>
			
			<c:if test="${not empty ok}">
			    <c:choose>
			        <c:when test="${ok}">
			            <div class="alert alert-success">
			                Account Creation is Successful!
			            </div>
			        </c:when>
			        <c:otherwise>
			            <div class="alert alert-danger">
			                Account Creation Failed!
			            </div>
			        </c:otherwise>
			    </c:choose>
			</c:if>

			</div>
			
			
				<h5 class="card-title">Create New User</h5>
				<form action="user" method="post">
				<input type="hidden" name="mode" value="REGISTER">
					<div class="mb-3">
					
						<div> 
						<label for="firstname" class="form-label"> Fisrt Name</label>
						 <input type="text" class="form-control"
							id="firstname" name="firstname">
						</div>
						
						<div> 
						<label for="lastname" class="form-label"> Last Name</label>
						 <input type="text" class="form-control"
							id="lastname" name="lastname">
						</div>
						
						<div> 
						<label for="email" class="form-label"> email</label>
						 <input type="email" class="form-control"
							id="email" name="email">
						</div>
						
						<label for="password" class="form-label"> password</label>
						 <input type="password" class="form-control"
							id="email" name="password">
						</div>
						
						
						
						<button type="submit" class="btn btn-primary float-end" >Create</button>
												<p class="card-text"> Already have an account ?<a href="login">Login here </a></p>
											
				</form>
			</div>
		</div>

	</div>



	<c:import url="../common/footer.jsp"></c:import>

</body>
</html>