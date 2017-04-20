package web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import system.Login;
import system.User;

@WebServlet("/LogoutUser")
public class LogoutUser extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession sessionUser = req.getSession();
		
		User user = (User) sessionUser.getAttribute("user");
		if(user != null){
			sessionUser.invalidate();

			//remove login 
			Login.logoutUser(Integer.parseInt(user.getIdLogin()));
			
			//redirect for page logou.jsp
			resp.sendRedirect("logout.jsp");
		}else{
			resp.sendRedirect("index.jsp");
		}
		
	}
}
