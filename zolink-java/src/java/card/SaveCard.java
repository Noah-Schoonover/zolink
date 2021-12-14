/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package card;

import bean.Card;
import bean.Info;
import bean.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
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
public class SaveCard extends HttpServlet {

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
			out.println("<title>Servlet AddCard</title>");
			out.println("</head>");
			out.println("<body>");
			out.println("<h1>Servlet AddCard at " + request.getContextPath() + "</h1>");
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

//		response.setContentType("text/plain;charset=UTF-8");
//		CardSaver cardSaver2 = new CardSaver();
//		out.println("0000: " + cardSaver2.incrementCode("0000"));
//		out.println("0001: " + cardSaver2.incrementCode("0001"));
//		out.println("0002: " + cardSaver2.incrementCode("0002"));
//		out.println("0009: " + cardSaver2.incrementCode("0009"));
//		out.println("00a9: " + cardSaver2.incrementCode("00a9"));
//		out.println("000z: " + cardSaver2.incrementCode("000z"));
//		out.println("00zz: " + cardSaver2.incrementCode("00zz"));
//		out.println("azzz: " + cardSaver2.incrementCode("azzz"));
//		out.println("zzzz: " + cardSaver2.incrementCode("zzzz"));
//		out.println("abcz: " + cardSaver2.incrementCode("abcz"));
//		if (true) {return;}


		HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

		if (user == null) {
			response.sendRedirect("/login/");
			return;
		}

		Card card = new Card();
		String save_id = request.getParameter("save_id");
		if (!save_id.equals("new")) {
			card.setId(save_id);
		}
		String save_code = request.getParameter("save_code");
		card.setCode(save_code);
		card.setUser_id(user.getId());
		card.setCard_name(request.getParameter("card_name"));
		card.setName(request.getParameter("name"));

		Enumeration<String> parameterNames = request.getParameterNames();
		
		while (parameterNames.hasMoreElements()) {
			String paramName = parameterNames.nextElement();

			// out.println(paramName + ": " + request.getParameter(paramName));
			int order = 0;
			try {
				order = Integer.parseInt(paramName);
			} catch (NumberFormatException nfe) {
				continue;	// skip over parameters that aren't integers
			}

			String data = request.getParameter(paramName);
			if (data == null || data.equals("")) {
				continue;
			}

			Info info = new Info();
			info.setOrder(order);
			info.setData(data);
			card.addInfo(info);
			

		}

		CardHelper cardSaver = new CardHelper();

		try {

			card = cardSaver.saveCard(card);

		} catch (ClassNotFoundException ex) {
			response.setContentType("text/plain;charset=UTF-8");
			out.println("Error with connection: " + ex);
			return;
		} catch (SQLException ex) {
			response.setContentType("text/plain;charset=UTF-8");
			out.println("SQLException: " + ex.getMessage());
			out.println("SQLState: " + ex.getSQLState());
			out.println("VendorError: " + ex.getErrorCode());
			return;
		}

		if (card == null) {
			throw new ServletException();
		}

		// remove the old version of the card if it is not a new card
		if (!save_code.equals("new")) {
			ArrayList<Card> userCards = user.getCards();
			for (int i = 0; i < userCards.size(); i++) {
				if (userCards.get(i).getCode().equals(save_code)) {
					userCards.remove(i);
					break;
				}
			}
		}

		user.getCards().add(card);
		session.setAttribute("user", user);

		response.sendRedirect("/" + card.getCode());

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
