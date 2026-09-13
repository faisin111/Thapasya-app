# Agent Instructions & Project Guidelines

This file contains specific rules and guidelines for AI agents working on this project. Please adhere to the following principles:

## 1. UI Strings & Text Content
- **Always use constants for text**: Never hardcode string literals directly in the UI widgets.
- **Location of constants**: All text constants must be stored in the `lib/core/constants/` directory.
- **Modularity**: Use separate files for separate feature modules (e.g., `auth_constants.dart` for Auth views, `profile_constants.dart` for Profile views, etc.). Do not lump all constants into a single file.
