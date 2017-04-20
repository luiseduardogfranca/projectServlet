<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="refresh" content="2; URL=index.jsp">
	<title>Até a próxima</title>
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/css-codificando.css">
</head>
<body class="background">
	<div class="container-fluid">
		<div class="row">
			<%request.getRequestDispatcher("menu.jsp").include(request, response);%>
	        <!-- content -->
	        <div class="col-sm-offset-4 col-md-offset-3 all" >

	         	<div class="content">
			
					<div class="element-block element-center-x-y">
		            	<img src="./image/exit.png" alt="empty"/>
		            	<h1>Até a próxima!</h1>
		          	</div>	
				</div>
	
			</div>
		</div>
	</div>
	
</body>
</html>