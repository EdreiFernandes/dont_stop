
extension StringExtensions on String {
  String removeLastCharacter() {
    return this.substring(0, this.length - 1);
  }
}