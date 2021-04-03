extension NumExt on num {
  static num checkAndParse(dynamic value) {
    if (value is String) {
      return num.tryParse(value);
    } else {
      return value;
    }
  }
}
