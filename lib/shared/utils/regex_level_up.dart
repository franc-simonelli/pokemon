int? extractLevel(String input) {
  final match = RegExp(r'\(Level (\d{1,2})\)').firstMatch(input);
  return match != null ? int.parse(match.group(1)!) : null;
}
