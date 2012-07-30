/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.Vector;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import service.Blog;
import service.DBServices;

/**
 *
 * @author Vaibhav
 */
public class LoginController extends SimpleFormController {

    private DBServices dbServices;

    public void setDbServices(DBServices dbServices) {
        this.dbServices = dbServices;
    }

    public LoginController() {
        setCommandClass(LoginDetails.class);
        setCommandName("name");
        setSuccessView("validView");
        setFormView("loginView");
    }

    @Override
    protected ModelAndView onSubmit(HttpServletRequest request,
            HttpServletResponse response, Object command, BindException errors)
            throws Exception {
        ModelAndView mv=null;
        LoginDetails details = (LoginDetails) command;
        dbServices.connect();
        if (dbServices.isValidUser(details.getId(), details.getPwd())) {
            request.getSession().setAttribute("user", details.getId());
            setSuccessView("validView");
            Vector<Blog> blogs=new Vector<Blog>(0, 1);
            blogs=dbServices.getBlogs();
            mv = new ModelAndView(getSuccessView());
            mv.addObject("Message",details.getId());
            mv.addObject("blogs",blogs);
        }else{
            setSuccessView("invalidView");
            mv = new ModelAndView(getSuccessView());
            mv.addObject("Message","INVALID");
        }
        return mv;
    }
}
