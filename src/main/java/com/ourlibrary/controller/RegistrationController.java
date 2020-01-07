package com.ourlibrary.controller;

import com.ourlibrary.service.UserService;
import com.ourlibrary.user.UserRegistration;
import com.ourlibrary.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;
import java.util.logging.Logger;

@Controller
public class RegistrationController {

    @Autowired
    public UserService userService;

    private Logger logger = Logger.getLogger(getClass().getName());

    @InitBinder
    public void initBinder(WebDataBinder dataBinder) {

        StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);

        dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
    }

    @GetMapping("/registration")
    public String showRegistrationPage(Model theModel) {

        theModel.addAttribute("userRegistration", new UserRegistration());

        return "registration";
    }

    @PostMapping("/processRegistration")
    public String processRegistration(
            @Valid @ModelAttribute("userRegistration") UserRegistration userRegistration,
            BindingResult bindingResult,
            Model theModel) {

        String username = userRegistration.getUsername();
        logger.info("Processing registration form for: " + username);

        if (bindingResult.hasErrors()) {
            return "registration";
        }

        User existing = userService.findByUsername(username);
        if (existing != null) {
            theModel.addAttribute("userRegistration", new UserRegistration());
            theModel.addAttribute("registrationError", "Podana nazwa użytkownika jest niedostępna");

            logger.warning("Username already exists");
            return "registration";
        }

        userService.save(userRegistration);

        logger.info("Successfully created user: " + username);

        return "registration-confirmation";
    }
}
