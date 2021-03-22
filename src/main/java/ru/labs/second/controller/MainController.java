package ru.labs.second.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ru.labs.second.model.Value;
import ru.labs.second.service.ValueService;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class MainController {
    private final ValueService valueService;

    @GetMapping("/")
    public String mainPage() {

        return "mainPage";
    }

    @PostMapping("/add")
    public String add(@RequestParam(value = "newValue") Long newValue,
                      @RequestParam(value = "N1") Integer n1,
                      Model model) {
        List<Value> values = valueService.addValue(newValue, n1);
        model.addAttribute("values", values);
        model.addAttribute("N1", n1);

        return "mainPage";
    }
}
