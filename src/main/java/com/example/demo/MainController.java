package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

    @GetMapping("/")
    public String redirectToIndex() {
        // Redirige a index.html dentro de /static
        return "forward:/index.html";
    }
}
