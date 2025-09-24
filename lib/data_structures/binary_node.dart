class BinaryNode<T> {
  BinaryNode(this.value);
  T value;
  BinaryNode<T>? left;
  BinaryNode<T>? right;

  String _diagram(BinaryNode<T>? node, [String top = '', String root = '', String bottom = '']) {
    if (node == null) return '$root null\n';

    if (node.left == null && node.right == null) return '$root ${node.value}\n';

    final a = _diagram(node.right, '$top ', '$top┌──', '$top│ ');

    final b = '$root${node.value}\n';
    final c = _diagram(node.left, '$bottom│ ', '$bottom└──', '$bottom ');

    return '$a$b$c';
  }

  /// Traverses the tree in-order and applies the given action to each node's value.
  ///
  /// In-order traversal visits the left subtree, then the current node, and finally the right subtree.
  ///
  /// Example: [1, 2, 3] for a tree structured as:
  /// ```md
  ///     2
  ///    / \
  ///   1   3
  /// ```
  /// This will print: 1 2 3
  ///
  /// Hint: [left] -> [action] -> [right]
  void traverseInOrder(void Function(T value) action) {
    left?.traverseInOrder(action);
    action(value);
    right?.traverseInOrder(action);
  }

  /// Traverses the tree pre-order and applies the given action to each node's value.
  ///
  /// Pre-order traversal visits the current node before its child nodes.
  ///
  /// Example: [2, 1, 3] for a tree structured as:
  /// ```md
  ///     2
  ///    / \
  ///   1   3
  /// ```
  /// This will print: 2 1 3
  ///
  /// Hint: [action] -> [left] -> [right]
  void traversePreOrder(void Function(T value) action) {
    action(value);
    left?.traversePreOrder(action);
    right?.traversePreOrder(action);
  }

  /// Traverses the tree post-order and applies the given action to each node's value.
  ///
  /// Post-order traversal visits the child nodes before the current node.
  ///
  /// Example: [1, 3, 2] for a tree structured as:
  /// ```md
  ///     2
  ///    / \
  ///   1   3
  /// ```
  /// This will print: 1 3 2
  ///
  /// Hint: [left] -> [right] -> [action]
  void traversePostOrder(void Function(T value) action) {
    left?.traversePostOrder(action);
    right?.traversePostOrder(action);
    action(value);
  }

  @override
  String toString() => _diagram(this);
}

BinaryNode<int> createBinaryTree() {
  final zero = BinaryNode(0);
  final one = BinaryNode(1);
  final five = BinaryNode(5);
  final seven = BinaryNode(7);
  final eight = BinaryNode(8);
  final nine = BinaryNode(9);

  seven.left = one;
  one.left = zero;
  one.right = five;
  seven.right = nine;
  nine.left = eight;

  return seven;
}

void main(List<String> args) {
  print('Binary Tree Example');
  final tree = createBinaryTree();
  print(tree);
  print('In-order Traversal:');
  tree.traverseInOrder(print);
  print('Pre-order Traversal:');
  tree.traversePreOrder(print);
  print('Post-order Traversal:');
  tree.traversePostOrder(print);
  print('End of Binary Tree Example');
}
