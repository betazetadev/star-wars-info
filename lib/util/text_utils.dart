extension StringExtension on String {
  String removeAllNewLines() {
    return replaceAll(RegExp('[\n]'), '');
  }

  String upperCaseFirstLetter() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
