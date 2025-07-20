# Learning Flutter

A project for learning Flutter framework as part of the **Flutter Mobile Developer** course at **r_d (Robot Dreams)** school.

## Course Information

- **Course**: Flutter Mobile Developer
- **School**: r_d (Robot Dreams)
- **Instructor**: [Pavlo Avdonin](https://github.com/OnlyTarg)

## Project Structure

This project contains various lessons and exercises for learning Flutter:

```
learning_flutter/
├── lib/                          # Main application code
│   ├── features/                 # Feature-based organization
│   │   └── homeworks/           # Homework assignments and exercises
│   │       ├── lesson_13/       # Custom Widgets and Layout
│   │       │   ├── custom_box.dart
│   │       │   ├── homework_13_screen.dart
│   │       │   └── README.md
│   │       └── lesson_14/       # Rating System Implementation
│   │           ├── homework_14_screen.dart
│   │           ├── rating_card.dart
│   │           ├── models.dart
│   │           ├── icons.dart
│   │           └── README.md
│   └── main.dart                # Application entry point
├── android/                     # Android platform-specific code
│   ├── app/
│   │   ├── build.gradle.kts
│   │   └── src/
│   │       ├── debug/
│   │       ├── main/
│   │       │   ├── java/
│   │       │   ├── kotlin/
│   │       │   └── res/
│   │       └── profile/
│   ├── build.gradle.kts
│   ├── gradle/
│   ├── gradle.properties
│   └── settings.gradle.kts
├── ios/                        # iOS platform-specific code
│   ├── Flutter/
│   ├── Runner/
│   │   ├── AppDelegate.swift
│   │   ├── Assets.xcassets/
│   │   ├── Base.lproj/
│   │   ├── Info.plist
│   │   └── Runner-Bridging-Header.h
│   ├── Runner.xcodeproj/
│   ├── Runner.xcworkspace/
│   └── RunnerTests/
├── linux/                      # Linux platform-specific code
│   ├── CMakeLists.txt
│   ├── flutter/
│   └── runner/
├── macos/                      # macOS platform-specific code
│   ├── Flutter/
│   ├── Runner/
│   │   ├── AppDelegate.swift
│   │   ├── Assets.xcassets/
│   │   ├── Base.lproj/
│   │   ├── Configs/
│   │   ├── Info.plist
│   │   └── MainFlutterWindow.swift
│   ├── Runner.xcodeproj/
│   ├── Runner.xcworkspace/
│   └── RunnerTests/
├── web/                        # Web platform-specific code
│   ├── favicon.png
│   ├── icons/
│   ├── index.html
│   └── manifest.json
├── windows/                    # Windows platform-specific code
│   ├── CMakeLists.txt
│   ├── flutter/
│   └── runner/
├── test/                       # Unit and widget tests
│   └── widget_test.dart
├── analysis_options.yaml       # Flutter analysis configuration
├── pubspec.yaml               # Project dependencies
├── pubspec.lock              # Locked dependency versions
├── CHANGELOG.md              # Project changelog
└── README.md                 # This file
```

## Getting Started

To run this project:

1. Make sure you have Flutter SDK installed
2. Clone this repository
3. Run `flutter pub get` to install dependencies
4. Execute the application with `flutter run`

## Learning Progress

This repository tracks my progress through the Flutter framework, covering:

- Widget basics and composition
- Layout widgets (Container, Column, Row, etc.)
- Custom widget creation
- State management
- Navigation and routing
- Platform-specific configurations
- And more...

## Recent Learning Topics

- **Rating Systems**: Implemented comprehensive rating system with 5-star and like/dislike options
- **Complex State Management**: Managed multiple related state variables across different components
- **JSON Serialization**: Converted objects to/from JSON format for data persistence
- **Modern UI Design**: Implemented glassmorphism effects, shadows, and conditional rendering
- **SVG Icon Integration**: Created custom SVG icons with proper color customization
- **Modular Architecture**: Built reusable components with clean separation of concerns
- **Custom Widgets**: Created reusable custom widgets with proper parameter passing
- **Layout Management**: Learned about Column, Row, and Container widgets for responsive layouts
- **Widget Alignment**: Explored different alignment options for positioning content within containers
- **Gesture Detection**: Implemented tap gestures for interactive widgets
- **State Management**: Practiced StatefulWidget for dynamic UI updates
- **Code Organization**: Structured code using feature-based organization pattern

## Code Quality

All code follows Flutter best practices with proper linting configuration. The project uses `analysis_options.yaml` to ensure code quality and consistency.

## License

This project is part of an educational course and is for learning purposes.
