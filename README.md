# Learning Flutter

A project for learning Flutter framework as part of the **Flutter Mobile Developer** course at **r_d (Robot Dreams)** school.

## Course Information

- **Course**: Flutter Mobile Developer
- **School**: r_d (Robot Dreams)
- **Instructor**: [Pavlo Avdonin](https://github.com/OnlyTarg)

## Project Structure

This project follows **Feature-First Architecture** with **Two-Layer Design** for optimal code organization and maintainability:

```
learning_flutter/
├── lib/                          # Main application code
│   ├── features/                 # Feature-based organization (Feature-First)
│   │   ├── custom_widgets/       # Lesson 13: Custom Widgets and Layout
│   │   │   └── presentation/
│   │   │       └── ui/
│   │   │           ├── screens/
│   │   │           │   └── custom_widgets_screen.dart
│   │   │           └── widgets/
│   │   │               └── custom_box.dart
│   │   ├── rating_system/        # Lesson 14: Rating System Implementation
│   │   │   └── presentation/
│   │   │       └── ui/
│   │   │           ├── screens/
│   │   │           │   └── rating_system_screen.dart
│   │   │           └── widgets/
│   │   │               ├── rating_card.dart
│   │   │               ├── models.dart
│   │   │               └── icons.dart
│   │   ├── counter/              # Lesson 19: State Management with Bloc and Cubit
│   │   │   └── presentation/
│   │   │       ├── bloc/
│   │   │       │   ├── counter_bloc.dart
│   │   │       │   ├── counter_cubit.dart
│   │   │       │   ├── counter_event.dart
│   │   │       │   ├── counter_state.dart
│   │   │       │   └── counter_cubit_state.dart
│   │   │       └── ui/
│   │   │           └── screens/
│   │   │               ├── counter_bloc_screen.dart
│   │   │               └── counter_cubit_screen.dart
│   │   ├── rate_app/             # Lesson 20: Rate App with BLoC Architecture
│   │   │   └── presentation/
│   │   │       ├── bloc/
│   │   │       │   ├── rate_app_bloc.dart
│   │   │       │   ├── rate_app_cubit.dart
│   │   │       │   ├── rate_app_event.dart
│   │   │       │   ├── rate_app_state.dart
│   │   │       │   └── constants.dart
│   │   │       └── ui/
│   │   │           └── screens/
│   │   │               ├── rate_app_bloc_screen.dart
│   │   │               └── rate_app_cubit_screen.dart
│   │   ├── animated_ball/        # Lesson 22: Advanced Animation with AnimationController
│   │   │   └── presentation/
│   │   │       └── ui/
│   │   │           └── screens/
│   │   │               └── animated_ball_screen.dart
│   │   ├── user_profile/         # Lesson 23: Error Handling with BLoC Pattern
│   │   │   ├── presentation/
│   │   │   │   ├── bloc/
│   │   │   │   │   ├── user_profile_cubit.dart
│   │   │   │   │   └── user_profile_state.dart
│   │   │   │   └── ui/
│   │   │   │       └── screens/
│   │   │   │           └── user_profile_homework_screen.dart
│   │   │   └── data/
│   │   │       ├── repositories/
│   │   │       │   └── fake_user_repository.dart
│   │   │       └── data_source/
│   │   │           └── entities/
│   │   │               ├── user_entity.dart
│   │   │               └── custom_server_error.dart
│   │   └── network_api/          # Lesson 26: Network API & DTO Integration
│   │       ├── presentation/
│   │       │   └── screens/
│   │       │       └── network_api_screen.dart
│   │       └── data/
│   │           ├── data_source/
│   │           │   └── cheque_remote_data_source.dart
│   │           ├── dto/
│   │           │   └── cheque_dto.dart
│   │           ├── entity/
│   │           │   └── cheque_entity.dart
│   │           ├── encode_decode/
│   │           │   ├── cheque_decoder.dart
│   │           │   └── cheque_encoder.dart
│   │           └── repositories/
│   │               └── cheque_repository.dart
│   ├── shared/                   # Shared components across features
│   │   └── widgets/
│   │       ├── custom_snackbar.dart # Custom snackbar with 4 states
│   │       ├── feature_card.dart    # Reusable feature navigation card
│   │       └── widgets.dart         # Widget exports
│   ├── router/                   # Navigation and routing
│   │   ├── app_router.dart       # GoRouter configuration
│   │   └── screen_names.dart     # Route name definitions
│   ├── home_page.dart            # Main home page with lesson navigation
│   └── main.dart                 # Application entry point
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

## Architecture

This project implements **Feature-First Architecture** with **Two-Layer Design**:

### 🏗️ Feature-First Organization
- **Features are isolated** - each feature contains all related code
- **Easy navigation** - all feature code is in one place
- **Team scalability** - different developers can work on different features
- **Independent testing** - each feature can be tested separately

### 📱 Two-Layer Architecture
Each feature follows a clean two-layer structure:

#### **Presentation Layer**
- `presentation/bloc/` - BLoC/Cubit state management
- `presentation/ui/` - Screens and widgets

#### **Data Layer** (when needed)
- `data/repositories/` - Data access abstraction
- `data/data_source/` - Data sources and entities

### 🎯 Benefits
- ✅ **Maintainability** - Easy to find and modify code
- ✅ **Scalability** - Simple to add new features
- ✅ **Testability** - Each layer can be tested independently
- ✅ **Team Collaboration** - Clear separation of concerns
- ✅ **Code Reusability** - Shared components in `/shared/`

## Getting Started

To run this project:

1. Make sure you have Flutter SDK installed
2. Clone this repository
3. Run `flutter pub get` to install dependencies
4. Execute the application with `flutter run`

## Dependencies

The project uses the following key dependencies:

- **go_router**: ^16.0.0 - Advanced routing and navigation
- **flutter_bloc**: ^8.1.4 - State management with Bloc pattern
- **http**: ^1.1.0 - HTTP requests for network API integration
- **flutter_svg**: ^2.2.0 - SVG image support
- **cupertino_icons**: ^1.0.8 - iOS-style icons

## Learning Progress

This repository tracks my progress through the Flutter framework, covering:

- Widget basics and composition
- Layout widgets (Container, Column, Row, etc.)
- Custom widget creation
- State management with Bloc and Cubit patterns
- Navigation and routing with GoRouter
- Network API integration and data handling
- DTO and Entity patterns for data modeling
- HTTP requests and JSON parsing
- Platform-specific configurations
- And more...

## Recent Learning Topics

- **🌐 Lesson 26: Network API & DTO Integration**: Complete network data handling system
  - Comprehensive network API integration with HTTP requests
  - DTO (Data Transfer Object) pattern for raw JSON data handling
  - Entity pattern for domain-specific data models
  - Repository pattern for data access abstraction
  - Automatic data loading and pull-to-refresh functionality
  - Modern UI with English language support and error handling
  - Clean two-layer architecture following Feature-First principles
- **🏗️ Feature-First Architecture Refactoring**: Complete project restructuring
  - Migrated from lesson-based to feature-based organization
  - Implemented two-layer architecture (Presentation + Data)
  - Reorganized all 7 features: custom_widgets, rating_system, counter, rate_app, animated_ball, user_profile, network_api
  - Updated all import statements and dependencies
  - Created shared components directory for reusable widgets
  - Improved code maintainability and team collaboration
- **🎨 Enhanced UI Components**: Improved shared widget system
  - Created `FeatureCard` widget for consistent feature navigation
  - Implemented conditional styling based on interaction state
  - Added proper null safety handling for optional callbacks
  - Enhanced visual feedback with elevation and icon states
- **Lesson 23: Error Handling with BLoC Pattern**: Implemented comprehensive error handling system
  - Custom error class `CustomServerError` for server-specific error handling
  - Repository-level error conversion from generic exceptions to custom errors
  - Specific error handling for `CustomServerError` vs general error handling
  - UI error display with retry functionality and different error themes
  - Global BlocProvider setup in main.dart for application-wide state access
  - Proper error state management with sealed classes and pattern matching
- **Advanced Animation with AnimationController**: Implemented complex multi-stage animation system
  - Multi-controller animation architecture with position and rotation controllers
  - Complex animation sequence: up movement, pause, down movement with bounce
  - Continuous rotation throughout the entire animation duration
  - Proper animation lifecycle management with TickerProviderStateMixin
  - Gesture protection during animation execution
  - Mathematical constants integration for precise rotation calculations
- **BLoC Architecture Implementation**: Built comprehensive rate app with proper BLoC pattern
  - Event-driven architecture with RateAppEvent classes
  - State management with automatic isDirty calculation
  - Private _rateCached field with controlled updates
  - Proper async event handling with await patterns
  - Context safety checks before UI operations
- **Global Widget System**: Created reusable custom snackbar widget
  - 4-state snackbar (success, warning, error, info) with appropriate colors and icons
  - Global accessibility throughout the application
  - Material Design compliance with floating behavior
  - Customizable duration and action buttons
- **Advanced State Management**: Implemented sophisticated state logic
  - Automatic isDirty calculation based on rate vs rateCached comparison
  - Private fields with controlled access through getters
  - State immutability with proper copyWith methods
  - Submit rating workflow with state updates
- **State Management with Bloc Pattern**: Implemented Bloc and Cubit for counter management
  - Bloc implementation with events, states, and business logic
  - Cubit implementation for simpler state management
  - MultiBlocProvider setup for global state access
  - Real-time state synchronization across UI components
- **Advanced Navigation**: Implemented GoRouter for declarative routing
- **Modern Routing**: Replaced traditional Navigator with GoRouter for better navigation management
- **Route Configuration**: Centralized routing configuration in app_router.dart
- **Navigation Patterns**: Learned about nested routes and route-based navigation
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
