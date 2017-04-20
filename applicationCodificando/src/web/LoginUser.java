package web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.CodificandoDAO;
import system.Login;
import system.User;

@WebServlet("/LoginUser")
public class LoginUser extends HttpServlet {
	
	public static final int ERROR_EMAIL = 1;
	public static final int ERROR_PASSWORD = 2;
	public static final int ERROR_LOGIN = 3;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect("index.jsp?errorLogin="+ERROR_EMAIL);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");

		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		//error de information
		if(email == null || email.equals("")){
			resp.sendRedirect("index.jsp?errorLogin="+ERROR_EMAIL);
		}else if (password == null || password.equals("")){
			resp.sendRedirect("index.jsp?errorLogin="+ERROR_PASSWORD);
		}else{
			//verify email and password 
			String query = String.format("SELECT * FROM adm WHERE email='%s' AND password='%s'", email, password);
			boolean exist = CodificandoDAO.getCodificandoDAO().verify(query);
			
			if(exist){
				
				//create user
				User user = new User(email, password);
				
				//create login 
				Login login = new Login(user);
				Login.logins.add(login);
				
				//create session 
				HttpSession session = req.getSession();
				session.setAttribute("user", user);
				
				req.getRequestDispatcher("login.jsp").include(req, resp);
				resp.sendRedirect("login.jsp?");
				
			}else{
				//error de login invalid 
				resp.sendRedirect("index.jsp?error="+ERROR_LOGIN);
			}
		}
		
		
	}
	
	
}
