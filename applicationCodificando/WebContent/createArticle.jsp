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
    <script src="https://cloud.tinymce.com/stable/tinymce.min.js?apiKey=f50c99ocnd97u6xjm6q1g8kukxsoxa6a3hfmja1xbfhsbwik"></script>
  	<script>tinymce.init({ selector:'textarea' });</script>
  </head>
  <body>


  <body class="background">

    <div class="container-fluid" style="height:100%;">

      <div class="row">

        <%-- button menu --%>
        <button type="button" class="button-menu" data-toggle="collapse" data-target="#menu"></button>

        <!-- navbar -->
        <div id="menu" class="col-xs-12 col-sm-4 col-md-3 bar collapse">
          <div class="header">
          	<a href="index.jsp">
            	<img class="element-block element-center element-top" src="image/logo-project.png" alt="logo"/>
          	</a>
          </div>

          <form class="element-center-x-y element-lg">
            <div class="margin-menu input-group">
              <input id="email" type="text" class="form-control" name="email" placeholder="Email">
              <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
            </div>
          
            <div class="margin-menu input-group">
              <input id="password" type="password" class="form-control" name="password" placeholder="Password">
              <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
            </div>

            <button class="margin-menu btn btn-success btn-block"type="submit" name="button">Entrar</button>
  			<a href="register.jsp" class="btn btn-link">Quero ser um autor(a) <span class="glyphicon glyphicon-pencil"></span></a>
          </form>
          <div class="footer-bar">
            <h3 class=""><span class="glyphicon glyphicon-copyright-mark"></span> Copyright 2017 - All Rights Reserved</h3>
          </div>
        </div>

        <!-- content -->
        <div class="col-sm-offset-4 col-md-offset-3 all" >

          <div class="content">

            <form>
  		  	</form>

          </div>

        </div>
      </div>
    </div>

  </body>
</html>
