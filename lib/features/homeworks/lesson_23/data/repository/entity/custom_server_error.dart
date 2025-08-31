class CustomServerError implements Exception {
  CustomServerError({this.message = 'Server error occurred'});

  final String message;

  @override
  String toString() => 'CustomServerError: $message';
}
