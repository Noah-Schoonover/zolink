/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package getData;

/**
 *
 * @author noah
 */
import bean.Card;
import bean.Info;
import java.sql.*;

public class CardGetter {

    public Card getCardBy(String by, String query) throws SQLException,
            ClassNotFoundException {

		String domain, driver, dbURL, dbUsername, dbPassword;

		domain = "https://www.cs.nmt.edu";
		driver = "org.mariadb.jdbc.Driver";
		dbURL = "jdbc:mariadb://localhost:3306/apollo14_zolink";
		dbUsername = "apollo14";
		dbPassword = "DSLgang";
		
		// establish a connection
		Class.forName(driver);
		Connection connection = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

		// query the database
		String sqlQuery = "SELECT * FROM card WHERE " + by + " = ?;";
		PreparedStatement statement = connection.prepareStatement(sqlQuery);
		statement.setString(1, query);
		ResultSet rs = statement.executeQuery();

		Card card = null;

		// process results
		if (rs.next()) {

			card = new Card();
			
			String card_id = rs.getString("card_id");
			card.setId(rs.getString("card_id"));
			card.setUser_id(rs.getString("user_id"));
			card.setCard_name(rs.getString("card_name"));
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

		}

		// close the connection
		rs.close();
		statement.close();
		connection.close();

		return card;
    }

	public Card getCardById(String id) throws SQLException,
            ClassNotFoundException {

		return getCardBy("card_id", id);
    }

	public Card getCardByCode(String code) throws SQLException,
            ClassNotFoundException {

		return getCardBy("code", code);
    }

	
}
