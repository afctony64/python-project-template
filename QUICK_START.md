# Quick Start Guide

## 🚀 Using This Template

### Method 1: GitHub Template (Recommended)

1. Click **"Use this template"** button on GitHub
2. Name your new repository
3. Clone your new repo
4. Run setup script (see below)

### Method 2: Local Copy

```bash
# Copy template
cp -r python-project-template my-new-project
cd my-new-project

# Remove git history
rm -rf .git
git init

# Run setup
./setup.sh  # Or follow manual steps below
```

---

## ⚙️ Setup Steps

### 1. Customize Project

```bash
# Edit pyproject.toml
# Change these fields:
# - name = "your-project-name"
# - description = "..."
# - authors = [...]
# - [project.urls]

# Edit .cursor/rules.md
# Update project-specific rules

# Edit README.md
# Replace with your project description
```

### 2. Install Tools

```bash
# Create virtual environment
python -m venv venv
source venv/bin/activate

# Install dependencies
pip install -r requirements-dev.txt

# Install pre-commit hooks
pre-commit install

# Verify setup
pre-commit run --all-files
```

### 3. Create Your Package

```bash
# Create package structure
mkdir -p src/your_package
touch src/your_package/__init__.py
touch src/your_package/main.py

# Create first test
mkdir -p tests/unit
cat > tests/unit/test_main.py << 'EOF'
def test_example():
    assert True
EOF
```

### 4. First Commit

```bash
git add .
git commit -m "chore: Initialize from python-project-template"
git remote add origin <your-repo-url>
git push -u origin main
```

---

## 🧪 Verify Everything Works

```bash
# Run linter
ruff check .

# Format code
ruff format .

# Run tests
pytest

# Check types (optional)
mypy src/
```

---

## 📦 Development Workflow

```bash
# 1. Create feature branch
git checkout -b feature/my-feature

# 2. Make changes to src/your_package/

# 3. Add tests to tests/

# 4. Run quality checks
ruff check --fix .
pytest

# 5. Commit (pre-commit hooks run automatically)
git commit -m "feat: Add my feature"

# 6. Push
git push origin feature/my-feature
```

---

## 🔄 Version Management

```bash
# Bump version
python scripts/bump_version.py patch  # 0.1.0 -> 0.1.1
python scripts/bump_version.py minor  # 0.1.0 -> 0.2.0
python scripts/bump_version.py major  # 0.1.0 -> 1.0.0

# This will:
# - Update pyproject.toml
# - Commit the change
# - Create git tag
# - Push tag to remote
```

---

## 🐳 Docker (Optional)

```bash
# Start development environment
docker-compose up

# Run commands in container
docker-compose exec app pytest

# Stop
docker-compose down
```

---

## 📚 Documentation

- **[README.md](README.md)** - Overview and features
- **[docs/DEVELOPMENT.md](docs/DEVELOPMENT.md)** - Development guide
- **[docs/CONTRIBUTING.md](docs/CONTRIBUTING.md)** - Contributing guidelines
- **[CHANGELOG.md](CHANGELOG.md)** - Version history

---

## ❓ Questions?

See [README.md](README.md) for detailed documentation.

