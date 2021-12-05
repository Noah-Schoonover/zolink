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
import java.util.ArrayList;

public class CardSaver {

    public Card saveCard(Card card) throws SQLException,
            ClassNotFoundException {

//		if (true) throw new SQLException();
		
		String driver, dbURL, dbUsername, dbPassword;

		driver = "org.mariadb.jdbc.Driver";
		dbURL = "jdbc:mariadb://localhost:3306/apollo14_zolink";
		dbUsername = "apollo14";
		dbPassword = "DSLgang";
		
		// establish a connection
		Class.forName(driver);
		Connection connection = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

		if (card.getCode().equals("new")) {

			// add new card to database

			// get the maximum card code to increment for new card
			String sqlMaxCode = "SELECT MAX(code) FROM card;";
			PreparedStatement stMaxCode = connection.prepareStatement(sqlMaxCode);
			ResultSet rsMaxCode = stMaxCode.executeQuery();

			if (!rsMaxCode.next()) {
				return null;
			}

			String maxCode = rsMaxCode.getString(1);
			String newCode = incrementCode(maxCode);

			if (newCode == null) {
				return null;
			}

			card.setCode(newCode);

			// insert the new card
			String sqlInsertCard =
					"INSERT INTO `card` (`code`, `user_id`, `card_name`, `name`, `private`)"
					+ " VALUES (?, ?, ?, ?, '0');";

			PreparedStatement stInsertCard = connection.prepareStatement(sqlInsertCard);
			stInsertCard.setString(1, newCode);
			stInsertCard.setString(2, card.getUser_id());
			stInsertCard.setString(3, card.getCard_name());
			stInsertCard.setString(4, card.getName());

			stInsertCard.executeUpdate();

			// query the db for the new card_id
			String sqlGetNewCardId = "SELECT card_id FROM card WHERE code = ?;";
			PreparedStatement stGetNewCardId = connection.prepareStatement(sqlGetNewCardId);
			stGetNewCardId.setString(1, newCode);
			ResultSet rsGetNewCardId = stGetNewCardId.executeQuery();

			if (!rsGetNewCardId.next()) {
				return null;
			}

			String newCardId = rsGetNewCardId.getString("card_id");

			card.setId(newCardId);

		} else {

			// update existing card in database

			String sqlUpdateCard = "UPDATE card SET card_name = ?, name = ? WHERE card_id = ?;";

			PreparedStatement stUpdateCard = connection.prepareStatement(sqlUpdateCard);
			stUpdateCard.setString(1, card.getCard_name());
			stUpdateCard.setString(2, card.getName());
			stUpdateCard.setString(3, card.getId());

			stUpdateCard.executeUpdate();


			// remove old infos from database

			String sqlRemoveOldInfo = "DELETE FROM info WHERE card_id = ?";

			PreparedStatement stRemoveOldInfo = connection.prepareStatement(sqlRemoveOldInfo);
			stRemoveOldInfo.setString(1, card.getId());

			stRemoveOldInfo.executeUpdate();

		}
		
		// insert new infos into database
		ArrayList<Info> infos = card.getInfo();
		for (int i = 0; i < infos.size(); i++) {

			String sqlInsertInfo =
					"INSERT INTO `info` (`card_id`, `data`, `info_order`) VALUES (?, ?, ?);";
			PreparedStatement stInsertInfo = connection.prepareStatement(sqlInsertInfo);
			stInsertInfo.setString(1, card.getId());
			stInsertInfo.setString(2, infos.get(i).getData());
			stInsertInfo.setInt(3, infos.get(i).getOrder());

			stInsertInfo.executeUpdate();
			
		}

		return card;
    }

	public String incrementCode(String code) {

		String newCode = "";

		boolean carry = true;
		code = code.toLowerCase();

		for (int i = code.length() - 1; i >= 0; i--) {

			char c = code.charAt(i);
			char d = '?';

			if (carry) {

				switch (c) {
					case '9':
						d = 'a';
						carry = false;
						break;
					case 'z':
						d = '0';
						break;
					default:
						d = c;
						d++;
						carry = false;
						break;
				}

			} else {
				d = c;
			}

			newCode = d + newCode;
			
		}

		if (carry) return null;

		return newCode;

    }

}
