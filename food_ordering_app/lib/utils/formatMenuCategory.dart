String convertCamelCaseToWords(String input) {
  return input
      .splitMapJoin(
        RegExp(r'(?<=[a-z])[A-Z]'),
        onMatch: (match) => ' ${match.group(0)}',
        onNonMatch: (nonMatch) => nonMatch,
      )
      .capitalize();
}

extension StringExtension on String {
  String capitalize() {
    return isEmpty ? this : this[0].toUpperCase() + substring(1);
  }
}


