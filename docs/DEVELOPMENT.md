# Development Guide

## Setup

### 1. Clone Repository

```bash
git clone <your-repo-url>
cd your-project
```

### 2. Create Virtual Environment

```bash
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

### 3. Install Dependencies

```bash
pip install -r requirements-dev.txt
pip install -e .  # Install package in editable mode
```

### 4. Install Pre-commit Hooks

```bash
pre-commit install
```

### 5. Verify Setup

```bash
# Run tests
pytest

# Run linter
ruff check .

# Run type checker (optional)
mypy src/
```

---

## Development Workflow

### Making Changes

1. Create feature branch
   ```bash
   git checkout -b feature/your-feature
   ```

2. Make your changes

3. Run quality checks
   ```bash
   # Auto-fix issues
   ruff check --fix .
   ruff format .
   
   # Run tests
   pytest
   ```

4. Commit (pre-commit hooks run automatically)
   ```bash
   git add .
   git commit -m "feat: Add your feature"
   ```

5. Push and create PR
   ```bash
   git push origin feature/your-feature
   ```

---

## Code Quality Tools

### Ruff (Linting + Formatting)

```bash
# Check all files
ruff check .

# Auto-fix issues
ruff check --fix .

# Format code
ruff format .
```

### Pytest (Testing)

```bash
# Run all tests
pytest

# Run with coverage
pytest --cov=src --cov-report=html

# Run specific test
pytest tests/unit/test_module.py::test_function

# Run with markers
pytest -m "not slow"
```

### MyPy (Type Checking)

```bash
# Check types
mypy src/

# Strict mode
mypy --strict src/
```

---

## Docker Development

### Build and Run

```bash
# Start services
docker-compose up

# Rebuild after changes
docker-compose up --build

# Run command in container
docker-compose exec app python your_script.py

# Shell into container
docker-compose exec app bash
```

---

## Version Management

```bash
# Bump version
python scripts/bump_version.py patch  # 1.0.0 -> 1.0.1
python scripts/bump_version.py minor  # 1.0.0 -> 1.1.0
python scripts/bump_version.py major  # 1.0.0 -> 2.0.0

# Set specific version
python scripts/bump_version.py --set 2.1.3

# Dry-run
python scripts/bump_version.py patch --dry-run
```

---

## Troubleshooting

### Pre-commit Hooks Failing

```bash
# Update hooks
pre-commit autoupdate

# Clear cache
pre-commit clean
pre-commit install --install-hooks
```

### Import Errors

```bash
# Reinstall in editable mode
pip install -e .
```

### Docker Issues

```bash
# Remove all containers and volumes
docker-compose down -v

# Rebuild from scratch
docker-compose build --no-cache
```

---

## Best Practices

1. **Always use type hints** on public functions
2. **Write tests** for new features
3. **Use logging** instead of print()
4. **Follow docstring conventions** (Google style)
5. **Keep commits atomic** and well-described
6. **Run quality checks** before committing

