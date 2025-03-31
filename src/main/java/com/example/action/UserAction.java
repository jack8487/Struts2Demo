package com.example.action;

import com.example.model.User;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpSession;


public class UserAction extends ActionSupport {

    private String id;

    private String method;

    public String getMethod(){
        return method;
    }

    public void setMethod(String method){
        this.method = method;
    }

    private User user = new User();

    private List<User> users = new ArrayList<User>();

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    // Getters and Setters for user object
    public User getUser() {
        return user;
    }

    public List<User> getUsers() {
        return users;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String execute() throws Exception {

        String result = "";

        if(method != null && method.length() > 0){
            switch (method){
                case "addAndupdate":
                    result = addAndupdate();
                    break;
                case "delete":
                    result = delete();
                    break;
                case "update":
                    result = update();
                    break;
                case "find":
                    result = find(result);
            }
        }

        return result; // 返回结果码
    }

    public String addAndupdate(){
        HttpSession session = ServletActionContext.getRequest().getSession();
        List<User> users = (List<User>) session.getAttribute("users");

        if(user.getId() == null || user.getId().equals("") || users == null || users.isEmpty()) {
            user.setId("0");
            users = new ArrayList<>();
            users.add(user);
        } else if(!users.isEmpty()&&user.getId()==null){
            users.add(user);
        } else if(!users.isEmpty()&&user.getId()!=null){
            users.set(Integer.parseInt(user.getId()),user);
        }

        user.setRegistrationDate(new Date());

        System.out.println("Id: " + user.getId());
        System.out.println("Username: " + user.getUsername());
        System.out.println("Password: " + user.getPassword());
        System.out.println("email:" + user.getEmail());
        System.out.println("phoneNumber:" + user.getPhoneNumber());
        System.out.println("registrationDate：" + user.getRegistrationDate());

        System.out.println("paramId: " + id);

        session.setAttribute("users", users);
        return SUCCESS;
    }

    public String delete() {
        System.out.println("delete方法调用");
        System.out.println("id:" + id);
        HttpSession session = ServletActionContext.getRequest().getSession();
        List<User> users = (List<User>) session.getAttribute("users");
        users.remove(users.get(Integer.parseInt(id)));
        session.setAttribute("users", users);

        return SUCCESS;
    }

    public String update() {
        System.out.println("update方法调用");
        System.out.println("id:" + id);

        return "login";
    }

    public String find(String result) {
        System.out.println("find方法调用");
        System.out.println("id:" + id);

        HttpSession session = ServletActionContext.getRequest().getSession();
        List<User> users = (List<User>) session.getAttribute("users");
        String id = (String) session.getAttribute("id");
        user = users.get(Integer.parseInt(id));
        session.setAttribute("user",user);

        return "login";
    }
}