/*
 * Revised from Murach's Java Servlets and JSP
 * Example ch09cart
 */
package bean;

import java.beans.*;
import java.io.Serializable;
import java.util.ArrayList;

public class User implements Serializable {

	private String id = "";
	private String email = "";
	private String password = "";
	private ArrayList<Card> cards;

	// Zero-Argument Constructor
    public User() {
		cards = new ArrayList<Card>();
    }

	// Getters

	public String getId() {
		return id;
	}

	public String getEmail() {
		return email;
	}

	public String getPassword() {
		return password;
	}

	public ArrayList<Card> getCards() {
		return cards;
	}

	// Setters
	public void setId(String id) {
		this.id = id;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setCards(ArrayList<Card> cards) {
		this.cards = cards;
	}

}
