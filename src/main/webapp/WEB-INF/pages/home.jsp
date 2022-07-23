<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page isELIgnored="false"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<title><c:out value="${page }"></c:out></title>
</head>
<body>
	<!-- Home Body -->
	<div class="container mt-3">

		<!-- Title -->
		<h1 class="text-center">Welcome To The TODO Application</h1>

		<!-- Condition - success -->
		<c:if test="${not empty msg }">
			<div class="alert alert-success">
				<c:out value="${msg }"></c:out>
			</div>
		</c:if>

		<!-- Container -->
		<div class="row mt-4">

			<!-- Left Container -->
			<div class="col-md-3 mt-5">
				<div class="list-group">
					<a href="#" class="list-group-item list-group-item-action active">Menu</a>
					<a href='<c:url value='/add'></c:url>'
						class="list-group-item list-group-item-action">Add TODO</a> <a
						href='<c:url value='/home'></c:url>'
						class="list-group-item list-group-item-action">View TODO</a>
				</div>
			</div>

			<!-- Right Container -->
			<div class="col-md-9">

				<!-- Condition - home -->
				<c:if test="${page=='home' }">

					<!-- Title -->
					<h1 class="text-center">All TODO's</h1>

					<!-- All Todos -->
					<c:forEach items="${todos }" var="t">
						<div class="card">
							<div class="card-body">
								<h6>
									<c:out value="${t.todoTitle }"></c:out>
								</h6>
								<p>
									<c:out value="${t.todoContent }"></c:out>
								</p>
								<p>
									<a href='<c:url value='/update'></c:url>'>Edit</a>
									<a href='<c:url value='/delete'></c:url>'>Delete</a>
								</p>
							</div>
						</div>
					</c:forEach>

				</c:if>
				
				
				<!-- Condition - add -->
				<c:if test="${page=='add' }">

					<!-- Title -->
					<h1 class="text-center">Add TODO</h1>
					<br>

					<!-- Form -->
					<form:form action="saveTodo" method="post" modelAttribute="todo">

						<!-- TodoTitle -->
						<div class="form-group">
							<form:input path="todoTitle" cssClass="form-control"
								placeholder="Enter ToDo Title" />
						</div>
						<!-- TodoContent -->
						<div class="form-group">
							<form:textarea path="todoContent" cssClass="form-control"
								placeholder="Enter ToDo Content" cssStyle="height:9rem;" />
						</div>
						<!-- TodoButton -->
						<div class="container text-center">
							<button class="btn btn-outline-success">Add Todos</button>
						</div>

					</form:form>

				</c:if>
			</div>
		</div>

	</div>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
</body>
</html>