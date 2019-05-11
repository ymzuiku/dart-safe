library safe;

class Safe {
  static dynamic run(Function fn, [Function errFn]) {
    try {
      return fn();
    } catch (err) {
      if (errFn != null) {
        errFn(err);
      }
      return null;
    }
  }

  // max set in at 10 length
  static dynamic set(dynamic data, List path, dynamic v) {
    dynamic last = data;
    for (var i = 0; i < path.length - 1; i++) {
      var v = last[path[i]];
      if (v == null) break;
      last = v;
    }

    var i = path.length - 1;
    if (i == 0) {
      data[path[0]] = v;
    } else if (i == 1) {
      data[path[0]][path[1]] = v;
    } else if (i == 2) {
      data[path[0]][path[1]][path[2]] = v;
    } else if (i == 3) {
      data[path[0]][path[1]][path[2]][path[3]] = v;
    } else if (i == 4) {
      data[path[0]][path[1]][path[2]][path[3]][path[4]] = v;
    } else if (i == 5) {
      data[path[0]][path[1]][path[2]][path[3]][path[4]][path[5]] = v;
    } else if (i == 6) {
      data[path[0]][path[1]][path[2]][path[3]][path[4]][path[5]][path[6]] = v;
    } else if (i == 7) {
      data[path[0]][path[1]][path[2]][path[3]][path[4]][path[5]][path[6]]
      [path[7]] = v;
    } else if (i == 8) {
      data[path[0]][path[1]][path[2]][path[3]][path[4]][path[5]][path[6]]
      [path[7]][path[8]] = v;
    } else if (i == 9) {
      data[path[0]][path[1]][path[2]][path[3]][path[4]][path[5]][path[6]]
      [path[7]][path[8]][path[9]] = v;
    } else if (i == 10) {
      data[path[0]][path[1]][path[2]][path[3]][path[4]][path[5]][path[6]]
      [path[7]][path[8]][path[9]][path[10]] = v;
    }
    return data;
  }

  static dynamic get(dynamic data, List path) {
    dynamic last = data;
    for (var i = 0; i < path.length; i++) {
      var v = last[path[i]];
      if (v == null) break;
      last = v;
    }
    return last;
  }
}
