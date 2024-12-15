package com.javaapp.java_sp;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController // This annotation is required to define a REST controller
public class HomeController {
    
    @RequestMapping("/") // Maps the root URL to this method
    public String hello() {
        return "Hello, Vedant Patel 1.2!";
    }
}
