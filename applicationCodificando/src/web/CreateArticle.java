package web;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.CodificandoDAO;
import system.User;

@WebServlet("/CreateArticle")
public class CreateArticle extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect("index.jsp");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		req.setCharacterEncoding("UTF-8");

		User user = (User) session.getAttribute("user");
		
		//verify if user is logged
		if(session != null){
			//return ID of the admin
			String email = user.getEmail();
			String query = String.format("SELECT * FROM adm WHERE email='%s'", email);
			
			String idAdmin = CodificandoDAO.getCodificandoDAO().read(query, "id").get(0);
			
			
			//info article 
			String titleArticle = req.getParameter("titleArticle");
			String description = req.getParameter("description");
			
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			String dateCreate = dateFormat.format(date);
			
			//info sections
			int quantitySections = Integer.parseInt(req.getParameter("quantitySections"));
			System.out.println(quantitySections);
			String[][] sections = new String [quantitySections][2];
			String nameInputTitle = "title";
			String nameInputContent = "content";
			
			for(int index = 0; index < quantitySections; index ++){
				String nameTitle = nameInputTitle + (index + 1);
				String nameContent = nameInputContent + (index + 1);
				
				//title
				sections[index][0] = req.getParameter(nameTitle);
				
				//content
				sections[index][1] = req.getParameter(nameContent);
			}
			
			//register article 
			String insert = String.format("INSERT INTO article (title, description, date_create, id_adm) "
					+ "VALUES('%s', '%s', '%s', %s)", titleArticle, description, dateCreate, idAdmin);
			CodificandoDAO.getCodificandoDAO().insert(insert);
			
			//return ID of the article add
			query = String.format("SELECT * FROM article WHERE id_adm=%s AND title='%s' AND date_create='%s'"
					, idAdmin, titleArticle, dateCreate);
			String idArticle = CodificandoDAO.getCodificandoDAO().read(query, "id").get(0);
			
			
			//register section's
			for(int index = 0; index < quantitySections; index ++){
				insert = String.format("INSERT INTO section (title, content, id_article) VALUES ('%s', '%s', %s)",sections[index][0], sections[index][1], idArticle);
				System.out.println(insert);
				CodificandoDAO.getCodificandoDAO().insert(insert);
			}
			
			resp.sendRedirect("index.jsp");
			
		}else{
			resp.sendRedirect("index.jsp");
		}
		
		
		
		
		
		
	}
	
}
