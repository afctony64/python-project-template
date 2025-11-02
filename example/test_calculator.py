"""
Example Tests for Calculator Module

Demonstrates testing best practices:
- Clear test names
- Arrange-Act-Assert pattern
- Edge cases
- Error handling
- Fixtures
"""

import pytest

from example.calculator import (
    DivisionByZeroError,
    add,
    divide,
    multiply,
    subtract,
)


class TestAdd:
    """Tests for add function."""

    def test_add_positive_numbers(self):
        """Test adding two positive numbers."""
        # Arrange
        a, b = 2, 3

        # Act
        result = add(a, b)

        # Assert
        assert result == 5

    def test_add_negative_numbers(self):
        """Test adding two negative numbers."""
        assert add(-2, -3) == -5

    def test_add_mixed_signs(self):
        """Test adding positive and negative."""
        assert add(5, -3) == 2

    def test_add_floats(self):
        """Test adding floating point numbers."""
        assert add(2.5, 1.5) == 4.0


class TestSubtract:
    """Tests for subtract function."""

    def test_subtract_positive_numbers(self):
        """Test subtracting positive numbers."""
        assert subtract(5, 3) == 2

    def test_subtract_negative_result(self):
        """Test subtraction resulting in negative."""
        assert subtract(3, 5) == -2


class TestMultiply:
    """Tests for multiply function."""

    def test_multiply_positive_numbers(self):
        """Test multiplying positive numbers."""
        assert multiply(3, 4) == 12

    def test_multiply_by_zero(self):
        """Test multiplying by zero."""
        assert multiply(5, 0) == 0

    def test_multiply_negative_numbers(self):
        """Test multiplying negative numbers."""
        assert multiply(-3, -4) == 12


class TestDivide:
    """Tests for divide function."""

    def test_divide_positive_numbers(self):
        """Test dividing positive numbers."""
        assert divide(10, 2) == 5.0

    def test_divide_by_zero_raises_error(self):
        """Test that dividing by zero raises DivisionByZeroError."""
        with pytest.raises(DivisionByZeroError, match="Cannot divide by zero"):
            divide(10, 0)

    def test_divide_negative_numbers(self):
        """Test dividing negative numbers."""
        assert divide(-10, -2) == 5.0

    def test_divide_mixed_signs(self):
        """Test dividing numbers with different signs."""
        assert divide(10, -2) == -5.0


@pytest.fixture
def calculator_values():
    """Fixture providing test values."""
    return {"a": 10, "b": 5}


def test_calculator_operations_with_fixture(calculator_values):
    """Test multiple operations using fixture."""
    a = calculator_values["a"]
    b = calculator_values["b"]

    assert add(a, b) == 15
    assert subtract(a, b) == 5
    assert multiply(a, b) == 50
    assert divide(a, b) == 2.0

