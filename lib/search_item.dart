/// Holds information about the displayed item
class SearchItem<TValue> {
  /// Item value
  final TValue value;

  /// Item display text
  final String text;

  SearchItem(this.value, this.text);
}