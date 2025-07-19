# Lesson 13: Custom Widgets and Layout Management

This lesson focuses on creating custom widgets and managing layouts in Flutter. The homework assignment demonstrates the use of containers, custom widgets, layout management, and interactive UI elements.

## Homework Assignment

### Task Overview
Create an interactive application with three custom containers that demonstrate different layout techniques, text alignment, and user interaction.

### Implementation Details

#### Subtask 1: Basic Container Creation
- **File**: `homework_13_screen.dart`
- **Container Properties**:
  - Width: 300 pixels
  - Height: 150 pixels
  - Background color: Blue
  - Border radius: 16 pixels
  - Centered on screen

#### Subtask 2: Text and Icons Integration
- **Text Content**: "Привіт, Flutter!"
- **Text Styling**:
  - Color: White
  - Font size: 20
  - Font weight: Bold
  - Alignment: Right bottom corner
- **Icons**: Two star icons (left and right of text)
- **Spacing**: 10px between text and icons
- **Padding**: 10px for the entire text/icon block

#### Subtask 3: Column Layout with Multiple Containers
- **Layout**: Column with 3 containers
- **Spacing**: 8px vertical spacing between containers
- **Colors**:
  - Container 1: Blue
  - Container 2: Green
  - Container 3: Red

#### Subtask 4: Advanced Alignment and Sizing
- **Text Alignment per Container**:
  - Container 1: Top-left corner
  - Container 2: Center
  - Container 3: Bottom-right corner
- **Sizing**: First container expands to fill available vertical space

#### Subtask 5: Interactive Features
- **Tap Interaction**: Containers respond to user taps
- **Dynamic Sizing**: Selected container expands
- **Visual Feedback**: Interactive UI with state management

#### Additional Interactive Features (Bonus Implementation)
- **Clickable Containers**: All containers are interactive and respond to user taps
- **Dynamic Expansion**: When a container is tapped, it expands to fill all available vertical space
- **Toggle Functionality**: Tapping the same container again returns all containers to equal size
- **State Management**: Uses StatefulWidget to manage container expansion states
- **Smooth Transitions**: Visual feedback with dynamic layout changes

## File Structure

```
lesson_13/
├── README.md                    # This file
├── custom_box.dart             # Custom container widget
└── homework_13_screen.dart     # Main screen implementation
```

## Key Learning Objectives

### Widget Composition
- Creating reusable custom widgets
- Parameter passing between widgets
- Widget hierarchy and composition

### Layout Management
- Column and Row widgets
- Expanded widget for flexible sizing
- Alignment and positioning
- Spacing and padding management

### State Management
- StatefulWidget implementation
- State updates and UI rebuilding
- Interactive element handling

### UI Design
- Color schemes and theming
- Typography and text styling
- Icon integration
- Border radius and visual effects

## Technical Implementation

### CustomBox Widget (`custom_box.dart`)
```dart
class CustomBox extends StatelessWidget {
  const CustomBox({
    required this.color, 
    required this.onTap, 
    required this.textAlignment,
    super.key
  });
  
  final Color color;
  final void Function() onTap;
  final Alignment textAlignment;
}
```

**Features**:
- Configurable color, tap handler, and text alignment
- Gesture detection with onTap functionality
- Responsive layout with Align and Row widgets
- Star icons with proper spacing
- Ukrainian text with custom styling

### Lesson13 Screen (`homework_13_screen.dart`)
```dart
class Lesson13 extends StatefulWidget {
  // StatefulWidget for interactive functionality
}
```

**Features**:
- Three containers with different colors and alignments
- Dynamic container expansion based on selection
- Proper spacing and layout management
- Interactive UI with visual feedback
- **Bonus**: Clickable containers with expansion/collapse functionality
- **Bonus**: Toggle behavior - tap same container to reset all sizes

## Learning Outcomes

By completing this lesson, you will understand:

1. **Custom Widget Creation**: How to build reusable UI components
2. **Layout Fundamentals**: Column, Row, Expanded, and Align widgets
3. **State Management**: StatefulWidget lifecycle and state updates
4. **User Interaction**: Gesture detection and event handling
5. **UI Design Principles**: Spacing, alignment, and visual hierarchy
6. **Code Organization**: Feature-based project structure
7. **Advanced Interactions**: Dynamic layout changes and toggle functionality

## Running the Application

1. Navigate to the project root
2. Run `flutter pub get` to install dependencies
3. Execute `flutter run` to start the application
4. Navigate to "Lesson 13" from the main menu
5. Interact with the containers by tapping them



## Additional Notes

This lesson demonstrates the power of Flutter's widget system and how to create interactive, responsive user interfaces. The implementation showcases best practices for widget composition, state management, and code organization. 