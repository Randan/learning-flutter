# Lesson 14: Rating System Implementation

## Overview

This lesson focuses on implementing a comprehensive rating system for a store visit evaluation. The application allows users to rate different departments and provide detailed feedback.

## Features

### Main Components

1. **Rating Screen** (`homework_14_screen.dart`)
   - Overall store rating with 5-star system
   - Department-specific ratings
   - Global feedback section
   - Modern UI with blur effects and shadows

2. **Rating Card** (`rating_card.dart`)
   - Individual department rating interface
   - Like/Dislike buttons for service and assortment
   - Conditional feedback text field
   - Reusable component design

3. **Data Models** (`models.dart`)
   - `Department` class with service, assortment, and feedback properties
   - `RatingState` class for managing overall application state
   - JSON serialization support
   - CopyWith method for immutable updates

4. **Custom Icons** (`icons.dart`)
   - `RatingStarIcon` for 5-star rating system
   - `LikeIcon` and `DislikeIcon` for department ratings
   - SVG-based icons with customizable colors
   - Proper semantic labels for accessibility

### Key Features

- **Interactive Rating System**: Users can rate the overall store experience using a 5-star system
- **Department-Specific Ratings**: Each department can be rated for service and assortment quality
- **Dynamic Feedback Fields**: Text fields appear when users provide ratings
- **State Management**: Proper state management using StatefulWidget
- **Modern UI Design**: Glassmorphism effects, shadows, and rounded corners
- **Responsive Layout**: Adapts to different screen sizes
- **Data Persistence**: JSON serialization for data storage and transmission

### UI/UX Elements

- **Glassmorphism AppBar**: Blurred background with transparent overlay
- **Card-based Layout**: Clean, organized presentation of rating options
- **Color-coded Feedback**: Visual indicators for selected ratings
- **Smooth Interactions**: Responsive button states and animations
- **Accessibility**: Proper semantic labels and color contrast

## Technical Implementation

### State Management
- Uses `StatefulWidget` for managing rating state
- Individual state updates for each department
- Global state for overall rating and feedback

### Widget Architecture
- Modular component design with reusable widgets
- Proper separation of concerns
- Clean parameter passing between components

### Data Flow
1. User interactions trigger state updates
2. State changes reflect in UI immediately
3. Data is serialized to JSON for submission
4. Success feedback is shown to user

## Learning Objectives

- **Complex State Management**: Managing multiple related state variables
- **Custom Widgets**: Creating reusable UI components
- **Conditional Rendering**: Showing/hiding UI elements based on state
- **JSON Serialization**: Converting objects to/from JSON format
- **Modern UI Design**: Implementing contemporary design patterns
- **User Experience**: Creating intuitive and responsive interfaces

## File Structure

```
lesson_14/
├── homework_14_screen.dart    # Main rating screen
├── rating_card.dart          # Department rating component
├── models.dart               # Data models and state management
├── icons.dart                # Custom SVG icons
└── README.md                 # This documentation
```

## Usage

The rating system allows users to:
1. Rate the overall store experience (1-5 stars)
2. Rate each department's service (like/dislike)
3. Rate each department's assortment (like/dislike)
4. Provide detailed feedback for departments and overall experience
5. Submit all ratings with a single button press

This implementation demonstrates advanced Flutter concepts including complex state management, custom widgets, and modern UI design patterns. 