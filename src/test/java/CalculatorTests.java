import static org.junit.jupiter.api.Assertions.assertEquals;

import dot503.Calculator;
import org.junit.jupiter.api.Test;

class CalculatorTests {

  private final Calculator calculator = new Calculator();

  @Test
  void addition() {
    assertEquals("0.0", calculator.Addition(0, 0));
    assertEquals("2.0", calculator.Addition(1, 1));
    assertEquals("-2.0", calculator.Addition(-1, -1));
  }

  @Test
  void subtraction() {
    assertEquals("0.0", calculator.Substraction(0, 0));
    assertEquals("1.0", calculator.Substraction(2, 1));
    assertEquals("-1.0", calculator.Substraction(-2, -1));
  }

  @Test
  void multiplication() {
    assertEquals("0.0", calculator.Multiplication(0, 0));
    assertEquals("2.0", calculator.Multiplication(2, 1));
    assertEquals("2.0", calculator.Multiplication(-2, -1));
  }

  @Test
  void division() {
    assertEquals("Infinity", calculator.Division((float) 2, (float) 0));
    assertEquals("2.0", calculator.Division((float) 2, (float) 1));
    assertEquals("0.5", calculator.Division((float) 1, (float) 2));
    assertEquals("-2.0", calculator.Division((float) -2, (float) 1));
  }

  @Test
  void power() {
    assertEquals("1.0", calculator.Power(3, 0));
    assertEquals("3.0", calculator.Power(3, 1));
    assertEquals("9.0", calculator.Power(3, 2));
    assertEquals("1.73205", calculator.Power(3, (float) 1. / 2).substring(0, 7));
  }
}
