# safe

安全的 Map 对象 set/get 操作

## API

[API Documentation](https://pub.dev/documentation/safe/latest/safe/safe-library.html)

## Getting Started

这是一个基础的用例:

```dart
import 'package:safe/Safe.dart';

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

  print(Safe.run(() => v['dog'][0]));
  print(Safe.get(v, ['dog', 3, 'sub', 12323, 'error-key']));
  print(Safe.set(v, ['dog', 3, 'sub'], '100'));
}
```

## 性能测试

- Safe.run: 使用 try/catch，在未捕获错误时, 性能基本无损耗, 捕获错误时, 性能下降 50 倍
- Safe.get/set: 递归判断父级对象是否存在, 性能损耗属于正常逻辑损耗

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
    Safe.run(() => v['dog'][3]['sub']);
  }
  TimeLog.long(p2);

  // 性能测试: try-catch, 捕获错误时, 共耗时 563.099ms
  var p3 = TimeLog.point();
  for (var i = 0; i < 100000; i++) {
    Safe.run(() => v['dog'][3]['sub']['213213']);
  }
  TimeLog.long(p3);

  // 性能测试: 判断路径安全 共耗时 15.835ms
  var p4 = TimeLog.point();
  for (var i = 0; i < 100000; i++) {
    Safe.get(v, ['dog', 3]);
  }
  TimeLog.long(p4);

  // 性能测试: 判断路径安全 共耗时 13.73ms
  var p5 = TimeLog.point();
  for (var i = 0; i < 100000; i++) {
    Safe.set(v, ['dog', 2], 'new-dog');
  }
  TimeLog.long(p5);
```
