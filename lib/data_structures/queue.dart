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
}
