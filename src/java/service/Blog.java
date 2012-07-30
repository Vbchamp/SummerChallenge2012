/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

/**
 *
 * @author Vaibhav
 */
public class Blog {
    private String message;
    private String date;
    private String user;
    private String id;

    public Blog() {
    }

    public Blog(String message, String date, String user, String id) {
        this.message = message;
        this.date = date;
        this.user = user;
        this.id = id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }
       
}
