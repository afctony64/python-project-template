#!/bin/bash
# Automated Project Setup Script
# Configures a new project from this template

set -e

echo "🚀 Python Project Setup"
echo "======================="
echo ""

# Get project information
read -p "Project name (e.g., my-awesome-project): " PROJECT_NAME
read -p "Project description: " PROJECT_DESC
read -p "Your name: " AUTHOR_NAME
read -p "Your email: " AUTHOR_EMAIL
read -p "GitHub username: " GITHUB_USER

# Validate inputs
if [ -z "$PROJECT_NAME" ] || [ -z "$PROJECT_DESC" ] || [ -z "$AUTHOR_NAME" ] || [ -z "$AUTHOR_EMAIL" ]; then
    echo "❌ Error: All fields are required"
    exit 1
fi

# Convert project name to package name (replace hyphens with underscores)
PACKAGE_NAME=$(echo "$PROJECT_NAME" | tr '-' '_')

echo ""
echo "📝 Configuration:"
echo "  Project: $PROJECT_NAME"
echo "  Package: $PACKAGE_NAME"
echo "  Author: $AUTHOR_NAME <$AUTHOR_EMAIL>"
echo "  GitHub: https://github.com/$GITHUB_USER/$PROJECT_NAME"
echo ""
read -p "Continue? (y/N): " CONFIRM

if [ "$CONFIRM" != "y" ] && [ "$CONFIRM" != "Y" ]; then
    echo "❌ Aborted"
    exit 1
fi

echo ""
echo "🔧 Configuring project..."

# Update pyproject.toml
if [ -f "pyproject.toml" ]; then
    sed -i.bak "s/name = \"your-project-name\"/name = \"$PROJECT_NAME\"/g" pyproject.toml
    sed -i.bak "s/description = \"Your project description\"/description = \"$PROJECT_DESC\"/g" pyproject.toml
    sed -i.bak "s/Your Name/$AUTHOR_NAME/g" pyproject.toml
    sed -i.bak "s/your.email@example.com/$AUTHOR_EMAIL/g" pyproject.toml
    sed -i.bak "s/yourusername/$GITHUB_USER/g" pyproject.toml
    sed -i.bak "s/your-project/$PROJECT_NAME/g" pyproject.toml
    sed -i.bak "s/your_package/$PACKAGE_NAME/g" pyproject.toml
    rm pyproject.toml.bak
    echo "  ✅ Updated pyproject.toml"
fi

# Update .cursor/rules.md
if [ -f ".cursor/rules.md" ]; then
    sed -i.bak "s/your_package/$PACKAGE_NAME/g" .cursor/rules.md
    rm .cursor/rules.md.bak
    echo "  ✅ Updated .cursor/rules.md"
fi

# Update docker-compose.yml
if [ -f "docker-compose.yml" ]; then
    sed -i.bak "s/your_package/$PACKAGE_NAME/g" docker-compose.yml
    rm docker-compose.yml.bak
    echo "  ✅ Updated docker-compose.yml"
fi

# Update Dockerfile
if [ -f "Dockerfile" ]; then
    sed -i.bak "s/your_package/$PACKAGE_NAME/g" Dockerfile
    rm Dockerfile.bak
    echo "  ✅ Updated Dockerfile"
fi

# Update CODEOWNERS
if [ -f ".github/CODEOWNERS" ]; then
    sed -i.bak "s/@yourusername/@$GITHUB_USER/g" .github/CODEOWNERS
    rm .github/CODEOWNERS.bak
    echo "  ✅ Updated CODEOWNERS"
fi

# Create package structure
echo ""
echo "📦 Creating package structure..."
mkdir -p "src/$PACKAGE_NAME"
cat > "src/$PACKAGE_NAME/__init__.py" << EOF
"""$PROJECT_DESC"""

__version__ = "0.1.0"
EOF
echo "  ✅ Created src/$PACKAGE_NAME/__init__.py"

# Create example module
cat > "src/$PACKAGE_NAME/main.py" << EOF
"""Main module for $PROJECT_NAME."""

import logging

logger = logging.getLogger(__name__)


def hello(name: str = "World") -> str:
    """
    Say hello to someone.

    Args:
        name: Name to greet

    Returns:
        Greeting message

    Example:
        >>> hello("Python")
        'Hello, Python!'
    """
    return f"Hello, {name}!"


def main() -> None:
    """Main entry point."""
    logger.info(hello())


if __name__ == "__main__":
    logging.basicConfig(level=logging.INFO)
    main()
EOF
echo "  ✅ Created src/$PACKAGE_NAME/main.py"

# Create example test
mkdir -p "tests/unit"
cat > "tests/unit/test_main.py" << EOF
"""Tests for main module."""

from $PACKAGE_NAME.main import hello


def test_hello_default():
    """Test hello with default argument."""
    assert hello() == "Hello, World!"


def test_hello_custom():
    """Test hello with custom name."""
    assert hello("Python") == "Hello, Python!"
EOF
echo "  ✅ Created tests/unit/test_main.py"

# Setup virtual environment
echo ""
echo "🔧 Setting up virtual environment..."
python3 -m venv venv
source venv/bin/activate || . venv/Scripts/activate 2>/dev/null || true
echo "  ✅ Created venv"

# Install dependencies
echo ""
echo "📥 Installing dependencies..."
pip install --upgrade pip > /dev/null
pip install -r requirements-dev.txt > /dev/null
echo "  ✅ Installed dependencies"

# Install pre-commit hooks
echo ""
echo "🪝 Installing pre-commit hooks..."
pre-commit install > /dev/null
echo "  ✅ Installed pre-commit hooks"

# Initialize git (if not already)
if [ ! -d ".git" ]; then
    echo ""
    echo "📁 Initializing git repository..."
    git init > /dev/null
    echo "  ✅ Initialized git"
fi

# Run tests to verify setup
echo ""
echo "🧪 Running tests..."
pytest -q
if [ $? -eq 0 ]; then
    echo "  ✅ All tests passed"
else
    echo "  ⚠️  Some tests failed (this is normal for a new project)"
fi

echo ""
echo "✨ Setup complete!"
echo ""
echo "📋 Next steps:"
echo "  1. Review and customize README.md"
echo "  2. Add your code to src/$PACKAGE_NAME/"
echo "  3. Add tests to tests/"
echo "  4. Run: source venv/bin/activate (or venv\\Scripts\\activate on Windows)"
echo "  5. Run: pytest to test"
echo "  6. Run: ruff check --fix . to lint"
echo "  7. Make your first commit: git add . && git commit -m 'chore: Initialize project'"
echo ""
echo "🚀 Happy coding!"

