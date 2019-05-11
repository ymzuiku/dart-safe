import 'package:flutter_test/flutter_test.dart';

import 'package:safe/safe.dart';

void main() {
  test('adds one to input values', () {
//    final calculator = Safe;
    final v = {
      'dog': [
        'aa',
        'bb',
        10,
        {'sub': '123'},
        [10, 20]
      ],
      'cat': {
        'sub': '123',
        20: ['apple', 'banana', 20]
      },
    };

    expect(Safe.get(v, ['dog', 1]), 'bb');
    expect(Safe.get(v, ['dog', 3, 'sub']), '123');
    expect(Safe.get(v, ['dog', 3, 'sub', 12, 'aaa']), '123');

    expect(Safe.set(v, ['dog', 1], 'bb2'), Safe.get(v, ['dog', 1]));
  });
}
