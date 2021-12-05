/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package card;

import bean.Card;
import bean.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author noah
 */
public class DeleteCard extends HttpServlet {

	/**
	 * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
	 *
	 * @param request servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException if an I/O error occurs
	 */
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			/* TODO output your page here. You may use following sample code. */
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Servlet DeleteCard</title>");
			out.println("</head>");
			out.println("<body>");
			out.println("<h1>Servlet DeleteCard at " + request.getContextPath() + "</h1>");
			out.println("</body>");
			out.println("</html>");
		}
	}

	/**
	 * Handles the HTTP <code>GET</code> method.
	 *
	 * @param request servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException if an I/O error occurs
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * Handles the HTTP <code>POST</code> method.
	 *
	 * @param request servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException if an I/O error occurs
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();

		String id = request.getParameter("delete_id");

		if (id == null) {
			throw new ServletException();
		}

		HttpSession session = request.getSession();

		User user = (User) session.getAttribute("user");

		if (user == null) {
			response.sendRedirect("/apollo14/zolink/login.jsp");
			return;
		}

		if (id.equals("new")) {
			session.setAttribute("card", null);

			RequestDispatcher dispatcher = request.getRequestDispatcher("MyCards");
			dispatcher.forward(request, response);
			return;
		}

		CardHelper cardHelper = new CardHelper();

		Card card = null;

		try {
			card = cardHelper.getCardById(id);
		} catch (SQLException | ClassNotFoundException ex) {
			throw new ServletException();
		}

		if (card == null) {
			throw new ServletException();
		}

		// check if user owns the card
		if (!card.getUser_id().equals(user.getId())) {
			response.sendRedirect("/apollo14/zolink/MyCards");
			return;
		}

		try {
			cardHelper.deleteCard(id);
		} catch (SQLException | ClassNotFoundException ex) {
			throw new ServletException();
		}

        session.setAttribute("card", null);

		// remove the old version of the card if it is not a new card
		ArrayList<Card> userCards = user.getCards();
		for (int i = 0; i < userCards.size(); i++) {
			if (userCards.get(i).getId().equals(id)) {
				userCards.remove(i);
				break;
			}
		}

		session.setAttribute("user", user);

		response.sendRedirect("/apollo14/zolink/MyCards");
	}

	/**
	 * Returns a short description of the servlet.
	 *
	 * @return a String containing servlet description
	 */
	@Override
	public String getServletInfo() {
		return "Short description";
	}

}
