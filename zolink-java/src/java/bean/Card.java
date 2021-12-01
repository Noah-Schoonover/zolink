/*
 * Revised from Murach's Java Servlets and JSP
 * Example ch09cart
 */
package bean;

import java.beans.*;
import java.io.Serializable;
import java.util.ArrayList;

public class Card implements Serializable {

	private String name;
	private String id;
	private String user_id;
	private int private_card;
    private ArrayList<Info> info;

	// Zero-Argument Constructor
    public Card() {
        info = new ArrayList<Info>();
    }


	// Getters
    public String getName() {
        return name;
    }

	public String getId() {
		return id;
	}

	public String getUser_id() {
		return user_id;
	}
	
	public int getPrivate_card() {
		return private_card;
	}

	public ArrayList<Info> getInfo() {
		return info;
	}
    public int getInfoCount() {
        return info.size();
    }

	// Setters
	public void setName(String name) {
		this.name = name;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public void setPrivate_card(int private_card) {
		this.private_card = private_card;
	}

	public void setInfo(ArrayList<Info> info) {
		this.info = info;
	}
	public void addInfo(Info info) {
		this.info.add(info);
	}
	public void removeInfo(String id) {
		Info i = null;
		for (int j = 0; j < getInfoCount(); j++) {
			i = info.get(j);
			if (i.getId().equals(id)) {
				info.remove(i);
			}
		}
	}


}
