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

  print(safe.ron(() => v['dog'][0]));
  print(safe.got(v, ['dog', 3, 'sub', 12323, 'fdasfdsa']));
  print(safe.sot(v, ['dog', 3, 'sub'], '100'));

  // 性能测试: 无任何判断 共耗时 8.312ms
  var p1 = TimeLog.point();
  for (var i = 0; i < 100000; i++) {
    var a = v['dog'][3]['sub'];
  }
  TimeLog.long(p1);

  // 性能测试: try-catch, 无错误时, 共耗时 10.33ms
  var p2 = TimeLog.point();
  for (var i = 0; i < 100000; i++) {
    safe.ron(() => v['dog'][3]['sub']);
  }
  TimeLog.long(p2);

  // 性能测试: try-catch, 捕获错误时, 共耗时 563.099ms
  var p3 = TimeLog.point();
  for (var i = 0; i < 100000; i++) {
    safe.ron(() => v['dog'][3]['sub']['213213']);
  }
  TimeLog.long(p3);

  // 性能测试: 判断路径安全 共耗时 15.835ms
  var p4 = TimeLog.point();
  for (var i = 0; i < 100000; i++) {
    safe.got(v, ['dog', 3]);
  }
  TimeLog.long(p4);

  // 性能测试: 判断路径安全 共耗时 13.73ms
  var p5 = TimeLog.point();
  for (var i = 0; i < 100000; i++) {
    safe.sot(v, ['dog', 2], 'new-dog');
  }
  TimeLog.long(p5);
}

class TimeLog {
  static bool isDev = true;

  static int point() {
    return DateTime.now().microsecondsSinceEpoch;
  }

  static void long(num t, [String name = 'Use time: ']) {
    if (isDev) {
      print('$name${(DateTime.now().microsecondsSinceEpoch - t) / 1000}ms');
    }
  }
}
