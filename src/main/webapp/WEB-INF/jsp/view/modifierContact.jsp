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

<style>
form {
	margin-bottom: 60px;
	margin-top: 10px;
	padding: 10px;
}

h3 {
	margin-top: 20px;
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
							href="${pageContext.request.contextPath}/afficherGroupe">Consulter Groupes </a></li>
							
						

					</ul>
				</div>
			</div>
		</nav>





		<div>
			<h3>modifier contact </h3>
		</div>
		<div>

			<c:if test="${infoMsg!=null}">
				<div class="alert alert-success" role="alert">${infoMsg}</div>
			</c:if>
			<c:if test="${errorMsg!=null}">
				<div class="alert alert-danger" role="alert">${errorMsg}</div>
			</c:if>



			<f:form action="validerModefication" method="POST" modelAttribute="contact">
               
				<div class="row">
					<div class="col">
						<label>Nom</label>
						<f:input path="nom" type="text" class="form-control"
							placeholder="nom" />
							<f:input type="hidden" path="idPersonne"/>
						<f:errors path="nom" class="text-danger" />
					</div>

					<div class="col">
						<label>Prénom </label>
						<f:input path="prenom" type="text" class="form-control"
							placeholder="prenom" />
						<f:errors path="prenom" class="text-danger" />
					</div>
				</div>


				<div class="row">
					<div class="col">
						<label>numero Personnel</label>
						<f:input path="numeroPersonnel" type="text" class="form-control"
							placeholder="numero tel Personnel" />
						<f:errors path="numeroPersonnel" class="text-danger" />
					</div>

					<div class="col">
						<label>numero Professionnel</label>
						<f:input path="numeroProfessionnel" type="text" class="form-control"
							placeholder="numero tel Professionnel" />
						<f:errors path="numeroProfessionnel" class="text-danger" />
					</div>
				</div>
				
				<div class="row">
					<div class="col">
						<label>email Personnel</label>
						<f:input path="emailPersonnel" type="text" class="form-control"
							placeholder="email Personnel" />
						<f:errors path="emailPersonnel" class="text-danger" />
					</div>

					<div class="col">
						<label>email Professionnel</label>
						<f:input path="emailProfessionnel" type="text" class="form-control"
							placeholder="email  Professionnel" />
						<f:errors path="emailProfessionnel" class="text-danger" />
					</div>
				</div>

				<div class="row">
					<div class="col">
						<label>adresse</label>
						<f:input path="adresse" type="text" class="form-control"
							placeholder="adresse" />
						<f:errors path="adresse" class="text-danger" />
					</div>

						<div class="form-check">
							<f:checkbox path="genre" value="masculin"
								class="form-check-input" />
							<label class="form-check-label"> masculin </label>

						</div>

						<div class="form-check">
							<f:checkbox path="genre" value="fiminin"
								class="form-check-input" />
							<label class="form-check-label"> Fiminin </label>

						</div>

						

					</div>
					

				</div>
				<div style="text-align: right">
		
					<button type="submit" class="btn btn-primary">modifier</button>
				</div>

			</f:form>
		</div>


	</div>
</body>
</html>