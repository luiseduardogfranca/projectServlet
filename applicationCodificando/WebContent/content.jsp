<%@page import="system.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="database.CodificandoDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="pt-br">

  <head>
    <meta name="name" content="content">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width">
    <title>Codificando</title>
    <link rel="icon" href="image/icon.png">
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

        <%request.getRequestDispatcher("menu.jsp").include(request, response);%>
        <!-- content -->
        <div class="col-sm-offset-4 col-md-offset-3 all" >

          <div class="content">
          <%
          	String idArticle = request.getParameter("idArticle");
	        String query = String.format("SELECT * FROM section");
	        ArrayList<String> idSections = CodificandoDAO.getCodificandoDAO().read(query, "id");

          	//if not exist articles
          	if(idSections.size() == 0){
	        %>
          	<div class="element-block element-center-x-y">
            	<img src="./image/warning.png" alt="empty"/>
            	<h1>Essa não, as seções sumiram!</h1>
          	</div>

        	<%
	        }else{
	        	//info of article
        		query = String.format("SELECT * FROM article WHERE id=%s", idArticle);
        		String title = CodificandoDAO.getCodificandoDAO().read(query, "title").get(0);
        		String date = Date.formatNormal(CodificandoDAO.getCodificandoDAO().read(query, "date_create").get(0));

        		//info of user
        		String idAdm = CodificandoDAO.getCodificandoDAO().read(query, "id_adm").get(0);
        		query = String.format("SELECT * FROM adm WHERE id=%s", idAdm);
        		String name = CodificandoDAO.getCodificandoDAO().read(query, "first_name").get(0) + " " +  CodificandoDAO.getCodificandoDAO().read(query, "last_name").get(0);


	        %>
	        <header class="header border-bottom">
              <h1><%=title %></h1>
              <h2><span class="glyphicon glyphicon-pencil"></span>&nbsp; <%=name %>&nbsp; &nbsp; <span class="glyphicon glyphicon-calendar"></span> <%=date %></h2>
              
            </header>
            <article class="article">
	        <%
	           	  //exist article
	        	  for(int index = 0; index < idSections.size(); index ++){

	        		//info of section
	        		query = String.format("SELECT * FROM section WHERE id=%s", idSections.get(index));
	        		String titleSection = CodificandoDAO.getCodificandoDAO().read(query, "title").get(0);
	        		String content = CodificandoDAO.getCodificandoDAO().read(query, "content").get(0);
	       	%>

  				      <h2><%=titleSection %></h2>
  				      <p><%=content %></p>

            <%}%>
              </article>
            <%}%>

          </div>
        </div>
      </div>
    </div>

  </body>
</html>
