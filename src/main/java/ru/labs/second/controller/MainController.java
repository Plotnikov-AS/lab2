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
        valueService.deleteAllValues();
        return "sprizdil";
    }

    @PostMapping("/add")
    public void add(@RequestParam(value = "newValue") Long newValue) {
        valueService.addValue(newValue);
    }
}
