extension ListExt<T> on Iterable<T> {
  T? firstWhereOrNull(bool Function(T) condition) {
    for (final element in this) {
      if (condition(element)) {
        return element;
      }
    }
    return null;
  }
}
