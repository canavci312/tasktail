extension SwappableList<E> on List<E> {
  void swap(int first, int second) {
    final temp = this[first];
    this[first] = this[second];
    this[second] = temp;
  }

  void reOrder(int index, int index2) {
    var locIndex2 = index2;
    if (index < locIndex2) {
      locIndex2--;
    }
    final item = removeAt(index);
    insert(locIndex2, item);
  }
}
