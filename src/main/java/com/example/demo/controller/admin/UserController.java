package com.example.demo.controller.admin;

import com.example.demo.domain.Role;
import com.example.demo.domain.User;
import com.example.demo.service.UploadService;
import com.example.demo.service.UserService;
import jakarta.validation.Valid;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.validation.FieldError;


import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/admin/user")
public class UserController {

    private final UserService userService;
    private final UploadService uploadService;
    private final PasswordEncoder passwordEncoder;

    public UserController(UserService userService, UploadService uploadService, PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.passwordEncoder = passwordEncoder;
    }

    // Hiển thị form tạo user
    @GetMapping("/create")
    public String showCreateForm(Model model) {
        model.addAttribute("user", new User());
        return "admin/user/create";
    }

    // Xử lý tạo mới user
    @PostMapping("/create")
    public String createUser(@ModelAttribute("user") @Valid User user,
                             BindingResult newbindingResult,
                             @RequestParam("avatarFile") MultipartFile file) {
        List<FieldError> errors = newbindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getObjectName() + " - " + error.getDefaultMessage());
        }
        // Validate
        if (newbindingResult.hasErrors()) {
            return "admin/user/create";
        }
        //
        String avatar = uploadService.HandleSaveUploadFile(file, "avatar");
        String hashPassword = passwordEncoder.encode(user.getPassword());

        user.setAvatar(avatar);
        user.setPassword(hashPassword);
        user.setRole(userService.geRoleByName(user.getRole().getName()));
        userService.save(user);

        return "redirect:/admin/user";
    }

    // Danh sách user
    @GetMapping
    public String listUsers(Model model) {
        List<User> users = userService.findAll();
        model.addAttribute("users", users);
        return "admin/user/list";
    }

    // Xem chi tiết user
    @GetMapping("/view/{id}")
    public String viewUser(@PathVariable("id") Long id, Model model) {
        User user = userService.findById(id).orElse(null);
        if (user == null) return "redirect:/admin/user";
        model.addAttribute("user", user);
        return "admin/user/view";
    }

    // Hiển thị form cập nhật
    @GetMapping("/edit/{id}")
    public String editUserForm(@PathVariable Long id, Model model) {
        Optional<User> optionalUser = userService.findById(id);
        if (optionalUser.isEmpty()) {
            return "redirect:/admin/user";
        }

        User user = optionalUser.get();
        if (user.getRole() == null) {
            user.setRole(new Role()); // tránh lỗi binding role.name
        }

        model.addAttribute("user", user);
        return "admin/user/edit";
    }

    // Xử lý cập nhật người dùng
    @PostMapping("/edit/{id}")
    public String updateUser(@PathVariable("id") Long id,
                             @ModelAttribute("user") @Valid User updatedUser,
                             BindingResult bindingResult,
                             @RequestParam("avatarFile") MultipartFile file,
                             Model model) {

        if (bindingResult.hasErrors()) {
            return "admin/user/edit"; // View đúng đường dẫn!
        }

        Optional<User> optionalUser = userService.findById(id);
        if (optionalUser.isEmpty()) {
            return "redirect:/admin/user";
        }

        User existingUser = optionalUser.get();

        existingUser.setFullName(updatedUser.getFullName());
        existingUser.setEmail(updatedUser.getEmail());
        existingUser.setPhone(updatedUser.getPhone());
        existingUser.setAddress(updatedUser.getAddress());

        if (updatedUser.getRole() != null && updatedUser.getRole().getName() != null) {
            existingUser.setRole(userService.geRoleByName(updatedUser.getRole().getName()));
        }

        if (!file.isEmpty()) {
            String avatar = uploadService.HandleSaveUploadFile(file, "avatar");
            existingUser.setAvatar(avatar);
        }

        if (updatedUser.getPassword() != null && !updatedUser.getPassword().isBlank()) {
            String hashedPassword = passwordEncoder.encode(updatedUser.getPassword());
            existingUser.setPassword(hashedPassword);
        }

        userService.save(existingUser);

        return "redirect:/admin/user";
    }


    // Xóa user
    @PostMapping("/delete/{id}")
    public String deleteUser(@PathVariable("id") Long id) {
        userService.deleteById(id);
        return "redirect:/admin/user";
    }
}
