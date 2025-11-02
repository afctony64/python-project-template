# Contributing Guide

Thank you for considering contributing to this project!

## Code of Conduct

- Be respectful and inclusive
- Follow coding standards
- Write tests for new features
- Document your changes

## How to Contribute

### 1. Fork and Clone

```bash
git clone https://github.com/yourusername/your-project.git
cd your-project
```

### 2. Create Branch

```bash
git checkout -b feature/amazing-feature
```

### 3. Make Changes

- Follow coding standards (see below)
- Write tests
- Update documentation

### 4. Run Quality Checks

```bash
# Lint and format
ruff check --fix .
ruff format .

# Test
pytest

# Type check (optional)
mypy src/
```

### 5. Commit

Follow [Conventional Commits](https://www.conventionalcommits.org/):

```bash
feat: Add new feature
fix: Fix bug
docs: Update documentation
test: Add tests
refactor: Refactor code
chore: Update dependencies
```

### 6. Push and Create PR

```bash
git push origin feature/amazing-feature
```

Then create a Pull Request on GitHub.

---

## Coding Standards

### Python Style

- Follow PEP 8
- Use ruff for linting and formatting
- Maximum line length: 120 characters

### Type Hints

```python
# ✅ Good
def process_data(items: list[str], limit: int = 10) -> dict[str, int]:
    pass

# ❌ Bad
def process_data(items, limit=10):
    pass
```

### Docstrings

```python
# ✅ Good - Google style
def calculate_total(items: list[float]) -> float:
    """
    Calculate total of items.

    Args:
        items: List of prices

    Returns:
        Total price

    Example:
        >>> calculate_total([10.0, 20.0])
        30.0
    """
    return sum(items)
```

### Logging

```python
# ✅ Good
import logging
logger = logging.getLogger(__name__)
logger.info("Processing started")

# ❌ Bad
print("Processing started")
```

### Error Handling

```python
# ✅ Good - Exception chaining
try:
    risky_operation()
except ValueError as e:
    raise CustomError("Failed") from e

# ❌ Bad
try:
    risky_operation()
except:
    pass
```

---

## Testing

- Write tests for new features
- Aim for 80%+ code coverage
- Use pytest fixtures
- Mark slow tests with `@pytest.mark.slow`

```python
import pytest

def test_function():
    result = my_function()
    assert result == expected

@pytest.mark.slow
def test_integration():
    # Integration test
    pass
```

---

## Documentation

- Update README.md for user-facing changes
- Update docs/ for developer changes
- Add docstrings to new functions
- Update CHANGELOG.md

---

## Questions?

Open an issue or discussion on GitHub!

