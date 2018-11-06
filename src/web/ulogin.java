package web;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import repository.UserDAO;
import domain.Users;

@WebServlet("/doLogin.do")
public class ulogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ulogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	
		//�û���¼
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		ServletContext application = session.getServletContext();
		Users user = new Users();
		user.setUser_id(request.getParameter("user_id"));
		user.setPassword(request.getParameter("password"));
		String user_id = request.getParameter("user_id");
		System.out.println(user.getUser_id()+"00000000111");
		request.setAttribute("user_id",user_id);
		
		if(UserDAO.doLogin(user))
		{
			request.setAttribute("user_id",user_id);
			request.getRequestDispatcher("index.jsp").forward(request, response); //��¼�ɹ���ת��personal.jspҳ�洦��
		}else{
			application.setAttribute("m", "���������ID������,���µ�¼!");
			application.setAttribute("URL","login.jsp" );
			response.setHeader("refresh", "0;URL=alert.jsp");
		}
		
	}
	
}
