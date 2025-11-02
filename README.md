# Python Project Template

**Enterprise-Grade Development Infrastructure Template**

This is a **repository template** containing all the advanced development infrastructure, tooling, and best practices we've built across pom-core, PomAI, and Pomothy. Use this as a starting point for new Python projects.

---

## 🎯 What This Template Provides

### Development Infrastructure
- ✅ **Version Control System** - Semantic versioning with automated bump script
- ✅ **Pre-commit Hooks** - Auto-fixing linters, security scans, format checks
- ✅ **Ruff Linting** - Fast, comprehensive Python linting (replaces 10+ tools)
- ✅ **Code Formatting** - Consistent code style with ruff-format
- ✅ **Type Checking** - MyPy configuration for type safety
- ✅ **Testing Framework** - Pytest with coverage reporting
- ✅ **Security Scanning** - Bandit for security vulnerabilities
- ✅ **Cursor AI Rules** - Optimized AI assistant configuration
- ✅ **Docker Setup** - Development and production Docker configurations
- ✅ **Documentation Templates** - Structured documentation approach

### Key Features
- 🚀 **Zero Configuration** - Works out of the box
- 🔧 **Highly Customizable** - Adapt to your project needs
- 📊 **Enterprise-Ready** - Battle-tested in production
- 🤖 **AI-Optimized** - Designed for AI-assisted development
- 🔒 **Security-First** - Built-in security best practices

---

## 🚀 Quick Start

### 1. Use This Template

**Option A: GitHub Template**
```bash
# Click "Use this template" on GitHub
# Or clone and remove git history:
git clone <this-repo-url> my-new-project
cd my-new-project
rm -rf .git
git init
```

**Option B: Local Copy**
```bash
cp -r python-project-template my-new-project
cd my-new-project
rm -rf .git
git init
```

### 2. Customize for Your Project

```bash
# 1. Update pyproject.toml
vim pyproject.toml
# Change: name, version, description, authors, urls

# 2. Update README.md
vim README.md
# Replace this template README with your project description

# 3. Set up your project structure
mkdir -p src/your_package tests docs
```

### 3. Install Development Tools

```bash
# Install pre-commit hooks
pip install pre-commit
pre-commit install

# Install development dependencies
pip install -r requirements-dev.txt

# Test the setup
python scripts/dev_check.py --help
```

### 4. Initialize Version Control

```bash
git add .
git commit -m "chore: Initialize project from python-project-template"
git remote add origin <your-repo-url>
git push -u origin main
```

---

## 📁 Template Structure

```
python-project-template/
├── .github/                    # GitHub workflows and templates
│   └── workflows/
│       └── ci.yml             # CI/CD pipeline
├── .cursor/                    # Cursor AI configuration
│   └── rules.md               # AI assistant rules
├── .pre-commit-config.yaml    # Pre-commit hooks configuration
├── .gitignore                 # Standard Python gitignore
├── pyproject.toml             # Project configuration (ruff, mypy, pytest)
├── requirements-dev.txt       # Development dependencies
├── Dockerfile                 # Production Docker image
├── Dockerfile.dev             # Development Docker image
├── docker-compose.yml         # Development environment
├── scripts/                   # Development automation scripts
│   ├── bump_version.py       # Semantic version management
│   ├── dev_check.py          # Linting and formatting
│   └── dev_tools/            # Additional dev utilities
├── docs/                      # Documentation
│   ├── DEVELOPMENT.md        # Development guide
│   ├── ARCHITECTURE.md       # Architecture documentation
│   └── CONTRIBUTING.md       # Contribution guidelines
├── tests/                     # Test suite
│   ├── unit/                 # Unit tests
│   ├── integration/          # Integration tests
│   └── conftest.py           # Pytest configuration
└── README.md                  # This file
```

---

## 🔧 Key Components

### 1. Version Management

**Semantic Versioning with Automation**

```bash
# Bump version automatically
python scripts/bump_version.py patch  # 1.0.0 -> 1.0.1
python scripts/bump_version.py minor  # 1.0.0 -> 1.1.0
python scripts/bump_version.py major  # 1.0.0 -> 2.0.0

# Set specific version
python scripts/bump_version.py --set 2.1.3

# Dry-run (preview changes)
python scripts/bump_version.py patch --dry-run
```

**What it does:**
- ✅ Updates version in `pyproject.toml`
- ✅ Creates git tag (`v1.0.1`)
- ✅ Commits the change
- ✅ Pushes tag to remote

### 2. Pre-commit Hooks

**Auto-fixing Code Quality Checks**

Configured in `.pre-commit-config.yaml`:

```yaml
repos:
  - repo: local
    hooks:
      - id: ruff-lint       # Fast linting
      - id: ruff-format     # Code formatting
      - id: mypy            # Type checking
      - id: bandit          # Security scan
      - id: check-yaml      # YAML validation
      - id: check-json      # JSON validation
      - id: detect-secrets  # Secret detection
```

**Usage:**
```bash
# Install hooks
pre-commit install

# Run manually on all files
pre-commit run --all-files

# Run on staged files
pre-commit run

# Update hook versions
pre-commit autoupdate
```

### 3. Ruff Configuration

**Fast, Comprehensive Python Linting**

Ruff replaces:
- ✅ **Black** - Code formatting
- ✅ **isort** - Import sorting
- ✅ **flake8** - Style checking
- ✅ **autoflake** - Unused imports removal
- ✅ **pyupgrade** - Modern Python syntax
- ✅ **bandit** - Security checking

Configured in `pyproject.toml`:

```toml
[tool.ruff]
line-length = 120
target-version = "py311"

[tool.ruff.lint]
select = ["E", "W", "F", "I", "UP", "B", "SIM", "RUF", "PERF", "PTH"]
ignore = ["E501"]  # Line length (handled by formatter)

[tool.ruff.format]
quote-style = "double"
indent-style = "space"
```

**Usage:**
```bash
# Lint and fix
ruff check --fix .

# Format code
ruff format .

# Check without fixing
ruff check .
```

### 4. Development Check Script

**One Command for All Quality Checks**

```bash
# Check everything
python scripts/dev_check.py

# Check only staged files
python scripts/dev_check.py --staged

# Auto-fix issues
python scripts/dev_check.py --fix

# Specific checks
python scripts/dev_check.py --lint-only
python scripts/dev_check.py --format-only
python scripts/dev_check.py --type-only
```

### 5. Docker Configuration

**Development and Production Environments**

**Development:**
```bash
# Start development environment
docker-compose up

# Run commands in container
docker-compose exec app python your_script.py

# Rebuild after dependency changes
docker-compose up --build
```

**Production:**
```bash
# Build production image
docker build -t your-app:latest .

# Run production container
docker run -d -p 8000:8000 your-app:latest
```

### 6. Cursor AI Rules

**Optimized AI Assistant Configuration**

Located in `.cursor/rules.md`:

- ✅ Code quality standards
- ✅ Architectural patterns
- ✅ Debugging protocols
- ✅ Evidence-based analysis
- ✅ Project-specific conventions

**The AI will:**
- Follow your project patterns
- Use proper logging (not print)
- Apply type hints
- Write proper docstrings
- Handle errors correctly

---

## 📊 Workflow Examples

### Daily Development Workflow

```bash
# 1. Start working on feature
git checkout -b feature/my-feature

# 2. Write code
vim src/your_package/module.py

# 3. Run quality checks
python scripts/dev_check.py --staged --fix

# 4. Commit (pre-commit hooks run automatically)
git add .
git commit -m "feat: Add my feature"

# 5. Push
git push origin feature/my-feature
```

### Release Workflow

```bash
# 1. Bump version
python scripts/bump_version.py minor  # 1.0.0 -> 1.1.0

# 2. Update CHANGELOG.md
vim CHANGELOG.md

# 3. Commit changelog
git add CHANGELOG.md
git commit -m "docs: Update CHANGELOG for v1.1.0"

# 4. Push (version tag already created and pushed)
git push origin main

# 5. Create GitHub release (optional)
gh release create v1.1.0 --notes-file CHANGELOG.md
```

### Testing Workflow

```bash
# Run all tests
pytest

# Run with coverage
pytest --cov=src --cov-report=html

# Run specific test file
pytest tests/unit/test_module.py

# Run with markers
pytest -m "not slow"
```

---

## 🎯 Best Practices Included

### Code Quality
- ✅ Type hints on all public functions
- ✅ Google-style docstrings
- ✅ Proper exception handling with chaining
- ✅ No print statements (use logging)
- ✅ Import organization (stdlib → third-party → local)

### Architecture
- ✅ Factory pattern for external dependencies
- ✅ Separation of concerns
- ✅ Dependency injection
- ✅ Configuration management
- ✅ Proper error handling

### Documentation
- ✅ Comprehensive README
- ✅ Architecture documentation
- ✅ API documentation
- ✅ Examples and usage guides
- ✅ Contributing guidelines

### Testing
- ✅ Unit tests for all modules
- ✅ Integration tests for workflows
- ✅ Test fixtures and utilities
- ✅ Coverage reporting
- ✅ Pytest markers for test organization

---

## 🔒 Security Features

- ✅ **Secret Detection** - Pre-commit hook scans for leaked secrets
- ✅ **Security Scanning** - Bandit checks for vulnerabilities
- ✅ **Dependency Scanning** - GitHub Dependabot alerts
- ✅ **Input Validation** - Pydantic models for data validation
- ✅ **Secure Defaults** - No hardcoded credentials

---

## 🤖 AI-Assisted Development

This template is optimized for AI-powered development:

### Cursor AI Integration
- Custom rules in `.cursor/rules.md`
- Project-specific patterns and conventions
- Evidence-based debugging protocols
- Quality standards enforcement

### AI Benefits
- ✅ Faster development with consistent patterns
- ✅ Fewer bugs through automated checks
- ✅ Better code quality with standards enforcement
- ✅ Clear documentation for AI comprehension

---

## 📚 Documentation

- **[DEVELOPMENT.md](docs/DEVELOPMENT.md)** - Development guide
- **[ARCHITECTURE.md](docs/ARCHITECTURE.md)** - Architecture documentation
- **[CONTRIBUTING.md](docs/CONTRIBUTING.md)** - How to contribute
- **[CHANGELOG.md](CHANGELOG.md)** - Version history

---

## 🆘 Troubleshooting

### Pre-commit Hooks Failing

```bash
# Update hooks
pre-commit autoupdate

# Clear cache and reinstall
pre-commit clean
pre-commit install --install-hooks
```

### Ruff Errors

```bash
# Auto-fix issues
ruff check --fix .

# See specific error codes
ruff check --output-format=full .
```

### Docker Issues

```bash
# Rebuild containers
docker-compose down -v
docker-compose up --build

# Clear Docker cache
docker system prune -a
```

---

## 🎓 Learning Resources

- [Ruff Documentation](https://docs.astral.sh/ruff/)
- [Pre-commit Documentation](https://pre-commit.com/)
- [pytest Documentation](https://docs.pytest.org/)
- [MyPy Documentation](https://mypy.readthedocs.io/)
- [Semantic Versioning](https://semver.org/)

---

## 📝 License

MIT License - see LICENSE file

---

## 🙏 Acknowledgments

This template incorporates best practices from:
- **pom-core** - Shared core library architecture
- **PomAI** - Enterprise application patterns
- **Pomothy** - Production deployment experience

---

## ✨ Quick Reference

### Common Commands

```bash
# Development
python scripts/dev_check.py --staged --fix  # Check and fix staged files
pre-commit run --all-files                  # Run all pre-commit hooks
pytest --cov=src                            # Run tests with coverage

# Version Management
python scripts/bump_version.py patch        # Bump patch version
python scripts/bump_version.py minor        # Bump minor version
python scripts/bump_version.py major        # Bump major version

# Docker
docker-compose up                           # Start development environment
docker-compose exec app bash                # Shell into container
docker-compose down -v                      # Stop and remove volumes

# Code Quality
ruff check --fix .                          # Lint and auto-fix
ruff format .                               # Format code
mypy src/                                   # Type check
```

---

**Ready to build something amazing? 🚀**

Start by customizing `pyproject.toml` and creating your first module!

