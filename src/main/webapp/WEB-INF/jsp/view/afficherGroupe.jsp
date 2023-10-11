
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<title>afficher Groupe </title>

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
  padding: 2px;
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
			<form  method="POST" action="searchGroupByNom" >
				<div class="row">
					<div class="col">
						
						<input name="nomRecherche" type="text" class="form-control"
							placeholder="entrez nom de groupe recherche" />
					</div>
					<div class="col">
												  <button type="submit" class="btn btn-primary"> chercher </button>
					
					</div>
					</div>
					</form>
					
				
				

<table>
  <thead>
    <tr>
      <th>Nom Groupe</th>
       <th></th>
       
      <th>Suprimer</th>
      
     
        
            <th>afficher Contacts</th>
      
      <th></th>
    </tr>
  </thead>
  <tbody>
  
      <c:forEach  items="${groupes}" var="groupe">
      <tr>
        <td> <strong><c:out value="${groupe.nom}" /></strong> </td>
       
                  <td>
  
  <td>
  <form action="suprimerGroupe" method="post">
   <input type="hidden" name="id" value="${groupe.idGroup}">
  <button type="submit" class="btn btn-danger"> Suprimer </button>
</form>
  </td>

      <td>
  <form action="ContactsGroupes" method="post">
   <input type="hidden" name="id" value="${groupe.idGroup}">
  <button type="submit" class="btn btn-secondary">Contacts</button>
</form>
  </td>    
      </tr>
    </c:forEach>

    <!-- Ajoutez ici plus de lignes avec les données -->
  </tbody>
</table>

</body>
</html>