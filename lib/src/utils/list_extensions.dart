typedef FuncCombination2<T> = void Function(T first, T second);

extension ListExtension<T> on List<T> {
  // Returns true if the list contains duplicates
  bool containsDuplicate() {
    for (int i = 0; i < this.length; i++) {
      for (int j = i + 1; j < this.length; j++) {
        if (this[i] == this[j]) {
          return true;
        }
      }
    }
    return false;
  }

  void combinations2(FuncCombination2<T> func) {
    for (int i = 0; i < this.length; i++) {
      for (int j = i + 1; j < this.length; j++) {
        func(this[i], this[j]);
      }
    }
  }
}
