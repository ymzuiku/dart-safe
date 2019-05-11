# safe

安全的 set/get 对象操作

## API

[API Documentation](https://pub.dev/documentation/safe/latest/safe/safe-library.html)

## Getting Started

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.



```dart
import 'package:safe/safe.dart' as safe;

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

  print(safe.run(() => v['dog'][0]));
  print(safe.get(v, ['dog', 3, 'sub', 12323, 'error-key']));
  print(safe.set(v, ['dog', 3, 'sub'], '100'));
}
```

## 性能测试

- safe.run: 在未捕获错误时, 性能基本无损耗, 捕获错误时, 性能下降50倍
- safe.get/set: 相当于手动判断父级对象是否存在, 性能损耗属于正常逻辑损耗

```dart
  // 性能测试: 无任何判断 共耗时 8.312ms
  var p1 = TimeLog.point();
  for (var i = 0; i < 100000; i++) {
    var a = v['dog'][3]['sub'];
  }
  TimeLog.long(p1);

  // 性能测试: try-catch, 无错误时, 共耗时 10.33ms
  var p2 = TimeLog.point();
  for (var i = 0; i < 100000; i++) {
    safe.run(() => v['dog'][3]['sub']);
  }
  TimeLog.long(p2);

  // 性能测试: try-catch, 捕获错误时, 共耗时 563.099ms
  var p3 = TimeLog.point();
  for (var i = 0; i < 100000; i++) {
    safe.run(() => v['dog'][3]['sub']['213213']);
  }
  TimeLog.long(p3);

  // 性能测试: 判断路径安全 共耗时 15.835ms
  var p4 = TimeLog.point();
  for (var i = 0; i < 100000; i++) {
    safe.get(v, ['dog', 3]);
  }
  TimeLog.long(p4);

  // 性能测试: 判断路径安全 共耗时 13.73ms
  var p5 = TimeLog.point();
  for (var i = 0; i < 100000; i++) {
    safe.set(v, ['dog', 2], 'new-dog');
  }
  TimeLog.long(p5);
```

