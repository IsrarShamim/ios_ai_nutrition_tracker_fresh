import 'dart:math';

String generateRandomDigits(int length) {
  final random = Random();
  return List.generate(length, (_) => random.nextInt(10)).join('');
}
int generateRandomDigitsAsInt(int length) {
  final random = Random();
  // Generate a list of random digits as strings and join them.
  final digitsStr = List.generate(length, (_) => random.nextInt(10).toString()).join('');
  // Convert the string to an integer.
  return int.parse(digitsStr);
}

// Usage example:
