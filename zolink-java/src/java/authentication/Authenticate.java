/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package authentication;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

/**
 *
 * @author noah
 */
@WebServlet(name = "GetCard", urlPatterns = {"/GetCard"})
public class Authenticate extends HttpServlet {

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
		//doPost(request, response);
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
		//doPost(request, response);
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

		String domain, driver, dbURL, username, password;

		boolean LOCAL = false;
		if (LOCAL) {
			domain = "*";
			driver = "com.mysql.cj.jdbc.Driver";
			dbURL = "jdbc:mysql://localhost:3306/hw5";
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

		try {
			// establish a connection
			Class.forName(driver);
			Connection connection = DriverManager.getConnection(dbURL, username, password);

			String user_id = request.getParameter("user_id");
			String user_password = request.getParameter("password");

			// query the database
			Statement statement = connection.createStatement();
			String myQuery = "SELECT * FROM user WHERE user_id = " + user_id
					+ " AND password = " + user_password + ";";
			ResultSet rs = statement.executeQuery(myQuery);

			Statement statement2 = connection.createStatement();
			String myQuery2 = "SELECT * FROM info WHERE card_id = 1 ORDER BY info_order;";
			ResultSet rs2 = null;

			response.setContentType("text/xml;charset=UTF-8");
			out.println("<?xml version=\"1.0\"?>");
			out.println("<card>");

			// process results
			if (rs.next()) {
				out.println("<card_id>" + rs.getString("card_id") + "</card_id>");
				out.println("<user_id>" + rs.getString("user_id") + "</user_id>");
				out.println("<name>" + rs.getString("name") + "</name>");
				out.println("<private>" + rs.getString("private") + "</private>");

				rs2 = statement2.executeQuery(myQuery2);
				while(rs2.next()) {
					out.println("<info>");
					out.println("<info_type>" + rs2.getString("info_type") + "</info_type>");
					out.println("<data>" + rs2.getString("data") + "</data>");
					out.println("<info_order>" + rs2.getString("info_order") + "</info_order>");
					out.println("</info>");
				}
			}

			out.println("</card>");

			// close the connection
			rs.close();
			rs2.close();
			statement.close();
			statement2.close();
			connection.close();

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
