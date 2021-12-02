/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package authentication;

/**
 *
 * @author noah
 */
import bean.User;
import java.sql.*;

public class UserAuth {

    public User authenticate(String email, String password) throws SQLException,
            ClassNotFoundException {
		
		String domain, driver, dbURL, dbUsername, dbPassword;

		boolean LOCAL = false;
		if (LOCAL) {
			domain = "*";
			driver = "com.mysql.cj.jdbc.Driver";
			dbURL = "jdbc:mysql://localhost:3306/zolink";
			dbUsername = "root";
			dbPassword = "Jinkooo!000";
		} else {
			domain = "https://www.cs.nmt.edu";
			driver = "org.mariadb.jdbc.Driver";
			dbURL = "jdbc:mariadb://localhost:3306/apollo14_zolink";
			dbUsername = "apollo14";
			dbPassword = "DSLgang";
		}


		Class.forName(driver);
		Connection connection = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

		String sql = "SELECT * FROM user WHERE email = ? and password = ?";
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setString(1, email);
		statement.setString(2, password);

		ResultSet rs = statement.executeQuery();

		User user = null;

		if (rs.next()) {
			user = new User();
			user.setId(rs.getInt("user_id"));
			user.setEmail(rs.getString("email"));
			user.setPassword(rs.getString("password"));
		}

		rs.close();
		statement.close();
		connection.close();

		return user;

    }

	public User register(String email, String password) throws SQLException,
            ClassNotFoundException {

		String domain, driver, dbURL, dbUsername, dbPassword;

		boolean LOCAL = false;
		if (LOCAL) {
			domain = "*";
			driver = "com.mysql.cj.jdbc.Driver";
			dbURL = "jdbc:mysql://localhost:3306/zolink";
			dbUsername = "root";
			dbPassword = "Jinkooo!000";
		} else {
			domain = "https://www.cs.nmt.edu";
			driver = "org.mariadb.jdbc.Driver";
			dbURL = "jdbc:mariadb://localhost:3306/apollo14_zolink";
			dbUsername = "apollo14";
			dbPassword = "DSLgang";
		}


		Class.forName(driver);
		Connection connection = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

		String sqlQuery = "SELECT * FROM user WHERE email = ?";
		PreparedStatement statement = connection.prepareStatement(sqlQuery);
		statement.setString(1, email);

		ResultSet rs = statement.executeQuery();

		User user = null;

		if (!rs.next()) {	// if user does not exist already

			// create new user entry in the database
			String sqlInsert = "INSERT INTO user (email, password) VALUES(?, ?);";
			PreparedStatement statement2 = connection.prepareStatement(sqlInsert);
			statement2.setString(1, email);
			statement2.setString(2, password);
			statement2.executeUpdate();

			// query the database for the newly auto-generated user_id
			ResultSet rs2 = statement.executeQuery();
			if (rs2.next()) {	// successfully retrieved new user
				// validate user object
				user = new User();
				user.setId(rs2.getInt("user_id"));
				user.setEmail(email);
				user.setPassword(password);
			}

			rs2.close();
			statement2.close();

		}

		rs.close();
		statement.close();
		connection.close();

		return user;

    }
}
