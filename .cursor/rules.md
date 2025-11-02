# Cursor AI Assistant Rules

**Project-Specific Development Standards**

---

## 🎯 Core Principles

1. **Evidence-Based Development** - Show proof, not guesses
2. **Code Quality First** - Linters are law
3. **Type Safety** - Use type hints everywhere
4. **Proper Logging** - Never use print() in production code
5. **Clear Documentation** - Google-style docstrings

---

## 📝 Code Quality Standards

### Imports
```python
# ✅ CORRECT - Organized in 3 groups
import os
import sys
from pathlib import Path

import requests
from pydantic import BaseModel

from your_package.module import function
```

### Type Hints
```python
# ✅ CORRECT - Type hints on all public functions
def process_data(
    input_data: list[dict[str, Any]],
    max_items: int = 100,
) -> dict[str, int]:
    """Process input data and return statistics."""
    pass

# ❌ WRONG - No type hints
def process_data(input_data, max_items=100):
    pass
```

### Logging
```python
# ✅ CORRECT - Use logging
import logging
logger = logging.getLogger(__name__)

def my_function():
    logger.info("Processing started")
    logger.error("Failed to process", exc_info=True)

# ❌ WRONG - Never use print()
def my_function():
    print("Processing started")
```

### Exception Handling
```python
# ✅ CORRECT - Exception chaining
try:
    risky_operation()
except ValueError as e:
    raise CustomError("Failed to process") from e

# ❌ WRONG - Lost context
try:
    risky_operation()
except ValueError:
    raise CustomError("Failed to process")
```

### Docstrings
```python
# ✅ CORRECT - Google-style with examples
def calculate_total(items: list[float], tax_rate: float = 0.1) -> float:
    """
    Calculate total with tax.

    Args:
        items: List of item prices
        tax_rate: Tax rate as decimal (default: 0.1)

    Returns:
        Total price including tax

    Example:
        >>> calculate_total([10.0, 20.0], tax_rate=0.2)
        36.0
    """
    subtotal = sum(items)
    return subtotal * (1 + tax_rate)
```

---

## 🔧 Tool Usage

### Ruff (Linting + Formatting)
```bash
# Check and auto-fix
ruff check --fix .

# Format code
ruff format .
```

### Testing
```bash
# Run all tests
pytest

# Run with coverage
pytest --cov=src --cov-report=html

# Run specific tests
pytest tests/unit/test_module.py -v
```

---

## 🚨 Common Mistakes to Avoid

1. ❌ Using `print()` instead of `logger`
2. ❌ Missing type hints on public functions
3. ❌ No exception chaining (`raise ... from e`)
4. ❌ Unused imports
5. ❌ Missing docstrings
6. ❌ Mutable default arguments
7. ❌ Bare `except:` clauses

---

## 🎯 When Debugging

1. **State the symptom with numbers**
   - ❌ "It's slow"
   - ✅ "Processing 1000 records takes 30 seconds"

2. **Gather evidence before forming hypothesis**
   - Check logs
   - Look for actual data
   - Check timestamps
   - Look for error messages

3. **Trace the data flow**
   - What was requested?
   - What was fetched?
   - What was processed?
   - What was saved?

4. **Form hypothesis only from evidence**
   - ❌ "It must be looping" (guess)
   - ✅ "Logs show 1000 iterations when limit=1" (evidence)

---

## ✅ Pre-commit Checklist

Before committing:
- [ ] Code passes `ruff check .`
- [ ] Code formatted with `ruff format .`
- [ ] Tests pass with `pytest`
- [ ] Type checks pass (if using mypy)
- [ ] Docstrings added for new functions
- [ ] No print() statements in code
- [ ] Exception chaining used

---

## 📚 Reference

- [Project README](../README.md)
- [Development Guide](../docs/DEVELOPMENT.md)
- [Contributing Guide](../docs/CONTRIBUTING.md)

