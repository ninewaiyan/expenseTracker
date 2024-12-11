<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="jakarta.tags.core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
	<c:import url="../common/header.jsp"/>
	<link rel="stylesheet" href="https://cdn.datatables.net/2.1.4/css/dataTables.bootstrap5.css"/>
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://cdn.datatables.net/2.1.4/js/dataTables.js"></script>
	<script src="https://cdn.datatables.net/2.1.4/js/dataTables.bootstrap5.js"></script>
</head>
<body>

 	
	<div class="container-fluid">
		<c:import url="../common/nav.jsp"></c:import>
		
		<table  class="table table-striped" style="width:100%">
        <thead>
            <tr>
                <th>ID</th>
                <th>FirstName</th>
                <th>LastName</th>
                <th>Email</th>
                <th>Enable</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
        	<c:forEach var="user" items= "${users }">
        	
        	<tr>
        	
        		<td>${user.id }</td>
        		<td>${user.firstname }</td>
        		<td>${user.lastname }</td>
        		<td>${user.email }</td>
        		<td>${user.enable ? 'Yes' : 'No' }</td>
        		<td>action</td>
        		<td>
        			<c:url var="enableLink" value="admin">
        				
        				<c:param name="mode" value="ENABLE"/>
        				<c:param name="userId" value="${user.id }"/>
        			
        			</c:url>
        			
        			<c:url var="disableLink" value="admin">
        				
        				<c:param name="mode" value="DISABLE"/>
        				<c:param name="userId" value="${user.id }"/>
        			
        			</c:url>
        			
        			<c:if test="${user.enable }">
        			
        			<a href="${disableLink }" class ="btn btn-success">Enable</a>
        			
        			</c:if>
        			
        			<c:if test="${not user.enable }">
        			
        			<a href="${enableLink }" class ="btn btn-danger">Disable</a>
        			
        			</c:if>
        		</td>
                
            </tr>
        	
        	</c:forEach>
            
            
        </tbody>
        <tfoot>
            <tr>
                <th>ID</th>
                <th>FirstName</th>
                <th>LastName</th>
                <th>Email</th>
                <th>Enable</th>
                <th>Action</th>
            </tr>
        </tfoot>
    </table>
			
	</div>
		
	<c:import url="../common/footer.jsp"></c:import>
	 <script type="text/javascript">
	 
	 	new DataTable('#user');
	 
	 </script>
	
</body>
</html>