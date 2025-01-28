/// A class representing a node in a linked list.
///
/// Each node contains a value of type `T` and a reference to the next node in the list.
///
/// The `Node` class has the following properties:
///
/// - `value`: The value stored in the node.
/// - `next`: A reference to the next node in the list, or `null` if this is the last node.
///
/// The `toString` method provides a string representation of the node and its successors.
class Node<T> {
  Node({
    required this.value,
    this.next,
  });

  T value;
  Node<T>? next;

  @override
  String toString() {
    if (next == null) return '$value';
    return '$value -> $next';
  }
}

/// A simple implementation of a singly linked list.
///
/// The `LinkedList` class provides methods to manipulate a linked list,
/// including adding, removing, and accessing elements.
///
/// Type Parameters:
/// - `E`: The type of elements contained in the list.
class LinkedList<E> {
  /// The head node of the linked list.
  Node<E>? head;

  /// The tail node of the linked list.
  Node<E>? tail;

  /// Checks if the linked list is empty.
  ///
  /// Returns `true` if the list is empty, otherwise `false`.
  bool get isEmpty => head == null;

  /// Returns a string representation of the linked list.
  ///
  /// If the list is empty, returns 'Empty list'. Otherwise, returns the
  /// string representation of the head node.
  @override
  String toString() {
    if (isEmpty) return 'Empty list';

    return head.toString();
  }

  /// Adds a value to the beginning of the linked list.
  ///
  /// The new value becomes the new head of the list.
  ///
  /// Parameters:
  /// - `value`: The value to be added to the list.
  void push(E value) {
    head = Node(value: value, next: head);
    tail ??= head;
  }

  /// Adds a value to the end of the linked list.
  ///
  /// If the list is empty, the new value becomes the head of the list.
  ///
  /// Parameters:
  /// - `value`: The value to be added to the list.
  void append(E value) {
    if (isEmpty) {
      return push(value);
    }

    tail!.next = Node(value: value);

    tail = tail!.next;
  }

  /// Returns the node at the specified index.
  ///
  /// If the index is out of bounds, returns `null`.
  ///
  /// Parameters:
  /// - `index`: The zero-based index of the node to retrieve.
  ///
  /// Returns the node at the specified index, or `null` if the index is out of bounds.
  Node<E>? nodeAt(int index) {
    Node<E>? currentNode = head;
    int currentIndex = 0;

    while (currentNode != null && currentIndex < index) {
      currentNode = currentNode.next;
      currentIndex++;
    }

    return currentNode;
  }

  /// Inserts a value after the specified node.
  ///
  /// If the specified node is the tail, the new value is appended to the list.
  ///
  /// Parameters:
  /// - `node`: The node after which the new value should be inserted.
  /// - `value`: The value to be inserted.
  ///
  /// Returns the newly inserted node.
  Node<E> insertAfter(Node<E> node, E value) {
    if (node == tail) {
      append(value);
      return tail!;
    }

    node.next = Node(value: value, next: node.next);

    return node.next!;
  }

  /// Removes and returns the value at the beginning of the linked list.
  ///
  /// If the list is empty, returns `null`.
  ///
  /// Returns the value at the beginning of the list, or `null` if the list is empty.
  E? pop() {
    final value = head?.value;
    head = head?.next;

    if (isEmpty) {
      tail = null;
    }

    return value;
  }
}

void main() {
  LinkedList<int> list = LinkedList<int>();

  list.push(1);
  list.push(2);
  list.push(3);

  print(list);

  list = LinkedList<int>();

  list.append(1);
  list.append(2);
  list.append(3);

  print(list);

  list = LinkedList<int>();
  list.push(3);
  list.push(2);
  list.push(1);

  print('Before insert: $list');

  Node<int> node = list.nodeAt(1)!;
  list.insertAfter(node, 42);

  print('After insert: $list');
}
