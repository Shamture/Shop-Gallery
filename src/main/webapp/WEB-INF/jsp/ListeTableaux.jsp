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
  <title>Nos tableaux</title>
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
            
           <li><a href="<c:url value="/" />">Accueil</a></li>
                        <li class="active" ><a href="<c:url value="/tableaux.xhtml" />">Tableaux</a></li>
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


  <section class="title">
    <div class="container">
      <div class="row-fluid">
        <div class="span6">
          <h1>Nos Tableaux</h1>
        </div>
        
      </div>
    </div>
  </section>
  <!-- / .title -->       
<div class="container-fluid">
	<div class="menu-of-button">
		<c:forEach items="${requestScope.categs }" var="item">
		  <a href="<c:url value="/tableaux.xhtml/${item.id}" />"><button class="btn"><c:out value="${item.nom }" /></button></a>
		</c:forEach>
	</div>
	<div class="col-md-8">
	  	<section id="" class="">    
        	<ul class="gallery col-4">
        	<c:forEach items="${requestScope.tabs }" var="item"  varStatus="count">
        		<li>
                <div class="preview">
                    
                    <img alt=" " src="<c:url value="/resources/images/tableau/${item.id}.jpg"/>" height=200>
                    <div class="overlay">
                    </div>
                    <div class="links">
                        <a data-toggle="modal" href="#modal-${count.index}"><i class="icon-eye-open"></i></a>                                
                    </div>
                </div>
                <div class="desc">
                    <h5><c:out value="${item.nom }" /></h5>
                    <small><c:out value="${item.taille }" /></small>
                </div>
                <div id="modal-${count.index}" class="modal hide fade">
                    <a class="close-modal" href="javascript:;" data-dismiss="modal" aria-hidden="true"><i class="icon-remove"></i></a>
                    <div class="modal-body">
                    	
                        <img src="<c:url value="/resources/images/tableau/${item.id}.jpg"/>" alt=" " width="100%" style="max-height:600px">
                        <div class="info-section">
                          <p>
                          <strong>nom : </strong><c:out value="${item.nom }" /><br/>
                          <strong>taille : </strong><c:out value="${item.taille }" /><br/>
                          <strong>prix : </strong><c:out value="${item.prix }" /> DT<br/>
                          </p>
                          
                          <a href="<c:url value="/contact.xhtml?type=tableau&id=${item.id }" />" target="_blank"><button class="btn btn-primary">Commander</button></a>
                        </div>
                    </div>
                </div>                 
              </li>
        	</c:forEach>
            
                     

       		 </ul>
        
    	</section>
	  		
	</div>

</div>
	
  



<script src="<c:url value="/resources/js/vendor/jquery-1.9.1.min.js" />"></script>
<script src="<c:url value="/resources/js/vendor/bootstrap.min.js" />"></script>
<script src="<c:url value="/resources/js/main.js" />"></script>

</body>
</html>
