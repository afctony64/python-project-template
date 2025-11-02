#!/bin/bash
# Sync Template Updates to Projects
# Propagates infrastructure improvements to pom-core, PomAI, and Pomothy

set -e

TEMPLATE_DIR="/Users/tonyeales/Projects/python-project-template"
PROJECTS=(
    "/Users/tonyeales/Projects/pom-core"
    "/Users/tonyeales/Projects/PomAI"
    "/Users/tonyeales/Projects/pomothy"
)

echo "🔄 Template Sync Script"
echo "======================="
echo ""
echo "This will sync infrastructure files from template to projects:"
echo "  - Dependabot configuration"
echo "  - Pre-commit config"
echo "  - Issue/PR templates"
echo "  - Cursor rules"
echo "  - Dev container config"
echo ""
read -p "Continue? (y/N): " CONFIRM

if [ "$CONFIRM" != "y" ] && [ "$CONFIRM" != "Y" ]; then
    echo "❌ Aborted"
    exit 1
fi

for PROJECT in "${PROJECTS[@]}"; do
    PROJECT_NAME=$(basename "$PROJECT")
    echo ""
    echo "📦 Syncing to $PROJECT_NAME..."

    # Check if project exists
    if [ ! -d "$PROJECT" ]; then
        echo "  ⚠️  Skipping (not found)"
        continue
    fi

    cd "$PROJECT"

    # Sync Dependabot
    if [ -f "$TEMPLATE_DIR/.github/dependabot.yml" ]; then
        mkdir -p .github
        cp "$TEMPLATE_DIR/.github/dependabot.yml" .github/
        echo "  ✅ Synced dependabot.yml"
    fi

    # Sync Issue Templates
    if [ -d "$TEMPLATE_DIR/.github/ISSUE_TEMPLATE" ]; then
        mkdir -p .github/ISSUE_TEMPLATE
        cp -r "$TEMPLATE_DIR/.github/ISSUE_TEMPLATE/"* .github/ISSUE_TEMPLATE/
        echo "  ✅ Synced issue templates"
    fi

    # Sync PR Template
    if [ -f "$TEMPLATE_DIR/.github/PULL_REQUEST_TEMPLATE.md" ]; then
        cp "$TEMPLATE_DIR/.github/PULL_REQUEST_TEMPLATE.md" .github/
        echo "  ✅ Synced PR template"
    fi

    # Sync Dev Container (optional - may need customization)
    # if [ -d "$TEMPLATE_DIR/.devcontainer" ]; then
    #     mkdir -p .devcontainer
    #     cp -r "$TEMPLATE_DIR/.devcontainer/"* .devcontainer/
    #     echo "  ✅ Synced devcontainer"
    # fi

    # Stage changes
    git add .github/

    echo "  ✅ $PROJECT_NAME synced"
done

echo ""
echo "✨ Sync complete!"
echo ""
echo "📋 Next steps for each project:"
echo "  1. Review changes: git diff --staged"
echo "  2. Commit: git commit -m 'chore: Sync infrastructure from template'"
echo "  3. Push: git push origin main"

