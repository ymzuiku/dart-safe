//import 'package:safe/safe.dart';
//
//void main() {
//  final v = {
//    'dog': [
//      'aa',
//      'bb',
//      10,
//      {'sub': '123'},
//      [10, 20]
//    ],
//    'cat': {
//      'sub': '123',
//      20: ['apple', 'banana', 20]
//    },
//  };
//
//  assert(Safe.get(v, ['dog', 1]) == 'bb');
//  assert(Safe.get(v, ['dog', 3, 'sub']) == '123');
//  assert(Safe.get(v, ['dog', 3, 'sub', 12, 'aaa']) == '123');
//
//  Safe.set(v, ['dog', 1], 'bb2');
//  assert(Safe.get(v, ['dog', 1]) == 'bb2');
//}
