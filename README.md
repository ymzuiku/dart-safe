# safe

Safe get&#x2F;set Object

## Getting Started

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.


```dart
import 'package:safe/safe.dart';

void main() {
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

  print(safe(() => v['dog'][0]);  // 'aa'
  print(safe(() => v['dog'][99]);  // null
}
```