class TFirebaseAuthException implements Exception {
  final String message;

  TFirebaseAuthException(this.message);

  @override
  String toString() => 'FirebaseAuthException: $message';
}

class TFirebaseException implements Exception {
  final String message;

  TFirebaseException(this.message);

  @override
  String toString() => 'FirebaseException: $message';
}

class TFormatException implements Exception {
  final String message;

  TFormatException([this.message = 'Invalid format']);

  @override
  String toString() => 'FormatException: $message';
}

class TPlatformException implements Exception {
  final String message;

  TPlatformException(this.message);

  @override
  String toString() => 'PlatformException: $message';
}
