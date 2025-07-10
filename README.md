# Lundi

A modern Flutter application designed to help users manage their trips

![Lundi Logo](packages/shared/lib/images/lundi_logo.png)

## Overview

Lundi is a feature-rich mobile application that combines task management with intelligent assistance to help users organize their road trips in easy way.

## Key Features

- **Smart Assistant**: AI-powered help for better task management (TBD)
- **Authentication**: Secure user authentication system (Google Sign-In, Initial implementation)
- **Home Dashboard**: Overview of your trips
- **Planning Tools**: Comprehensive planning features
- **Task Editor**: Intuitive trip editing

## Platform Support

- iOS
- Android

## Getting Started

1. Ensure you have Flutter installed on your machine
2. Clone this repository
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app

# App uses melos for managing monorepo packages so you can use commands:
```bash
    melos run watch_all
```
```bash
    melos run build_all
```
```bash
    melos run upgrade_all
```

## Project Structure

This project follows a modular architecture with feature-based packages:

- `app`: Main application package
- `feature_assistant`: Smart assistant functionality
- `feature_auth`: Authentication system
- `feature_home`: Home screen and dashboard
- `feature_plan`: Planning and scheduling
- `feature_edit`: Task editing capabilities
- `shared`: Shared utilities and components
- `widgets`: Reusable UI components

## License

This project is proprietary and confidential.
