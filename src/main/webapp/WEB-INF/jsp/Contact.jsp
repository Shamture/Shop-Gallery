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
    <title>Contacter nous</title>
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
                       <li ><a href="<c:url value="/" />">Accueil</a></li>
                        <li ><a href="<c:url value="/tableaux.xhtml" />">Tableaux</a></li>
                        <li ><a href="<c:url value="/Produits.xhtml" />">Chorum</a></li>
                        
                        <li class="login">
                            <a data-toggle="modal" href="<c:url value="/login.xhtml" />"><i class="icon-lock"></i></a>
                        </li>
                    </ul>        
                </div><!--/.nav-collapse -->
            </div>
        </div>
    </header>
    <!-- /header -->

    <section class="no-margin">
        <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d1432.8586260189427!2d10.188542923107269!3d36.861316297758094!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2stn!4v1494662145593" width="100%" height="350" frameborder="0" style="border:0" allowfullscreen></iframe>
    </section>

    <section id="contact-page" class="container">
        <div class="row-fluid">
		
            <div class="span8">
                <h4>Recommandation Produit <strong>${requestScope.obj.nom }</strong></h4>
                <div class="status alert alert-success" style="display: none"></div>

                <form id="main-contact-form" class="contact-form" name="contact-form" method="post" action="">
                	
                  <div class="row-fluid">
                    <div class="span5">
                    <c:if test="${requestScope.success==true }">
                	  <div class="alert alert-success">
 						 <strong>Demande envoyée avec succée !</strong> 
	  			   	</div>
	  			   	<br/><br/>
                	</c:if>
                    	<input type="text" name="id" value="${param.id }" class="hidden" />
                    	<input type="text" name="type" value="${param.type }" class="hidden" />
                        <label>Nom</label>
                        <input type="text"  name="nom" class="input-block-level" required="required" placeholder="Nom" value="${param.nom }">
                        <label>Prenom</label>
                        <input type="text" name="prenom"  class="input-block-level" required="required" placeholder="prenom" value="${param.prenom }">
                        <label>Adresse Email</label>
                        <input type="text" name="email"  class="input-block-level" required="required" placeholder="Adresse Email" value="${param.email }">
                        <label>Produit</label>
                        <input type="text"   class="input-block-level" required="required" placeholder="Nom Produit" value="<c:out value="${requestScope.obj.nom }" />">
                        <label>Quantité</label>
                        <input type="number" name="quantite"  class="input-block-level" required="required" placeholder="Quantité" value="${param.quantite }">
                    </div>
                    

                </div>
                <button type="submit" class="btn btn-primary btn-large pull-right">Envoyer Demande</button>
                <p> </p>

            </form>
        </div>

        <div class="span3">
        	<c:if test="${param.type=='produit' }">
        	<img src="<c:url value="/resources/images/produits/${param.id}.jpg" />" alt="" width=300>
        	</c:if>
        	<c:if test="${param.type=='tableau' }">
            <img src="<c:url value="/resources/images/tableau/${param.id}.jpg" />" alt="" width=300>
            </c:if>
        </div>

    </div>

</section>



<script src="js/vendor/jquery-1.9.1.min.js"></script>
<script src="js/vendor/bootstrap.min.js"></script>
<script src="js/main.js"></script>   

</body>
</html>
