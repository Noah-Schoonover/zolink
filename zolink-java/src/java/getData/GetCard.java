/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package getData;

import bean.Card;
import bean.Info;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

/**
 *
 * @author noah
 */
@WebServlet(name = "GetCard", urlPatterns = {"/GetCard"})
public class GetCard extends HttpServlet {

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
		doPost(request, response);
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
		doPost(request, response);
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

		String domain, driver, dbURL, username, password, forward_url;

		System.out.println("debug 1");

		HttpSession session = request.getSession();
		String code = (String) session.getAttribute("code");

		boolean LOCAL = false;
		if (LOCAL) {
			domain = "*";
			driver = "com.mysql.cj.jdbc.Driver";
			dbURL = "jdbc:mysql://localhost:3306/zolink";
			username = "root";
			password = "Jinkooo!000";
		} else {
			domain = "https://www.cs.nmt.edu";
			driver = "org.mariadb.jdbc.Driver";
			dbURL = "jdbc:mariadb://localhost:3306/apollo14_zolink";
			username = "apollo14";
			password = "DSLgang";
		}

		response.setHeader("Access-Control-Allow-Origin", domain);
		PrintWriter out = response.getWriter();

		response.setContentType("text/plain;charset=UTF-8");

		try {
			// establish a connection
			Class.forName(driver);
			Connection connection = DriverManager.getConnection(dbURL, username, password);

			// query the database

			String sqlQuery = "SELECT * FROM card WHERE code = ?;";
			PreparedStatement statement = connection.prepareStatement(sqlQuery);
			statement.setString(1, code);
			ResultSet rs = statement.executeQuery();

			// process results
			if (rs.next()) {

				String card_id = rs.getString("card_id");

				System.out.println("debug 2");
				Card card = new Card();
				card.setId(rs.getString("card_id"));
				card.setUser_id(rs.getString("user_id"));
				card.setName(rs.getString("name"));
				card.setPrivate_card(rs.getInt("private"));

				String myQuery2 = "SELECT * FROM info WHERE card_id = ? ORDER BY info_order;";
				PreparedStatement statement2 = connection.prepareStatement(myQuery2);
				statement2.setString(1, card_id);
				ResultSet rs2 = statement2.executeQuery();
				
				while(rs2.next()) {
					Info info = new Info();

					info.setId(rs2.getString("info_id"));
					info.setCard_id(rs2.getString("card_id"));
					info.setType(rs2.getString("info_type"));
					info.setData(rs2.getString("data"));
					info.setOrder(rs2.getInt("info_order"));

					card.addInfo(info);
				}

				rs2.close();
				statement2.close();

				session.setAttribute("card", card);
				session.setAttribute("testAttr", "testing attribute");
				forward_url = "/card/card.jsp";

			} else {
				forward_url = "/cardNotFound/";	
			}

			// close the connection
			rs.close();
			statement.close();
			connection.close();

			RequestDispatcher dispatcher = request.getRequestDispatcher(forward_url);
			dispatcher.forward(request, response);
			//response.sendRedirect("https://weave.cs.nmt.edu/apollo14/zolink" + forward_url);

		} catch (ClassNotFoundException ex) {
			response.setContentType("text/plain;charset=UTF-8");
			out.println("Error with connection: " + ex);
		} catch (SQLException ex) {
			response.setContentType("text/plain;charset=UTF-8");
			out.println("SQLException: " + ex.getMessage());
			out.println("SQLState: " + ex.getSQLState());
			out.println("VendorError: " + ex.getErrorCode());
		}
		
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
