"""
Example Calculator Module

Demonstrates best practices:
- Type hints
- Docstrings
- Logging
- Error handling
- Testing
"""

import logging
from typing import Union

logger = logging.getLogger(__name__)


class DivisionByZeroError(Exception):
    """Raised when attempting to divide by zero."""

    pass


def add(a: Union[int, float], b: Union[int, float]) -> Union[int, float]:
    """
    Add two numbers.

    Args:
        a: First number
        b: Second number

    Returns:
        Sum of a and b

    Example:
        >>> add(2, 3)
        5
        >>> add(2.5, 1.5)
        4.0
    """
    result = a + b
    logger.debug(f"Adding {a} + {b} = {result}")
    return result


def subtract(a: Union[int, float], b: Union[int, float]) -> Union[int, float]:
    """
    Subtract b from a.

    Args:
        a: Number to subtract from
        b: Number to subtract

    Returns:
        Difference of a and b

    Example:
        >>> subtract(5, 3)
        2
    """
    result = a - b
    logger.debug(f"Subtracting {a} - {b} = {result}")
    return result


def multiply(a: Union[int, float], b: Union[int, float]) -> Union[int, float]:
    """
    Multiply two numbers.

    Args:
        a: First number
        b: Second number

    Returns:
        Product of a and b

    Example:
        >>> multiply(3, 4)
        12
    """
    result = a * b
    logger.debug(f"Multiplying {a} * {b} = {result}")
    return result


def divide(a: Union[int, float], b: Union[int, float]) -> float:
    """
    Divide a by b.

    Args:
        a: Dividend
        b: Divisor

    Returns:
        Quotient of a and b

    Raises:
        DivisionByZeroError: If b is zero

    Example:
        >>> divide(10, 2)
        5.0
        >>> divide(10, 0)
        Traceback (most recent call last):
        ...
        DivisionByZeroError: Cannot divide by zero
    """
    if b == 0:
        logger.error(f"Attempted division by zero: {a} / {b}")
        raise DivisionByZeroError("Cannot divide by zero")

    result = a / b
    logger.debug(f"Dividing {a} / {b} = {result}")
    return result

