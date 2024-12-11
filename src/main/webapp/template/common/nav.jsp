<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container-fluid">
				<a class="navbar-brand" href="expense">My Shop</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="expense">Home</a></li>
						<li class="nav-item"><a class="nav-link" href="expense?mode=FORM">Product</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="" id="navbarDropdown"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
							${sessionScope.user.email }	  </a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="login?mode=LOGOUT">Log Out</a></li>
								<c:if test = "${sessionScope.user.role eq 'admin' }">
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item" href="admin">Admin Portal</a></li>
								</c:if>
							</ul></li>
					</ul>
					<form action="expense" class="d-flex" method= "get">
						<input type="hidden" name="mode" value="SEARCH">
						
						<input class="form-control me-2" type="search"
							placeholder="Search" aria-label="Search" name="query">
							
						<button class="btn btn-outline-success" type="submit">Search</button>
					</form>
				</div>
			</div>
		</nav>
