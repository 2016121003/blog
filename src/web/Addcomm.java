package web;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import repository.DBUtils;

/**
 * Servlet implementation class Addcomm
 */
@WebServlet("/doAddcomm.do")
public class Addcomm extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Addcomm() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//

		
		//�������
		HttpSession session = request.getSession();
		ServletContext application = session.getServletContext();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		String article_id = request.getParameter("article_id");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String user_id = request.getParameter("user_id");
		String image = request.getParameter("image");
		if (DBUtils.doAddcomm(article_id, title, content, user_id, image)) {
			application.setAttribute("m", "��ӳɹ�!");
			application.setAttribute("URL", "addcomm.jsp");
			response.setHeader("refresh", "0;URL=alert.jsp" );
		} else {
			application.setAttribute("m", "���ʧ��!");
			application.setAttribute("URL", "addcomm.jsp");
			response.setHeader("refresh", "0;URL=alert.jsp" );
		}
	}

}
