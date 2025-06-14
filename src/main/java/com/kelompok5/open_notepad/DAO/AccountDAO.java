package com.kelompok5.open_notepad.DAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;


@Component
public abstract  class AccountDAO {

    @Autowired
    protected JdbcTemplate jdbcTemplate;



    public void register(String username, String hashedPassword, String salt, String email, String firstName, String lastName){
        //registration logic
        // Query the database to check if the user exists
        int rowCount = 0;
        String sql = "SELECT COUNT(*) AS Account FROM Accounts WHERE username = ?";
        rowCount = jdbcTemplate.queryForObject(sql, new Object[]{username}, (rs, rowNum) -> rs.getInt("Account"));
        if (rowCount > 0) {
            // If the user already exists, return an error message
            throw new RuntimeException("user already exist");
        }
        //save to database
        sql = "INSERT INTO Accounts (username, hashedPassword, salt, email, firstName, lastName) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            jdbcTemplate.update(sql, username, hashedPassword, salt, email, firstName, lastName);
        } catch (Exception e) {
            // If there is an error during registration, return an error message
            throw new RuntimeException("error uploading to database");
        }
        //Create user details
        sql = "INSERT INTO UserDetails(username,aboutMe, instagram, linkedIn) VALUES (? , '', '', '')";
        try {
            jdbcTemplate.update(sql, username);
        } catch (Exception e) {
            // If there is an error during creating user details, return an error message
            throw new RuntimeException("error creating user details");
        }
    }

    public void updateInfo(String username, String email, String firstName, String lastName, String hashedPassword, String salt) {
        //update user info logic
        //save to database
        String sql = "UPDATE Accounts SET email = ?, firstName = ?, lastName = ?, hashedPassword = ?, salt = ? WHERE username = ?";
        try {
            jdbcTemplate.update(sql, email, firstName, lastName, hashedPassword, salt, username);
        } catch (Exception e) {
            // If there is an error during update, return an error message
            System.out.println(e.getMessage());
            throw new RuntimeException("Error updating user info");
        }
    }

    public void uploadProfilePicture(String username, int fileID) {
        //upload profile picture logic
        //save to database
        String sql = "UPDATE Accounts SET fileID = ? WHERE username = ?";
        try {
            jdbcTemplate.update(sql, fileID, username);
        } catch (Exception e) {
            // If there is an error during upload, return an error message
            System.out.println(e.getMessage());
            throw new RuntimeException("Error uploading profile picture");
        }
    }


}
