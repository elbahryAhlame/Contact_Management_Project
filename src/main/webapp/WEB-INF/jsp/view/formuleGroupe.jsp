<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<title>groupe</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">

<style>
form {
	margin-bottom: 60px;
	margin-top: 10px;
	padding: 10px;
}

h3 {
	margin-top: 20px;
}
table {
  width: 100%;
  border-collapse: collapse;
}

table th,
table td {
  padding: 8px;
  text-align: left;
  border-bottom: 1px solid #ddd;
}

table th {
  background-color: #f2f2f2;
}

table tr:hover {
  background-color: #f5f5f5;
}
</style>


</head>
<body>
	<div class="container">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container-fluid">

				<div class="collapse navbar-collapse" id="navbarNav">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page"
							href="${pageContext.request.contextPath}/">Accueil</a></li>
						

					</ul>
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page"
							href="${pageContext.request.contextPath}/afficherContacts">Consulter Contacts</a></li>
						

					</ul>
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page"
							href="${pageContext.request.contextPath}/creerGroupe"> Ajouter Groupe </a></li>
							
						

					</ul>
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page"
							href="${pageContext.request.contextPath}/afficherGroupe"> Consulter Groupes </a></li>
							
						

					</ul>
				</div>
			</div>
		</nav>






		<div>
			<h3>Crere Groupe </h3>
		</div>
		<div>

			<c:if test="${infoMsg!=null}">
				<div class="alert alert-success" role="alert">${infoMsg}</div>
			</c:if>
			<c:if test="${errorMsg!=null}">
				<div class="alert alert-danger" role="alert">${errorMsg}</div>
			</c:if>



			<f:form action="EnregestrerGroup" method="POST" modelAttribute="groupe">

				<div class="row">
					<div class="col">
						
						<f:input path="nom" type="text" class="form-control"
							placeholder="entrez le nom de groupe" />
						<f:errors path="nom" class="text-danger" />
					</div>

					
				</div>
         </div>
				<div style="text-align: right">
					<button type="submit" class="btn btn-primary">Enregestrer</button>
				</div>
				<table>
  <thead>
    <tr>
      <th>Nom</th>
      <th>Prenom</th>
      <th>Telephone Personnel</th>
      <th>telephone professionnel</th>
     
      <th>Ajouter</th>
      <th></th>
    </tr>
  </thead>
  <tbody>
  
      <c:forEach  items="${contacts}" var="contact">
      <tr>
        <td><c:out value="${contact.nom}" /></td>
        <td><c:out value="${contact.prenom}" /></td>
        <td><c:out value="${contact.numeroPersonnel}" /></td>
        <td><c:out value="${contact.numeroProfessionnel}" /></td>
      
               
                  <td>
                        <input type="checkbox" name="selectedContacts" value="${contact.idPersonne}">
           
      
  </td>

        
      </tr>
    </c:forEach>

    <!-- Ajoutez ici plus de lignes avec les données -->
  </tbody>
</table>

			</f:form>
		</div>


	</div>
	
	
</body>
</html>