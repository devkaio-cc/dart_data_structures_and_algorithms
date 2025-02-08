import 'package:dart_data_structures_and_algorithms/data_structures/queue.dart';
import 'package:test/test.dart';

void main() {
  group('QueueList', () {
    test('enqueue adds elements to the queue', () {
      final queue = QueueList<int>();
      expect(queue.isEmpty, isTrue);

      queue.enqueue(1);
      queue.enqueue(2);
      queue.enqueue(3);

      expect(queue.isEmpty, isFalse);
      expect(queue.toString(), '[1, 2, 3]');
    });

    test('dequeue removes elements from the queue', () {
      final queue = QueueList<int>();
      queue.enqueue(1);
      queue.enqueue(2);
      queue.enqueue(3);

      expect(queue.dequeue(), 1);
      expect(queue.toString(), '[2, 3]');

      expect(queue.dequeue(), 2);
      expect(queue.toString(), '[3]');

      expect(queue.dequeue(), 3);
      expect(queue.isEmpty, isTrue);
    });

    test('peek returns the first element without removing it', () {
      final queue = QueueList<int>();
      queue.enqueue(1);
      queue.enqueue(2);
      queue.enqueue(3);

      expect(queue.peek, 1);
      expect(queue.toString(), '[1, 2, 3]');

      queue.dequeue();
      expect(queue.peek, 2);
      expect(queue.toString(), '[2, 3]');
    });

    test('isEmpty returns true if the queue is empty', () {
      final queue = QueueList<int>();
      expect(queue.isEmpty, isTrue);

      queue.enqueue(1);
      expect(queue.isEmpty, isFalse);

      queue.dequeue();
      expect(queue.isEmpty, isTrue);
    });
  });

  group('QueueLinkedList', () {
    test('enqueue adds elements to the queue', () {
      final queue = QueueLinkedList<int>();
      expect(queue.isEmpty, isTrue);

      queue.enqueue(1);
      queue.enqueue(2);
      queue.enqueue(3);

      expect(queue.isEmpty, isFalse);
      expect(queue.toString(), '[1, 2, 3]');
    });

    test('dequeue removes elements from the queue', () {
      final queue = QueueLinkedList<int>();
      queue.enqueue(1);
      queue.enqueue(2);
      queue.enqueue(3);

      expect(queue.dequeue(), 1);
      expect(queue.toString(), '[2, 3]');

      expect(queue.dequeue(), 2);
      expect(queue.toString(), '[3]');

      expect(queue.dequeue(), 3);
      expect(queue.isEmpty, isTrue);
    });

    test('peek returns the first element without removing it', () {
      final queue = QueueLinkedList<int>();
      queue.enqueue(1);
      queue.enqueue(2);
      queue.enqueue(3);

      expect(queue.peek, 1);
      expect(queue.toString(), '[1, 2, 3]');

      queue.dequeue();
      expect(queue.peek, 2);
      expect(queue.toString(), '[2, 3]');
    });

    test('isEmpty returns true if the queue is empty', () {
      final queue = QueueLinkedList<int>();
      expect(queue.isEmpty, isTrue);

      queue.enqueue(1);
      expect(queue.isEmpty, isFalse);

      queue.dequeue();
      expect(queue.isEmpty, isTrue);
    });
  });
}
