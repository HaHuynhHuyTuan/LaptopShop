package com.example.demo.controller.admin;

import com.example.demo.domain.Product;
import com.example.demo.service.ProductService;
import jakarta.validation.Valid;
import com.example.demo.service.UploadService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ProductController {

    private final UploadService uploadService;
    private final ProductService productService;

    public ProductController(UploadService uploadService,
                             ProductService productService) {
        this.uploadService = uploadService;
        this.productService = productService;
    }


    // Hiển thị danh sách sản phẩm
    @GetMapping("/admin/product")
    public String showProductList(Model model) {
        model.addAttribute("products", productService.findAll());
        return "admin/product/show";
    }


    // Hiển thị form tạo sản phẩm
    @GetMapping("/admin/product/create")
    public String showCreateForm(Model model) {
        model.addAttribute("product", new Product());
        return "admin/product/create";
    }

    @PostMapping("/admin/product/create")
    public String createProduct(@ModelAttribute("product") @Valid Product product,
                                BindingResult bindingResult,
                                @RequestParam("imageFile") MultipartFile file) {

        // In ra lỗi (debug như bên user controller)
        for (FieldError error : bindingResult.getFieldErrors()) {
            System.out.println(error.getField() + " - " + error.getDefaultMessage());
        }

        // Nếu có lỗi validate thì quay lại form tạo sản phẩm
        if (bindingResult.hasErrors()) {
            return "admin/product/create";
        }

        // Nếu có file ảnh thì xử lý upload và set vào product
        if (!file.isEmpty()) {
            String imageName = uploadService.HandleSaveUploadFile(file, "product");
            product.setImage(imageName);
        }

        productService.save(product);
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/view")
    public String viewProduct(@RequestParam("id") Long id, Model model) {
        Product product = productService.findById(id);
        model.addAttribute("product", product);
        return "admin/product/view";
    }

    @GetMapping("/admin/product/edit")
    public String showEditForm(@RequestParam("id") Long id, Model model) {
        Product product = productService.findById(id);
        model.addAttribute("product", product);
        return "admin/product/edit";
    }

    @PostMapping("/admin/product/edit/{id}")
    public String updateProduct(@ModelAttribute("product") @Valid Product product,
                                BindingResult bindingResult,
                                @RequestParam("imageFile") MultipartFile file) {

        for (FieldError error : bindingResult.getFieldErrors()) {
            System.out.println(error.getField() + " - " + error.getDefaultMessage());
        }

        if (bindingResult.hasErrors()) {
            return "admin/product/edit";
        }

        if (!file.isEmpty()) {
            String imageName = uploadService.HandleSaveUploadFile(file, "product");
            product.setImage(imageName);
        }

        productService.save(product);
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/delete")
    public String deleteProduct(@RequestParam("id") Long id) {
        productService.deleteById(id);
        return "redirect:/admin/product";
    }

}
