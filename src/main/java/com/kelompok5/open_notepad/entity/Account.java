package com.kelompok5.open_notepad.entity;

import java.util.HashMap;
import java.util.Map;

public abstract  class Account {
    private String username;
    private String hashedPassword;
    private String salt;
    private String email;
    private String firstName;
    private String lastName;
    private File profilePicture;

    public Account(String username, String hashedPassword, String salt, String email, String firstName, String lastName) {
        //default constructor
        this.username = username;   
        this.hashedPassword = hashedPassword;
        this.salt = salt;
        this.email = email;
        this.firstName = firstName;
        this.lastName = lastName;
    }

    public void login(String username, String password) {
        //login logic
    }
    public void register(String username, String hashedPassword, String salt, String email, String firstName, String lastName) {
        this.username = username;
        this.hashedPassword = hashedPassword;
        this.salt = salt;
        this.email = email;
        this.firstName = firstName;
        this.lastName = lastName;
        //registration logic
        // Check if username already exists in the database
        if (true) {
            
            // If it does, return an error message
            throw new RuntimeException("Username already exists");
        }
        //save to database
    }
    public void getFromDatabase(String username) {
        //get user from database logic
    }
    public Map<String, String> getInfo(String username) {
        //return user info
        Map<String, String> info = new HashMap<>();
        info.put("username", this.username);
        info.put("email", this.email);
        info.put("firstName", this.firstName);
        info.put("lastName", this.lastName);
        return info;
    }

    // Getter and Setter methods
    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public String getHashedPassword() {
        return hashedPassword;
    }
    public void setHashedPassword(String hashedPassword) {
        this.hashedPassword = hashedPassword;
    }
    public String getSalt() {
        return salt;
    }
    public void setSalt(String salt) {
        this.salt = salt;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getFirstName() {
        return firstName;
    }
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }
    public String getLastName() {
        return lastName;
    }
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
    public File getProfilePicture() {
        return profilePicture;
    }
    public void setProfilePicture(File profilePicture) {
        this.profilePicture = profilePicture;
    }

}
