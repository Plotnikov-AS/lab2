package ru.labs.second;

import lombok.RequiredArgsConstructor;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import ru.labs.second.service.ValueService;

import javax.annotation.PreDestroy;

@SpringBootApplication
@RequiredArgsConstructor
public class SecondApplication {
    private final ValueService valueService;

    public static void main(String[] args) {
        SpringApplication.run(SecondApplication.class, args);
    }

    @PreDestroy
    public void destroy() {
        valueService.deleteAllValues();
    }

}
