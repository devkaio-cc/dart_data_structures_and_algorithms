import 'package:dart_data_structures_and_algorithms/stack.dart';
import 'package:test/test.dart';

void main() {
  group('Stack', () {
    test('push adds an element to the top of the stack', () {
      final stack = Stack<int>();
      stack.push(1);
      expect(stack.peak, 1);
    });

    test('pop removes and returns the element at the top of the stack', () {
      final stack = Stack<int>();
      stack.push(1);
      stack.push(2);
      final popped = stack.pop();
      expect(popped, 2);
      expect(stack.peak, 1);
    });

    test('peak returns the element at the top of the stack without removing it', () {
      final stack = Stack<int>();
      stack.push(1);
      stack.push(2);
      expect(stack.peak, 2);
    });

    test('isEmpty returns true when the stack is empty', () {
      final stack = Stack<int>();
      expect(stack.isEmpty, isTrue);
    });

    test('isNotEmpty returns true when the stack is not empty', () {
      final stack = Stack<int>();
      stack.push(1);
      expect(stack.isNotEmpty, isTrue);
    });

    test('Stack.of creates a stack from an iterable', () {
      const list = ['a', 'b', 'c'];
      final stack = Stack.of(list);
      expect(stack.peak, 'c');
    });

    test('reversed returns a stack with elements in reverse order', () {
      const list = ['a', 'b', 'c'];
      final stack = Stack.of(list);
      final reversed = stack.reversed();
      expect(reversed.peak, 'a');
    });

    test('toString returns a string representation of the stack', () {
      final stack = Stack<int>();
      stack.push(1);
      stack.push(2);
      stack.push(3);
      expect(stack.toString(), '--- Top ---\n3\n2\n1\n-----------');
    });

    test('pop throws an error when the stack is empty', () {
      final stack = Stack<int>();
      expect(() => stack.pop(), throwsA(isA<AssertionError>()));
    });

    test('peak throws an error when the stack is empty', () {
      final stack = Stack<int>();
      expect(() => stack.peak, throwsA(isA<AssertionError>()));
    });
  });
}
