extension StringExtension on String {
  bool isEmptyStringExtension() {
    return this.isEmpty;
  }

  bool isUrl() {
    if (!this.isEmptyStringExtension()) {
      return this.startsWith('http://') || this.startsWith('https://');
    }
    return false;
  }
}
