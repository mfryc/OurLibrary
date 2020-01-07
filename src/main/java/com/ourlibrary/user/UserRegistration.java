package com.ourlibrary.user;

import com.ourlibrary.validation.FieldMatch;
import com.ourlibrary.validation.ValidEmail;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@FieldMatch.List({
        @FieldMatch(first = "password", second = "matchingPassword", message = "nie jest takie samo w obu polach")
})
public class UserRegistration {

    @NotNull(message = "jest wymagana")
    @Size(min = 1, message = "jest wymagana")
    private String username;

    @NotNull(message = "jest wymagane")
    @Size(min = 1, message = "jest wymagane")
    private String password;

    @NotNull(message = "jest wymagane")
    @Size(min = 1, message = "jest wymagane")
    private String matchingPassword;

    @NotNull(message = "jest wymagane")
    @Size(min = 1, message = "jest wymagane")
    private String firstName;

    @NotNull(message = "jest wymagane")
    @Size(min = 1, message = "jest wymagane")
    private String lastName;

    @ValidEmail
    @NotNull(message = "jest wymagany")
    @Size(min = 1, message = "jest wymagany")
    private String email;

    public UserRegistration() {
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

    public String getMatchingPassword() {
        return matchingPassword;
    }

    public void setMatchingPassword(String matchingPassword) {
        this.matchingPassword = matchingPassword;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
