# Changelog

This document tracks the learning progress and changes made during the Flutter learning journey.

## [Unreleased]

### Added
- **Advanced Navigation System**: Implemented GoRouter for modern routing
  - Replaced traditional Navigator with GoRouter for declarative routing
  - Centralized route configuration in `app_router.dart`
  - Nested route structure for better navigation management
  - Route-based navigation with proper path handling
  - Updated MaterialApp to use MaterialApp.router with routerConfig
- **Router Configuration** (`router/app_router.dart`)
  - GoRouter setup with nested route structure
  - Route definitions for home page and lesson screens
  - Proper import handling for all lesson components
  - Clean separation of routing logic from UI components
- **Updated Main Application** (`main.dart`)
  - MaterialApp.router configuration with routerConfig
  - Deep orange color scheme for modern appearance
  - Disabled debug banner for cleaner UI
  - Proper router integration with app structure
- **Enhanced Home Page** (`home_page.dart`)
  - Updated navigation using GoRouter context.go() method
  - Modern AppBar with theme-based styling
  - Clear lesson navigation buttons with proper routing
  - Improved UI layout with better spacing and typography
- **Dependencies Update**
  - Added go_router: ^16.0.0 for advanced navigation
  - Maintained flutter_svg: ^2.2.0 for SVG support
  - Updated cupertino_icons: ^1.0.8 for latest icon support
- Lesson 14: Rating System Implementation
  - Comprehensive store visit rating system
  - 5-star overall rating with interactive star icons
  - Department-specific ratings for service and assortment
  - Like/Dislike rating system with custom SVG icons
  - Dynamic feedback text fields that appear based on user interaction
  - Modern UI design with glassmorphism effects and shadows
  - JSON serialization for data persistence and transmission
  - StatefulWidget implementation for complex state management
  - Modular component architecture with reusable widgets
- Rating Screen (`homework_14_screen.dart`)
  - Glassmorphism AppBar with blur effects
  - Interactive 5-star rating system
  - Department rating cards with like/dislike options
  - Global feedback section with text input
  - Success notification with SnackBar
  - Responsive layout with proper spacing and shadows
- Rating Card Component (`rating_card.dart`)
  - Reusable department rating interface
  - Like/Dislike buttons for service and assortment evaluation
  - Conditional feedback text field rendering
  - Modern card design with rounded corners and shadows
  - Proper state management and callback handling
- Data Models (`models.dart`)
  - `Department` class with service, assortment, and feedback properties
  - `RatingState` class for managing overall application state
  - JSON serialization and deserialization support
  - CopyWith method for immutable state updates
  - Factory constructors for data conversion
- Custom Icons (`icons.dart`)
  - `RatingStarIcon` for 5-star rating system with selection states
  - `LikeIcon` and `DislikeIcon` for department ratings
  - SVG-based icons with customizable colors and semantic labels
  - Proper accessibility support with ARIA labels
  - Shadow effects for selected rating stars
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
  - Navigation between screens using GoRouter
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
- Project Structure
  - Feature-based organization in `lib/features/homeworks/`
  - Router configuration in dedicated `lib/router/` directory
  - Lesson-specific folders for better code organization
  - Platform-specific configurations (Android, iOS, Web)
  - Test directory for unit and widget tests
- Enhanced README.md with comprehensive project documentation
- Analysis options for code quality and linting

### Changed
- **Navigation System**: Migrated from traditional Navigator to GoRouter
  - Replaced MaterialApp with MaterialApp.router
  - Updated navigation calls from Navigator.pushNamed to context.go()
  - Centralized routing configuration for better maintainability
  - Improved route structure with nested routes
- **Code Organization**: Implemented feature-based folder structure
  - Organized code into logical feature modules
  - Separated homework assignments by lesson
  - Added dedicated router directory for navigation logic
  - Improved code maintainability and scalability
- **Widget Architecture**: Created reusable custom widgets
  - Extracted common UI patterns into separate components
  - Implemented proper parameter passing between widgets
  - Enhanced code reusability and modularity
- **Layout Management**: Improved container positioning and spacing
  - Added proper spacing between UI elements
  - Implemented flexible layout with Expanded widgets
  - Enhanced visual hierarchy and user experience
- **Theme Configuration**: Updated to deep orange color scheme
  - Modern color palette for better visual appeal
  - Consistent theming across the application
  - Improved user interface aesthetics

### Learning Progress
- Started Flutter framework fundamentals
- Covered widget basics and composition
- Explored layout widgets (Container, Column, Row, Expanded)
- Studied custom widget creation and parameter passing
- Learned about gesture detection and user interaction
- Practiced state management with StatefulWidget
- **Lesson 13**: Mastered custom widgets, layout management, and UI composition
- **Lesson 14**: Implemented complex rating system with modern UI design
- **Navigation**: Learned advanced routing with GoRouter
- Configured development environment with proper project structure
- Learned about navigation and routing in Flutter with modern patterns
- Explored platform-specific configurations
- Advanced state management with multiple related variables
- JSON serialization for data persistence
- Modern UI patterns including glassmorphism and conditional rendering
- SVG icon integration and customization
- Modular component architecture and reusable widgets
- Declarative routing patterns and route configuration

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