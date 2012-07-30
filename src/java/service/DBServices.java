/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

/**
 *
 * @author Vaibhav
 */
import java.sql.*;
import java.util.Vector;

public class DBServices {

    private Connection con;
    private ResultSet rs;
    private Statement st;

    public void connect() {
        try {
            String dbURL = "jdbc:derby://localhost:1527/blogDB";
            Class.forName("org.apache.derby.jdbc.ClientDriver").newInstance();
            //Get a connection
            con = DriverManager.getConnection(dbURL);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean isValidUser(String id, String pwd) {
        try {
            String query = "select * from LOGIN where userId='" + id + "' and password='" + pwd + "'";
            int c = 0;
            st = con.createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                c++;
            }
            if (c > 0) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteBlog(String id) {
        try {
            String query = "delete from blogs where blog_id='" + id + "'";
            st = con.createStatement();
            return (st.execute(query));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public Vector<Blog> getBlogs() {
        Vector<Blog> blogs = null;
        try {
            blogs = new Vector<Blog>(0, 1);
            String query = "select * from blogs order by date desc";
            st = con.createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                Blog b = new Blog(rs.getString("message"), rs.getString("date"), rs.getString("blogger"), rs.getString("blog_id"));
                blogs.add(b);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return blogs;
    }

    public static void main(String[] args) {
        DBServices s = new DBServices();
        s.connect();
        s.getBlogs();
        //System.out.println(s.isValidUser("vaibhav", "vaibhav"));
    }

    public void insertBlog(String blog, String user) {
        try {
            if(blog.contains("'")){
                System.out.println("hai");
                blog=blog.replaceAll("'","''");
            }
            System.out.println(blog);
            String query = "INSERT INTO APP.BLOGS (MESSAGE, \"DATE\", BLOGGER, BLOG_ID)"
                    + "VALUES ('" + blog + "', CURRENT_DATE, '" + user + "','" + user + "' || CAST(CURRENT_TIMESTAMP AS CHAR(23)))";
            st=con.createStatement();
            System.out.println(query);
            st.execute(query);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
