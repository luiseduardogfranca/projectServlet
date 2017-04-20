<%@page import="system.User"%>
<%@page import="system.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="database.CodificandoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


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
  		String lastName = CodificandoDAO.getCodificandoDAO().read(query, "last_name").get(0);
  		String date = Date.formatNormal(CodificandoDAO.getCodificandoDAO().read(query, "born").get(0));
  		String description = CodificandoDAO.getCodificandoDAO().read(query, "description").get(0);
  		String idAdmin = CodificandoDAO.getCodificandoDAO().read(query, "id").get(0);
  		String gender = CodificandoDAO.getCodificandoDAO().read(query, "gender").get(0);

  		//quantity of articles
  		query = String.format("SELECT * FROM article WHERE id_adm=%s", idAdmin);
  		ArrayList<String> article = CodificandoDAO.getCodificandoDAO().read(query, "id");
  		int quantityArticle = article.size();

  		//gender user
  		String srcImage = null;
  		if(gender.equals("masculino")){
  			srcImage = "image/teacher-masc.png";
  		}else if(gender.equals("feminino")){
  			srcImage = "image/teacher-fem.png";
  		}
  %>

  <div class="well header-bar header-bar-card">
  	<a href="index.jsp">

    	<img class="element-md border-bottom" src="<%=srcImage %>" alt="logo"/>
  	</a>
  	<h1>Perfil</h1>
  	<div class="card-bar">
    	<h2><span class="glyphicon glyphicon-user"></span> &nbsp;<%=firstName + " " + lastName%></h2>
    	<h2><span class="glyphicon glyphicon-calendar"></span> &nbsp;<%=date %></h2>
    	<h2><span class="glyphicon glyphicon-envelope"></span> &nbsp;<%=email %></h2>
    	<h2><span class="glyphicon glyphicon-file"></span> &nbsp;Artigos <span class="badge"> <%=quantityArticle %></span></h2>
    	<blockquote><h2><%=description %></h2></blockquote>
  	</div>
  </div>

  <div class="body-bar">

  	<ul class="nav navbar navbar-default">

  		<li class="col-xs-4">
    		<a class="margin-menu btn btn-block" href="index.jsp" name="button" title="Página inicial"> &nbsp;
        <span class="glyphicon glyphicon-home"></span></a>
      </li>

      <li class="dropdown col-xs-4">
      	<a class="dropdown-toggle  margin-menu btn btn-block" data-toggle="dropdown" href="#" title="Minha conta">
      		&nbsp; <span class="glyphicon glyphicon-user"></span> <span class="caret"></span>
      	</a>
        <ul class="dropdown-menu">
          <li><a href="#">Editar Perfil <span class="glyphicon glyphicon-edit"></span></a></li>
          <li><a href="#">Meus artigos <span class="glyphicon glyphicon-file"></span></a></li>
          <li><a href="./LogoutUser">Logout <span class="glyphicon glyphicon-log-out"></span></a></li>
        </ul>
		  </li>

      <li class="dropdown col-xs-4">
      	<a class="dropdown-toggle  margin-menu btn btn-block" data-toggle="dropdown" href="#" title="Adicionar">
      		&nbsp; <span class="glyphicon glyphicon-plus"></span> <span class="caret"></span>
      	</a>
        <ul class="dropdown-menu dropdown-menu-right">
        	<li><a href="create-article.jsp">Adicionar artigo <span class="glyphicon glyphicon-file"></span></a></li>
        </ul>
  		</li>
  	</ul>
  </div>

  <div class="footer-bar">
    <h3 class=""><span class="glyphicon glyphicon-copyright-mark"></span> Copyright 2017 - All Rights Reserved</h3>
  </div>
  <% }%>
</div>
