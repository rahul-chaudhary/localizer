bool isAlphanumericAndStartsWithLowercase(String input) {
  // Check if the string is empty
  if (input.isEmpty) return false;

  // Check if the first character is a lowercase letter
  if (!RegExp(r'^[a-z]').hasMatch(input[0])) return false;

  // Check if all characters are alphanumeric
  return RegExp(r'^[a-zA-Z0-9]+$').hasMatch(input);
}