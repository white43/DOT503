package dot503;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Calculator {

    @GetMapping("/addition/{a}/{b}")
    public String Addition(@PathVariable Integer a, @PathVariable Integer b) {
        return String.valueOf(a + b);
    }

    @GetMapping("/substraction/{a}/{b}")
    public String Substraction(@PathVariable Integer a, @PathVariable Integer b) {
        return String.valueOf(a - b);
    }

    @GetMapping("/division/{a}/{b}")
    public String Division(@PathVariable Float a, @PathVariable Float b) {
        return String.valueOf(a / b);
    }
};