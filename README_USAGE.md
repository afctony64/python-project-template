# How to Use This Template

## Quick Start (60 seconds)

```bash
# 1. Copy template
cp -r python-project-template my-awesome-project
cd my-awesome-project

# 2. Remove git history
rm -rf .git
git init

# 3. Edit pyproject.toml - Change 3 things:
#    - name = "my-awesome-project"
#    - description = "My project does amazing things"
#    - authors = [{name = "Your Name", email = "you@email.com"}]

# 4. Setup
python -m venv venv
source venv/bin/activate  # Windows: venv\Scripts\activate
pip install -r requirements-dev.txt
pre-commit install

# 5. Create your package
mkdir -p src/my_project
echo "# My Project" > src/my_project/__init__.py

# 6. First commit
git add .
git commit -m "chore: Initialize from python-project-template"

# 🎉 Done! Start coding!
```

## What You Get

- ✅ Pre-commit hooks (auto-fixing)
- ✅ Ruff linting and formatting
- ✅ Version management script
- ✅ Cursor AI rules
- ✅ Docker setup
- ✅ GitHub Actions CI/CD
- ✅ Pytest testing
- ✅ Security scanning

## Common Commands

```bash
# Development
ruff check --fix .       # Lint and auto-fix
ruff format .            # Format code
pytest                   # Run tests
pytest --cov=src         # With coverage

# Version Management
python scripts/bump_version.py patch  # 1.0.0 -> 1.0.1
python scripts/bump_version.py minor  # 1.0.0 -> 1.1.0
python scripts/bump_version.py major  # 1.0.0 -> 2.0.0

# Docker
docker-compose up        # Start dev environment
docker-compose exec app bash  # Shell into container
```

## Documentation

- **[README.md](README.md)** - Full template documentation
- **[QUICK_START.md](QUICK_START.md)** - Detailed setup guide
- **[docs/DEVELOPMENT.md](docs/DEVELOPMENT.md)** - Development workflow
- **[docs/CONTRIBUTING.md](docs/CONTRIBUTING.md)** - Contributing guidelines

## Need Help?

See [README.md](README.md) for comprehensive documentation.
