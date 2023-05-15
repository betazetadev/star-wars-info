extension StringExtension on String {
  String removeAllNewLines() {
    return replaceAll(RegExp('[\n]'), '');
  }
}
