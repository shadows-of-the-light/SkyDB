"""
SkyDB Game Update Commit Script

This script reads version and build information from the game files
and commits the changes with the format: "GAME UPDATE {version} {build}"

Usage:
    python commit_game_update.py [--dry-run]

Options:
    --dry-run    Show what would be committed without actually committing
"""

import os
import sys
import subprocess
import argparse
from pathlib import Path


def get_repo_root():
    """Find the repository root directory."""
    current_dir = Path(__file__).resolve().parent
    # Go up one level from scripts/ to get to repo root
    return current_dir.parent


def extract_version_build(appinfo_path):
    """
    Extract version and build information from AppInfo.tgc file.
    
    Based on the current format:
    Line 5: version (e.g., "0.30.9")
    Line 6: build (e.g., "349947")
    """
    try:
        with open(appinfo_path, 'r', encoding='utf-8') as f:
            lines = f.read().strip().split('\n')
        
        if len(lines) < 6:
            raise ValueError(f"AppInfo.tgc has insufficient lines ({len(lines)}). Expected at least 6.")
        
        version = lines[4].strip()  # 5th line (0-indexed)
        build = lines[5].strip()    # 6th line (0-indexed)
        
        if not version or not build:
            raise ValueError("Version or build information is empty.")
        
        return version, build
    
    except Exception as e:
        print(f"Error reading version/build info: {e}")
        return None, None


def run_git_command(args, cwd=None):
    """Run a git command and return the result."""
    try:
        result = subprocess.run(
            ['git'] + args,
            cwd=cwd,
            capture_output=True,
            text=True,
            check=True
        )
        return result.stdout.strip()
    except subprocess.CalledProcessError as e:
        print(f"Git command failed: {e}")
        print(f"Error output: {e.stderr}")
        return None


def check_for_changes(repo_root):
    """Check if there are any changes to commit."""
    # Check for staged changes
    staged = run_git_command(['diff', '--cached', '--name-only'], cwd=repo_root)
    
    # Check for unstaged changes in data/ folder
    unstaged = run_git_command(['diff', '--name-only', 'data/'], cwd=repo_root)
    
    # Check for untracked files in data/ folder
    untracked = run_git_command(['ls-files', '--others', '--exclude-standard', 'data/'], cwd=repo_root)
    
    return bool(staged or unstaged or untracked)


def stage_data_changes(repo_root):
    """Stage all changes in the data/ folder."""
    print("Staging changes in data/ folder...")
    result = run_git_command(['add', 'data/'], cwd=repo_root)
    return result is not None


def commit_changes(repo_root, version, build, dry_run=False):
    """Commit the staged changes with the specified message format."""
    commit_message = f"GAME UPDATE {version} {build}"
    
    if dry_run:
        print(f"[DRY RUN] Would commit with message: '{commit_message}'")
        return True
    
    print(f"Committing changes with message: '{commit_message}'")
    result = run_git_command(['commit', '-m', commit_message], cwd=repo_root)
    return result is not None


def main():
    parser = argparse.ArgumentParser(description='Commit game update changes')
    parser.add_argument('--dry-run', action='store_true', 
                       help='Show what would be committed without actually committing')
    args = parser.parse_args()
    
    # Get repository root
    repo_root = get_repo_root()
    print(f"Repository root: {repo_root}")
    
    # Path to AppInfo.tgc
    appinfo_path = repo_root / 'data' / 'AppInfo.tgc'
    
    if not appinfo_path.exists():
        print(f"Error: AppInfo.tgc not found at {appinfo_path}")
        sys.exit(1)
    
    # Extract version and build info
    print("Extracting version and build information...")
    version, build = extract_version_build(appinfo_path)
    
    if not version or not build:
        print("Failed to extract version and build information.")
        sys.exit(1)
    
    print(f"Detected version: {version}")
    print(f"Detected build: {build}")
    
    # Check if we're in a git repository
    if not (repo_root / '.git').exists():
        print("Error: Not in a git repository.")
        sys.exit(1)
    
    # Check for changes
    if not check_for_changes(repo_root):
        print("No changes detected in the repository.")
        sys.exit(0)
    
    # Stage changes in data/ folder
    if not args.dry_run:
        if not stage_data_changes(repo_root):
            print("Failed to stage changes.")
            sys.exit(1)
    else:
        print("[DRY RUN] Would stage changes in data/ folder")
    
    # Commit the changes
    if commit_changes(repo_root, version, build, args.dry_run):
        if not args.dry_run:
            print("Successfully committed game update!")
        else:
            print("[DRY RUN] Commit would succeed")
    else:
        print("Failed to commit changes.")
        sys.exit(1)


if __name__ == '__main__':
    main()