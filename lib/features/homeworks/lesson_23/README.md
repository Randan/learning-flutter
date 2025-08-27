# Lesson 23: Error Handling Homework

## Implementation Details

This homework demonstrates proper error handling in Flutter using BLoC pattern with the following components:

### Architecture Setup
- **Global BlocProvider**: `UserProfileCubit` is provided globally through `MultiBlocProvider` in `main.dart`
- **Repository Pattern**: Clean separation between data layer and business logic
- **BLoC Pattern**: Proper state management using Cubit

### 2. Custom Error Class
- **File**: `lib/features/homeworks/lesson_23/data/repository/entity/custom_server_error.dart`
- **Purpose**: Custom exception class for server-specific errors
- **Features**: 
  - Extends `Exception` class
  - Customizable error message
  - Proper `toString()` implementation

### 3. Repository Error Handling
- **File**: `lib/features/homeworks/lesson_23/data/repository/fake_user_repository.dart`
- **Purpose**: Catches server errors and converts them to custom errors
- **Implementation**:
  - Wraps the original exception in a try-catch block
  - Converts `Exception('Server is temporarily unavailable')` to `CustomServerError`
  - Maintains the same error message for consistency

### 4. State Management
- **File**: `lib/features/homeworks/lesson_23/presentation/cubit/user_profile_state.dart`
- **New States Added**:
  - `UserProfileCustomServerError`: For handling custom server errors
  - `UserProfileGeneralError`: For handling other types of errors
- **Purpose**: Provides specific error states for different error types

### 5. Cubit Error Handling
- **File**: `lib/features/homeworks/lesson_23/presentation/cubit/user_profile_cubit.dart`
- **Implementation**:
  - Wraps repository call in try-catch block
  - Specific handling for `CustomServerError` using `on CustomServerError catch`
  - General error handling for other exceptions
  - Emits appropriate error states based on error type

### 6. UI Error Display
- **File**: `lib/features/homeworks/lesson_23/presentation/ui/screens/user_profile_homework_screen.dart`
- **Features**:
  - **Custom Server Error Widget**: Red-themed error display with retry button
  - **General Error Widget**: Orange-themed error display with retry button
  - **Retry Functionality**: Both error widgets include "Спробувати знову" button
  - **Auto-loading**: Profile loads automatically when screen initializes

## Error Flow

1. **Repository Level**: `FakeUserRepository` throws `Exception('Server is temporarily unavailable')`
2. **Repository Error Handling**: Exception is caught and converted to `CustomServerError`
3. **Cubit Level**: `UserProfileCubit` catches the `CustomServerError` and emits `UserProfileCustomServerError`
4. **UI Level**: Screen displays custom error widget with retry button
5. **Retry**: User can click retry button to reload profile

## Key Features

- ✅ Custom error class implementation
- ✅ Repository-level error conversion
- ✅ Specific error handling for `CustomServerError`
- ✅ General error handling for other exceptions
- ✅ UI error display with retry functionality
- ✅ Proper error state management
- ✅ Clean separation of concerns
- ✅ Global BlocProvider setup in main.dart

## Testing

To test the error handling:
1. Navigate to Lesson 23: Error Handling
2. First load will show server error (red error widget)
3. Click "Спробувати знову" button
4. Profile will load successfully on second attempt
