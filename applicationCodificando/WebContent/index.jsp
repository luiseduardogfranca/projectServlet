<%@page import="system.User"%>
<%@page import="system.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="database.CodificandoDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="pt-br">

  <head>
    <meta name="name" content="content">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width">
    <title>Codificando</title>
    <link rel="icon" href="image/icon.png">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/css-codificando.css">
    <script type="text/javascript" src="bootstrap/jquery.min.js"></script>
    <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
  </head>
  <body>


  <body class="background">

    <div class="container-fluid" style="height:100%;">

      <div class="row">

        <%-- button menu --%>
        <button type="button" class="button-menu" data-toggle="collapse" data-target="#menu"></button>

        <!-- navbar -->
        <div id="menu" class="col-xs-12 col-sm-4 col-md-3 bar collapse">

		  <%
		  if(session.getAttribute("user") == null){
		  %>
		  <div class="header-bar">
          	<a href="index.jsp">
            	<img class="element-block " src="image/logo-project.png" alt="logo"/>
          	</a>
          </div>
          <div class="body-bar">
	          <form class="element-lg element-center" method="post" action="./LoginUser">
	            <div class="margin-menu input-group">
	              <input name="email" type="text" class="form-control" name="email" placeholder="Email">
	              <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
	            </div>

	            <div class="margin-menu input-group">
	              <input name="password" type="password" class="form-control" name="password" placeholder="Password">
	              <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
	            </div>

	            <button class="margin-menu btn btn-success btn-block"type="submit" name="button">Entrar</button>

	  			<a href="register.jsp" class="btn btn-link btn-block">Quero ser um autor(a) <span class="glyphicon glyphicon-pencil"></span></a>
	          </form>
          </div>

          <div class="footer-bar">
            <h3 class=""><span class="glyphicon glyphicon-copyright-mark"></span> Copyright 2017 - All Rights Reserved</h3>
          </div>
          <%}else{
          		User user = (User) session.getAttribute("user");
          		String email = user.getEmail();
          		String password = user.getPassword();
          		
          		//read informations user 
          		String query = String.format("SELECT * FROM adm WHERE email='%s'", email);
          		String firstName = CodificandoDAO.getCodificandoDAO().read(query, "first_name").get(0);
          		String date = Date.formatNormal(CodificandoDAO.getCodificandoDAO().read(query, "born").get(0));
          		String description = CodificandoDAO.getCodificandoDAO().read(query, "description").get(0);
          		String idAdmin = CodificandoDAO.getCodificandoDAO().read(query, "id").get(0);
          		
          		//quantity of articles 
          		query = String.format("SELECT * FROM article WHERE id_adm=%s", idAdmin);
          		ArrayList<String> article = CodificandoDAO.getCodificandoDAO().read(query, "id");
          		int quantityArticle = article.size();
          		
          %>
          <div class="well header-bar">
          	<a href="index.jsp">
            	<img class="element-md border-bottom" src="image/teacher-masc.png" alt="logo"/>
          	</a>
          	<h1><%=firstName %></h1>
          	<div class="pre-scrollable card-bar">
          		<h2>"<%=description %>"</h2>
          	</div>
          </div>
          <div class="body-bar">
          	
          	<a class="margin-menu btn btn-default btn-block" href="index.jsp" name="button">Página inicial &nbsp; 
            <span class="glyphicon glyphicon-home"></span></a>
            <button class="margin-menu btn btn-default btn-block" href="./Logout" name="button">Criar novo artigo &nbsp; 
            <span class="glyphicon glyphicon-plus"></span></button>
          	<button class="margin-menu btn btn-default btn-block" href="./ArticlesAdmin" name="button">Meus artigos 
          	<span class="badge"> <%=quantityArticle%> </span></span></button>
            <button class="margin-menu btn btn-danger btn-block" href="./Logout" name="button">Logout &nbsp; 
            <span class="glyphicon glyphicon-log-out"></span></button>
            
          </div>
          <div class="footer-bar">
            <h3 class=""><span class="glyphicon glyphicon-copyright-mark"></span> Copyright 2017 - All Rights Reserved</h3>
          </div>

          <% }%>


        </div>

        <!-- content -->
        <div class="col-sm-offset-4 col-md-offset-3 all" >

          <div class="content">
          <%
	        String query = String.format("SELECT * FROM article");
	        ArrayList<String> idArticles = CodificandoDAO.getCodificandoDAO().read(query, "id");

          	//if not exist articles
          	if(idArticles.size() == 0){
	        %>
          	<div class="element-block element-center-x-y">
            	<img src="./image/bookshelf.png" alt="empty"/>
            	<h1>Ops... estamos sem artigos no momento!</h1>
          	</div>

        	<%
	        }else{
	        %>
	        <header class="header border-bottom">
              <h1>Postagens recentes</h1>
            </header>
	        <%
	           	//exist article
	        	for(int index = 0; index < idArticles.size(); index ++){

	        		//info of article
	        		query = String.format("SELECT * FROM article WHERE id=%s", idArticles.get(index));
	        		String title = CodificandoDAO.getCodificandoDAO().read(query, "title").get(0);
	        		String desc = CodificandoDAO.getCodificandoDAO().read(query, "description").get(0);
	        		String date = Date.formatNormal(CodificandoDAO.getCodificandoDAO().read(query, "date_create").get(0));

	        		//info of user
	        		String idAdm = CodificandoDAO.getCodificandoDAO().read(query, "id_adm").get(0);
	        		query = String.format("SELECT * FROM adm WHERE id=%s", idAdm);
	        		String name = CodificandoDAO.getCodificandoDAO().read(query, "first_name").get(0) + " " +  CodificandoDAO.getCodificandoDAO().read(query, "last_name").get(0);
	       	%>

            <div class="card">
              <a href="content.jsp?idArticle=<%= idArticles.get(index)%>">
              <div class="card-text">
                <h1><%=title %></h1>
                <h2><span class="glyphicon glyphicon-pencil"></span>&nbsp; <%=name %>&nbsp; &nbsp; <span class="glyphicon glyphicon-calendar"></span> <%=date %></h2>
                <p>
                <%=desc %>
                </p>

              </div>
              </a>
            </div>
            <%		}
            	} %>
          </div>
        </div>
      </div>
    </div>

  </body>
</html>
