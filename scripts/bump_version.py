#!/usr/bin/env python3
"""
Version Bump Script

Bumps version in pyproject.toml and creates git tag.

Usage:
    python scripts/bump_version.py patch  # 1.0.0 -> 1.0.1
    python scripts/bump_version.py minor  # 1.0.0 -> 1.1.0
    python scripts/bump_version.py major  # 1.0.0 -> 2.0.0
    python scripts/bump_version.py --set 1.2.3  # Set specific version
"""

import argparse
import re
import subprocess
import sys
from pathlib import Path


def get_current_version(pyproject_path: Path) -> str:
    """Extract current version from pyproject.toml."""
    content = pyproject_path.read_text()
    match = re.search(r'^version\s*=\s*"([^"]+)"', content, re.MULTILINE)
    if not match:
        raise ValueError("Could not find version in pyproject.toml")
    return match.group(1)


def bump_version(current: str, bump_type: str) -> str:
    """Bump version according to semantic versioning."""
    major, minor, patch = map(int, current.split("."))
    
    if bump_type == "major":
        return f"{major + 1}.0.0"
    elif bump_type == "minor":
        return f"{major}.{minor + 1}.0"
    elif bump_type == "patch":
        return f"{major}.{minor}.{patch + 1}"
    else:
        raise ValueError(f"Invalid bump type: {bump_type}")


def update_pyproject(pyproject_path: Path, new_version: str) -> None:
    """Update version in pyproject.toml."""
    content = pyproject_path.read_text()
    content = re.sub(
        r'^version\s*=\s*"[^"]+"',
        f'version = "{new_version}"',
        content,
        flags=re.MULTILINE
    )
    pyproject_path.write_text(content)
    print(f"✅ Updated pyproject.toml to v{new_version}")


def create_git_tag(version: str, dry_run: bool = False) -> None:
    """Create and push git tag for the version."""
    tag = f"v{version}"
    
    if dry_run:
        print(f"🔍 DRY-RUN: Would create tag {tag}")
        return
    
    subprocess.run(["git", "tag", "-a", tag, "-m", f"Release version {version}"], check=True)
    print(f"✅ Created tag {tag}")
    
    subprocess.run(["git", "push", "origin", tag], check=True)
    print(f"✅ Pushed tag {tag} to origin")


def main():
    parser = argparse.ArgumentParser(description="Bump version and create git tag")
    parser.add_argument("bump_type", nargs="?", choices=["major", "minor", "patch"])
    parser.add_argument("--set", type=str, help="Set specific version")
    parser.add_argument("--dry-run", action="store_true")
    parser.add_argument("--no-tag", action="store_true")
    args = parser.parse_args()
    
    if not args.bump_type and not args.set:
        parser.error("Must specify either bump_type or --set")
    
    repo_root = Path(__file__).parent.parent
    pyproject_path = repo_root / "pyproject.toml"
    
    current_version = get_current_version(pyproject_path)
    print(f"📌 Current version: {current_version}")
    
    new_version = args.set if args.set else bump_version(current_version, args.bump_type)
    print(f"🎯 New version: {new_version}")
    
    if args.dry_run:
        print("\n🔍 DRY-RUN MODE")
        return 0
    
    response = input("\n❓ Proceed? (y/N): ")
    if response.lower() != 'y':
        print("❌ Aborted")
        return 1
    
    update_pyproject(pyproject_path, new_version)
    subprocess.run(["git", "add", str(pyproject_path)], check=True)
    subprocess.run(["git", "commit", "-m", f"chore: Bump version to v{new_version}"], check=True)
    
    if not args.no_tag:
        create_git_tag(new_version, dry_run=args.dry_run)
    
    print("\n🎉 Version bump complete!")
    return 0


if __name__ == "__main__":
    sys.exit(main())

