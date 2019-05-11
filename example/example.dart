import 'package:safe/safe.dart';

void main() {
  final dynamic v = {
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

  print(safe(() => v['dog'][0]));
  print(safe(() => v['dog'][99]));
}
