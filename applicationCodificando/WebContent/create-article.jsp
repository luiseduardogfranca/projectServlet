<%@page import="system.Login"%>
<%@page import="system.User"%>
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
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/css-codificando.css">
    <script type="text/javascript" src="bootstrap/jquery.min.js"></script>
    <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>


    <%-- script add section --%>
    <script>
    var quantitySections = 1;

    function createSection() {

        // genarete div for scetion
        var formGroup = document.createElement("DIV");
        var titleSection = '<h1>Edite sua seção</h1>';
        var title = '<div class="input-group"><span class="input-group-addon">Título da seção</span><input type="text" class="form-control" name="title' + quantitySections + '" placeholder="Digite o título da seção"></div>';
        var textarea = '<textarea rows="15" name="content' + quantitySections +  '"></textarea></div>';
        formGroup.innerHTML = titleSection + title + textarea;

        //set class of the DIV
        formGroup.setAttribute("class", "well card-textarea")

        document.getElementById("form").appendChild(formGroup);

        //insert quantity of the sections  for Servlet
        document.getElementById("quantity").setAttribute("value", quantitySections);

        // increment in quantitySections
        quantitySections += 1;
        tinymce.init({ selector:'textarea' });
    }
    </script>

    <script src="https://cloud.tinymce.com/stable/tinymce.min.js?apiKey=f50c99ocnd97u6xjm6q1g8kukxsoxa6a3hfmja1xbfhsbwik"></script>

  </head>


  <body class="background">

    <div class="container-fluid" style="height:100%;">

      <div class="row">
		<%
		request.getRequestDispatcher("menu.jsp").include(request, response);
		User user = (User) session.getAttribute("user");

		//verify if user logged
		if(user != null){
			int idLogin = Integer.parseInt(user.getIdLogin());
			if(Login.userLogged(user.getEmail())){
		%>




        <!-- content -->
        <div class="col-sm-offset-4 col-md-offset-3 all" >

          <div class="content" id="content">
		  	<header class="header border-bottom">
            	<h1>Crie um novo artigo</h1>
            </header>


			<form id="form" class="form-horizontal" action="./CreateArticle" method="post">
				<input id="quantity" name="quantitySections" type="text" style="display:none;">
				<div class="card-textarea">
					<h1>Informações do artigo</h1>
					<div class="input-group">
				      <span class="input-group-addon">Título do artigo</span>
				      <input id="msg" type="text" class="form-control" name="titleArticle" placeholder="Digite o título do artigo">
				    </div>
				    <div class="input-group">
				      <span class="input-group-addon">Resumo</span>
				      <input id="msg" type="text" class="form-control" name="description" placeholder="Resumo do artigo">
				    </div>
			    </div>

          <div class="btn-group-vertical button-fixed">
            <button type="submit" class="btn btn-success" title="Cadastrar artigo" href="#"><span class="glyphicon glyphicon-ok"></span></button>
            <button type="button" class="btn btn-info" title="Adicionar seção" onclick="createSection()"><span class="glyphicon glyphicon-plus"></span></button>
            <button type="button" class="btn btn-danger" title="Remover seção"><span class="glyphicon glyphicon-minus"></span></button>
          </div>
			</form>

          </div>

        </div>
        <%
			}
		}else{
			response.sendRedirect("index.jsp");
		}
		%>
      </div>
    </div>

  </body>
</html>
