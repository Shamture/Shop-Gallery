<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	taglib	prefix="c"	uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>Liste contacts</title>
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
          <h1>Liste Contacts</h1>
        </div>
        
      </div>
    </div>
  </section>
  <!-- / .title -->       


  <section  class="container">
    <table class="table table-striped">
      <tr>
        <th>Nom</th>
        <th>prenom</th>
        <th>Email</th>
        <th>Recommande</th>
        <th></th>
      </tr>
      <c:forEach items="${requestScope.conts }" var="item">
        <tr>
          <td> <c:out value="${item.nom }" /></td>
          <td> <c:out value="${item.prenom }" /></td>
          <td> <c:out value="${item.email }" /></td>
          <c:if test="${item.idTab==0 }">
            <td>Produit</td>
          </c:if>
          <c:if test="${item.idProd==0 }">
            <td>Tableau</td>
          </c:if>
          <td><a href="<c:url value="/admin/repondre-contact.xhtml?id=${item.id }" />"><button class="btn btn-primary">Repondre >></button></a>
        </tr>
      </c:forEach>
    </table>
  </section>
  <!-- /#registration-page -->





<script src="js/vendor/jquery-1.9.1.min.js"></script>
<script src="js/vendor/bootstrap.min.js"></script>
<script src="js/main.js"></script>

</body>
</html>
