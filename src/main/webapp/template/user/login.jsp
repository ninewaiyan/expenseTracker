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


				<c:choose>

					<c:when test="${not empty status and not status}">
						<div class="alert alert-danger">
						Your account is tempolarily disabled!!!
						</div>
					</c:when>
					<c:when test="${not empty ok and not ok}">
						<div class="alert alert-danger">Username or password is
							incorrect!!</div>
					</c:when>

					<c:otherwise>
					</c:otherwise>
				</c:choose>


			</div>


			<h5 class="card-title">Login Here</h5>
			<form action="login" method="post">
				<input type="hidden" name="mode" value="LOGIN">
				<div class="mb-3">

					<div>
						<label for="email" class="form-label"> email</label> <input
							type="email" class="form-control" id="email" name="email">
					</div>

					<label for="password" class="form-label"> password</label> <input
						type="password" class="form-control" id="email" name="password">
				</div>



				<button type="submit" class="btn btn-primary float-end">Login</button>
				<p class="card-text">
					Don't have an account?<a href="user">Create here </a>
				</p>
			</form>
		</div>
	</div>

	</div>



	<c:import url="../common/footer.jsp"></c:import>

</body>
</html>