import 'package:dart_data_structures_and_algorithms/data_structures/queue.dart';

class TreeNode<T> {
  TreeNode(this.value) : children = [];

  T value;
  List<TreeNode<T>> children;

  void add(TreeNode<T> child) => children.add(child);

  void forEachDepthFirst(void Function(TreeNode<T> node) action) {
    action(this);
    for (final child in children) {
      child.forEachDepthFirst(action);
    }
  }

  void forEachLevelOrder(void Function(TreeNode<T> node) action) {
    final queue = QueueStack<TreeNode<T>>();
    action(this);
    children.forEach(queue.enqueue);
    TreeNode<T>? node = queue.dequeue();
    while (node != null) {
      action(node);
      node.children.forEach(queue.enqueue);
      node = queue.dequeue();
    }
  }

  TreeNode<T>? search(T value) {
    TreeNode<T>? result;
    forEachLevelOrder((node) {
      if (node.value == value) {
        result = node;
      }
    });
    return result;
  }

  @override
  String toString() => 'TreeNode(value: $value, children: $children)';
}

void main(List<String> args) {
  print('Beverage Tree Example');
  final tree = createBeverageTree();
  print('Depth First Traversal');
  tree.forEachDepthFirst((node) => print(node.value));
  print('---');
  print('Level Order Traversal');
  tree.forEachLevelOrder((node) => print(node.value));
  print('---');
  final searchResult1 = tree.search('chai');
  print('Search Result for chai: $searchResult1');
  final searchResult2 = tree.search('apple');
  print('Search Result for apple: $searchResult2');
}

TreeNode<String> createBeverageTree() {
  final tree = TreeNode<String>('beverages');
  final hot = TreeNode<String>('hot');
  final cold = TreeNode<String>('cold');
  final tea = TreeNode<String>('tea');
  final coffee = TreeNode<String>('coffee');
  final chocolate = TreeNode<String>('chocolate');
  final blackTea = TreeNode<String>('black');
  final greenTea = TreeNode<String>('green');
  final chaiTea = TreeNode<String>('chai');
  final soda = TreeNode<String>('soda');
  final milk = TreeNode<String>('milk');
  final gingerAle = TreeNode<String>('ginger ale');
  final bitterLemon = TreeNode<String>('bitter lemon');

  tree.add(hot);
  tree.add(cold);

  hot.add(tea);
  hot.add(coffee);
  hot.add(chocolate);

  cold.add(soda);
  cold.add(milk);

  tea.add(blackTea);
  tea.add(greenTea);
  tea.add(chaiTea);

  soda.add(gingerAle);
  soda.add(bitterLemon);

  return tree;
}
