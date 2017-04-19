package web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.CodificandoDAO;

@WebServlet("/RegisterUser")
public class Register extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		req.setCharacterEncoding("UTF-8");

		String firstName = req.getParameter("first-name");
		String lastName = req.getParameter("last-name");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String date = req.getParameter("date");
		String description = req.getParameter("description");
		//register in database
		String insert = String.format("insert into adm (first_name, last_name, email, born, `password`, description) "
				+ "values ('%s','%s','%s','%s', '%s','%s')", firstName, lastName, email, date, password, description);
		//if okay, create page 
		if(CodificandoDAO.getCodificandoDAO().insert(insert)){
			resp.sendRedirect("index.jsp");
		}
	}
	
}
