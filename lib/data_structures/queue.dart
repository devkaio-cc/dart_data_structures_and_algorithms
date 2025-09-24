import 'package:dart_data_structures_and_algorithms/data_structures/doubly_linked_list.dart';

abstract class Queue<E> {
  bool enqueue(E element);
  E? dequeue();
  bool get isEmpty;
  E? get peek;
}

class QueueList<E> implements Queue<E> {
  final _list = <E>[];

  @override
  E? dequeue() => _list.isEmpty ? null : _list.removeAt(0);

  @override
  bool enqueue(E element) {
    _list.add(element);
    return true;
  }

  /// Returns true if the queue is empty.
  @override
  bool get isEmpty => _list.isEmpty;

  @override
  E? get peek => isEmpty ? null : _list.first;

  @override
  String toString() => _list.toString();
}

void main() {
  final queue = QueueList<String>();

  print('QueueList example');
  queue.enqueue('First');
  queue.enqueue('Second');
  queue.enqueue('Third');

  print(queue); // [First, Second, Third]

  queue.dequeue();
  print(queue); // [Second, Third]

  print(queue.peek); // Second
  print(queue); // [Second, Third]

  print('QueueLinkedList example');
  final queueLinkedList = QueueLinkedList<String>();

  queueLinkedList.enqueue('First');
  queueLinkedList.enqueue('Second');
  queueLinkedList.enqueue('Third');

  print(queueLinkedList); // [First, Second, Third]

  queueLinkedList.dequeue();
  print(queueLinkedList); // [Second, Third]

  print(queueLinkedList.peek); // Second

  print(queueLinkedList); // [Second, Third]

  print('QueueStack example');
  final queueStack = QueueStack<String>();
  queueStack.enqueue('First');
  queueStack.enqueue('Second');
  queueStack.enqueue('Third');
}

class QueueLinkedList<E> implements Queue<E> {
  final _list = DoublyLinkedList<E>();

  @override
  E? dequeue() => _list.pop();

  @override
  bool enqueue(E element) {
    _list.append(element);
    return true;
  }

  @override
  bool get isEmpty => _list.isEmpty;

  @override
  E? get peek => _list.head?.value;

  @override
  toString() => _list.toString();
}

class QueueStack<E> implements Queue<E> {
  final _leftStack = <E>[];
  final _rightStack = <E>[];

  @override
  E? dequeue() {
    if (_leftStack.isEmpty) {
      _leftStack.addAll(_rightStack.reversed);
      _rightStack.clear();
    }
    if (_leftStack.isEmpty) {
      return null;
    }
    return _leftStack.removeLast();
  }

  @override
  bool enqueue(E element) {
    _rightStack.add(element);
    return true;
  }

  @override
  bool get isEmpty => _leftStack.isEmpty && _rightStack.isEmpty;

  @override
  E? get peek => _leftStack.isNotEmpty ? _leftStack.last : _rightStack.first;
}
