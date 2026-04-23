class StackDS<T> {
  final _storage = <T>[];

  void push(T element) => _storage.add(element);
  T pop() => _storage.removeLast();
  T get peek => _storage.last;
  bool get isEmpty => _storage.isEmpty;
  void clear() => _storage.clear();
  @override
  String toString() => 'Stack: $_storage';
}
