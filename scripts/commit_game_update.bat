@echo off
REM SkyDB Game Update Commit Script (Windows Batch)
REM This script runs the Python commit script

cd /d "%~dp0.."
python scripts\commit_game_update.py %*
pause