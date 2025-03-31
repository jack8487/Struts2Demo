package com.example.model;

import java.util.Date;

public class User {
    private String id;
    private String username;
    private String password;
    private String email;
    private String phoneNumber;
    private Date registrationDate;

    public User() {}

    // Constructor with parameters for all fields
    public User(String id, String username, String password, String email, String phoneNumber, Date registrationDate) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.registrationDate = registrationDate;
    }

    // Getters and Setters
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Date getRegistrationDate() {
        return registrationDate;
    }

    public void setRegistrationDate(Date registrationDate) {
        this.registrationDate = registrationDate;
    }

    // Method to check if the provided password matches the user's password
    public boolean checkPassword(String passwordToCheck) {
        return this.password.equals(passwordToCheck);
    }

    // Method to generate a short description of the user
    public String describeUser() {
        return "User ID: " + id +
                ", Username: " + username +
                ", Email: " + email +
                ", Phone Number: " + phoneNumber +
                ", Registered on: " + registrationDate;
    }
}