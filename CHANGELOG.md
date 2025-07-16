# Changelog

This document tracks the learning progress and changes made during the Flutter learning journey.

## [Unreleased]

### Added
- Lesson 13: Custom Widgets and Layout Management
  - Custom container widget with configurable properties
  - Different text alignment options (topLeft, center, bottomRight)
  - Gesture detection with onTap functionality
  - Column layout with proper spacing (8px between containers)
  - Expanded widget for flexible container sizing
  - Icon integration with proper spacing (10px between elements)
  - Padding and margin management
  - Color customization for multiple containers
  - StatefulWidget implementation for dynamic UI updates
  - Navigation between screens using named routes
- Custom Box Widget (`custom_box.dart`)
  - Reusable widget with color, onTap, and textAlignment parameters
  - Proper widget composition with GestureDetector
  - Responsive layout with Align and Row widgets
  - Star icons with amber color and proper sizing
  - Ukrainian text "Привіт, Flutter!" with white color and bold styling
  - Border radius of 16px for modern appearance
  - Container dimensions: 300x150 pixels
- Homework 13 Screen (`homework_13_screen.dart`)
  - StatefulWidget with tap interaction logic
  - Three containers with different colors (blue, green, red)
  - Dynamic container expansion based on selection
  - Proper spacing and alignment management
  - Interactive UI with visual feedback
- Main Application (`main.dart`)
  - MaterialApp configuration with theme setup
  - Named route navigation system
  - Home page with lesson navigation buttons
  - Deep purple color scheme
- Project Structure
  - Feature-based organization in `lib/features/homeworks/`
  - Lesson-specific folders for better code organization
  - Platform-specific configurations (Android, iOS, Web)
  - Test directory for unit and widget tests
- Enhanced README.md with comprehensive project documentation
- Analysis options for code quality and linting

### Changed
- **Code Organization**: Implemented feature-based folder structure
  - Organized code into logical feature modules
  - Separated homework assignments by lesson
  - Improved code maintainability and scalability
- **Widget Architecture**: Created reusable custom widgets
  - Extracted common UI patterns into separate components
  - Implemented proper parameter passing between widgets
  - Enhanced code reusability and modularity
- **Layout Management**: Improved container positioning and spacing
  - Added proper spacing between UI elements
  - Implemented flexible layout with Expanded widgets
  - Enhanced visual hierarchy and user experience
- **Navigation System**: Implemented named route navigation
  - Added route configuration in MaterialApp
  - Created navigation buttons for lesson access
  - Improved app navigation structure

### Learning Progress
- Started Flutter framework fundamentals
- Covered widget basics and composition
- Explored layout widgets (Container, Column, Row, Expanded)
- Studied custom widget creation and parameter passing
- Learned about gesture detection and user interaction
- Practiced state management with StatefulWidget
- **Lesson 13**: Mastered custom widgets, layout management, and UI composition
- Configured development environment with proper project structure
- Learned about navigation and routing in Flutter
- Explored platform-specific configurations

## [1.0.0] - Initial Setup

### Added
- Project initialization with Flutter CLI
- Basic Flutter application structure
- Platform-specific configurations (Android, iOS, Web, Desktop)
- README.md with course information and project structure
- Analysis options for code quality and linting
- Git configuration and version control setup

### Course Information
- **Course**: Flutter Mobile Developer at r_d (Robot Dreams)
- **Instructor**: Pavlo Avdonin (@OnlyTarg)
- **Focus**: Flutter framework and mobile development 