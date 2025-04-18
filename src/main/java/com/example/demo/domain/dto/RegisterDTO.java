package com.example.demo.domain.dto;

import com.example.demo.service.validator.RegisterChecked;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;

@RegisterChecked
public class RegisterDTO {
    @NotEmpty(message = "First name cannot be empty")
    @Size(min = 3, message = "First name must have at least 3 character")
    private String firstName;
    private String lastName;

    @Email(message = "Invalid Email", regexp = "^[a-zA-Z0-9_!#$%&'*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+$")
    private String email;
    private String password;

    @Size(min = 3, message = "confirmPassword must have at least 3 character")
    private String confirmPassword;

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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    public void setComfirmPassword(String comfirmPassword) {
        this.confirmPassword = comfirmPassword;
    }
}
