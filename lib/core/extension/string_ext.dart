extension OrEmpty on String? {
  String orEmpty() {
    return this ?? '';
  }
}