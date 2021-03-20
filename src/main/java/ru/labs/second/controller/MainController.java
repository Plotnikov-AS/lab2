package ru.labs.second.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ru.labs.second.service.AddValueService;

@Controller
@RequiredArgsConstructor
public class MainController {
    private final AddValueService addValueService;

    @GetMapping("/")
    public String mainPage() {

        return "mainPage";
    }

    @PostMapping("/add")
    public String add(@RequestParam(value = "newValue") Integer newValue, Model model) {
        model.addAttribute("newValue", addValueService.addValue(newValue));
        return "mainPage";
    }
}
