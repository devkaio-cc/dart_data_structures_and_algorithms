/// A generic stack implementation in Dart.
///
/// The `Stack` class provides a simple stack data structure with basic
/// operations such as push, pop, and peek. It also includes utility
/// methods to check if the stack is empty or not, and to create a
/// reversed version of the stack.
///
/// Example usage:
/// ```dart
/// final stack = Stack<int>();
/// stack.push(1);
/// stack.push(2);
/// print(stack.pop()); // Output: 2
/// print(stack.peak);  // Output: 1
/// ```
///
/// Type Parameters:
/// - `E`: The type of elements in the stack.
class Stack<E> {
  /// Creates an empty stack.
  Stack() : _storage = <E>[];

  /// The internal storage for the stack elements.
  final List<E> _storage;

  /// Pushes an [element] onto the top of the stack.
  void push(E element) => _storage.add(element);

  /// Removes and returns the top element of the stack.
  ///
  /// Throws a `StateError` if the stack is empty.
  ///
  /// Returns the top element of the stack.
  E pop() {
    assert(_storage.isNotEmpty, 'Stack is empty. Cannot pop element.');

    return _storage.removeLast();
  }

  /// Returns the top element of the stack without removing it.
  ///
  /// Throws a `StateError` if the stack is empty.
  ///
  /// Returns the top element of the stack.
  E get peak {
    assert(_storage.isNotEmpty, 'Stack is empty. Cannot peek element.');

    return _storage.last;
  }

  /// Checks if the stack is empty.
  ///
  /// Returns `true` if the stack is empty, otherwise `false`.
  bool get isEmpty => _storage.isEmpty;

  /// Checks if the stack is not empty.
  ///
  /// Returns `true` if the stack is not empty, otherwise `false`.
  bool get isNotEmpty => _storage.isNotEmpty;

  /// Creates a stack from an existing iterable of elements.
  Stack.of(Iterable<E> elements) : _storage = List.of(elements);

  /// Returns a new stack with the elements in reverse order.
  ///
  /// Returns a new `Stack<E>` with the elements reversed.
  Stack<E> reversed() => Stack.of(_storage.reversed);

  /// Returns a string representation of the stack.
  ///
  /// The string representation shows the elements from top to bottom.
  ///
  /// Returns a string representation of the stack.
  @override
  String toString() => //
      '--- Top ---\n'
      '${_storage.reversed.join('\n')}'
      '\n-----------';
}

void main() {
  final stack = Stack<int>();

  stack.pop();

  stack.push(1);
  stack.push(2);
  stack.push(3);
  stack.push(4);

  print('$stack');

  final element = stack.pop();

  print('Popped: $element');
  print('Peek: ${stack.peak}');

  const list = ['a', 'e', 'i', 'o', 'u'];

  final vowels = Stack.of(list);

  print('$vowels');

  final reversed = vowels.reversed();

  print('$reversed');
}
