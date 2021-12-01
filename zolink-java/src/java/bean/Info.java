/*
 * Revised from Murach's Java Servlets and JSP
 * Example ch09cart
 */
package bean;

import java.beans.*;
import java.io.Serializable;
import java.util.ArrayList;

public class Info implements Serializable {

    private String id;
    private String card_id;
    private String type;
    private String data;
    private int order;

	// Zero-Argument Constructor
    public Info() {
        id = "";
        card_id = "";
        type = "";
		data = "";
		order = 0;
    }

	// Getters
	public String getId() {
		return id;
	}
	public String getCard_id() {
		return card_id;
	}
    public String getType() {
        return type;
    }
    public String getData() {
        return data;
    }
	public int getOrder() {
        return order;
	}



	// Setters
	public void setId(String id) {
		this.id = id;
    }
	
	public void setCard_id(String card_id) {
		this.card_id = card_id;
	}

	public void setOrder(int order) {
		this.order = order;
	}

	public void setType(String type) {
		this.type = type;
	}

    public void setData(String data) {
		this.data = data;
    }

}
