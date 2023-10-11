
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<title>registration form</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">
	<style >

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
			<form  method="POST" action="searchByNom" >
				<div class="row">
					<div class="col">
						
						<input name="nomRecherche" type="text" class="form-control"
							placeholder="entrez nom de contact recherche" />
					</div>
					<div class="col">
												  <button type="submit" class="btn btn-primary"> chercher </button>
					
					</div>
					</div>
					</form>
					
					<form  method="POST" action="searchBytel" >
				
			<div class="row">
			
					<div class="col">
						<input name="numero" type="text" placeholder="entrez le numero de contact recherche" class="form-control">
					
				
					</div>
					<div class="col">
												  <button type="submit" class="btn btn-primary"> chercher </button>
					
					</div>
			</div>
					
					</form>
				

<table>
  <thead>
    <tr>
      <th>Nom</th>
      <th>Prenom</th>
      <th>Telephone Personnel</th>
      <th>telephone professionnel</th>
      <th>email personnel</th>
      <th>email professioneel</th>
      <th>adresse</th>
      <th>modifier</th>
      <th>suprimer</th>
     
    </tr>
  </thead>
  <tbody>
  
      <c:forEach  items="${contacts}" var="contact">
      <tr>
        <td><c:out value="${contact.nom}" /></td>
        <td><c:out value="${contact.prenom}" /></td>
        <td><c:out value="${contact.numeroPersonnel}" /></td>
        <td><c:out value="${contact.numeroProfessionnel}" /></td>
        <td><c:out value="${contact.emailPersonnel}" /></td>
        <td><c:out value="${contact.emailProfessionnel}" /></td>
                <td><c:out value="${contact.adresse}" /></td>
                  <td>
  <form action="modifierrContact" method="post">
   <input type="hidden" name="id" value="${contact.idPersonne}">
  <button type="submit"  class="btn btn-primary">modifier</button>
</form>
  </td>
  <td>
  <form action="suprimerContact" method="post">
   <input type="hidden" name="id" value="${contact.idPersonne}">
  <button type="submit" class="btn btn-danger">Suprimer</button>
</form>
  </td>

        
      </tr>
    </c:forEach>

    <!-- Ajoutez ici plus de lignes avec les données -->
  </tbody>
</table>

</body>
</html>