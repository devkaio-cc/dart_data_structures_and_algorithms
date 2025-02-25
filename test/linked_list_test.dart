import 'package:dart_data_structures_and_algorithms/data_structures/linked_list.dart';
import 'package:test/test.dart';

void main() {
  group('LinkedList', () {
    test('push adds elements to the front of the list', () {
      final list = LinkedList<int>();
      list.push(1);
      list.push(2);
      list.push(3);

      expect(list.toString(), '3 -> 2 -> 1');
    });

    test('append adds elements to the end of the list', () {
      final list = LinkedList<int>();
      list.append(1);
      list.append(2);
      list.append(3);

      expect(list.toString(), '1 -> 2 -> 3');
    });

    test('nodeAt returns the correct node', () {
      final list = LinkedList<int>();
      list.push(1);
      list.push(2);
      list.push(3);

      final node = list.nodeAt(1);
      expect(node?.value, 2);
    });

    test('insertAfter inserts a node after the given node', () {
      final list = LinkedList<int>();
      list.push(1);
      list.push(2);
      list.push(3);

      final node = list.nodeAt(1)!;
      list.insertAfter(node, 42);

      expect(list.toString(), '3 -> 2 -> 42 -> 1');
    });

    test('pop removes and returns the first element', () {
      final list = LinkedList<int>();
      list.push(1);
      list.push(2);
      list.push(3);

      final value = list.pop();
      expect(value, 3);
      expect(list.toString(), '2 -> 1');
    });

    test('isEmpty returns true for an empty list', () {
      final list = LinkedList<int>();
      expect(list.isEmpty, isTrue);
    });

    test('isEmpty returns false for a non-empty list', () {
      final list = LinkedList<int>();
      list.push(1);
      expect(list.isEmpty, isFalse);
    });

    test('removeLast removes and returns the last element', () {
      final list = LinkedList<int>();
      list.push(1);
      list.push(2);
      list.push(3);

      final value = list.removeLast();
      expect(value, 1);
      expect(list.toString(), '3 -> 2');
    });

    test('removeAfter removes the node following the given node', () {
      final list = LinkedList<int>();
      list.push(1);
      list.push(2);
      list.push(3);

      final node = list.nodeAt(1)!;
      final value = list.removeAfter(node);
      expect(value, 1);
      expect(list.toString(), '3 -> 2');
    });

    test('removeAfter returns null if the given node is the last node', () {
      final list = LinkedList<int>();
      list.push(1);
      list.push(2);
      list.push(3);

      final node = list.nodeAt(0)!;
      final value = list.removeAfter(node);
      expect(value, isNull);
      expect(list.toString(), '3 -> 2 -> 1');
    });

    test('reverse reverses the list', () {
      final list = LinkedList<int>();
      list.push(1);
      list.push(2);
      list.push(3);

      list.reverse();
      expect(list.toString(), '1 -> 2 -> 3');
    });
  });
}
