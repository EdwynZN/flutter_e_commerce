extension StringX on String {
  String toCountString(int quantity, [String end = 's']) {
    return '$quantity $this${quantity > 1 ? end : ''}';
  }
}
