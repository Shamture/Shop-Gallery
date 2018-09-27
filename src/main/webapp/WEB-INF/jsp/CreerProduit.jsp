<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	taglib	prefix="c"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>Creer Produit - Admin</title>
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width">

  <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css" />">
    <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap-responsive.min.css" />">
    <link rel="stylesheet" href="<c:url value="/resources/css/font-awesome.min.css" />">
    <link rel="stylesheet" href="<c:url value="/resources/css/main.css" />">
    <link rel="stylesheet" href="<c:url value="/resources/css/sl-slide.css" />">

  <script src="<c:url value="/resources/js/vendor/modernizr-2.6.2-respond-1.1.0.min.js" />"></script>

  <!-- Le fav and touch icons -->
  <link rel="shortcut icon" href="<c:url value="/resources/images/ico/favicon.ico" />">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="<c:url value="/resources/images/ico/apple-touch-icon-144-precomposed.png" />">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="<c:url value="/resources/images/ico/apple-touch-icon-114-precomposed.png" />">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
</head>

<body>

  <!--Header-->
  <header class="navbar navbar-fixed-top">
    <div class="navbar-inner">
      <div class="container">
        <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </a>
        <a id="logo" class="pull-left" href="index.html"></a>
        <div class="nav-collapse collapse pull-right">
          <ul class="nav">
             <li class="active"><a href="index.html">Accueil</a></li>
                        
                        
            <li><a href="<c:url value="/admin/creer-produit" />">Créer Produit</a></li>
            <li><a href="<c:url value="/admin/ajouter-tableau" />">Ajouter Tableau</a></li>
            <li><a href="<c:url value="/admin/liste-contacts.xhtml" />">Liste Contacts</a></li>
            <li><a href="<c:url value="/admin/gerer-compte" />">Gerer Compte</a></li>
            <li><a href="<c:url value="/logout" />">Deconnecter</a></li>
          </ul>        
        </div><!--/.nav-collapse -->
      </div>
    </div>
  </header>
  <!-- /header -->


  <section class="title">
    <div class="container">
      <div class="row-fluid">
        <div class="span6">
          <h1>Creation Produit</h1>
        </div>
        
      </div>
    </div>
  </section>
  <!-- / .title -->    
  
  <section class="create-product">
  <div class="container">
  <div class="col-md-6">
  	<c:if test="${requestScope.success==true }">
  	  <div class="alert alert-success">
 			 <strong>Produit crée avec success !</strong> 
	  </div>
  	</c:if>
  	<c:if test="${requestScope.success==false }">
  	  <div class="alert alert-danger">
 			 <strong>Une erreur  s'est produite !</strong> 
	  </div>
  	</c:if>
  <form:form method="post" action="" modelAttribute="newProduct"  enctype="multipart/form-data">
  		<div class="form-group">
            <label>Nom</label>
            <form:input type="text" path="nom" class="form-control" placeHolder="Nom" required = "required"/>
        </div>
        <div class="form-group">
            <label>Taille</label>
            <form:input type="text" path="taille" class="form-control" placeHolder="Taille" required = "required"/>
        </div>
        <div class="form-group">
            <label>Prix</label>
            <form:input type="text" path="prix" class="form-control" placeHolder="Prix" required = "required"/>
        </div>
        <div class="form-group">
            <label>Type Bois</label>
            <form:select path="typeBois" class="form-control">
              <option>Type1</option>
              <option>Type2</option>
              <option>Type3</option>
            </form:select>
            
        </div>
        <div class="form-group">
            <label>Categorie</label>
            <form:select path="categorie" class="form-control">
              <c:forEach items="${requestScope.categs }" var="item">
                <option value="${item.id }">${item.nom }</option>
              </c:forEach>
            </form:select>
            
        </div>
        <div class="form-group">
            <label>Info</label>
            <form:textarea path="info" class="form-control"/>
            
        </div>
        
        
        <div class="form-group">
            <label>Image</label>
             <form:input type="file" path="image" accept="image/*"  class="form-control"  required = "required"/>
        </div>
        
        <div class="form-group">
        	<input type="submit" class="btn btn-success" value="Creer" />
        </div>
  	</form:form>
  </div>
  	</div>
  </section>   


  



<script src="js/vendor/jquery-1.9.1.min.js"></script>
<script src="js/vendor/bootstrap.min.js"></script>
<script src="js/main.js"></script>

</body>
</html>
