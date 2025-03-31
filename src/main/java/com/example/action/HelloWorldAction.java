package com.example.action;

import com.opensymphony.xwork2.ActionSupport;

public class HelloWorldAction extends ActionSupport {
    @Override
    public String execute() {
        System.out.println("调用");
        return SUCCESS;
    }
}
