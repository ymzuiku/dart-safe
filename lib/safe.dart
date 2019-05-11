library safe;

// Use try catch run fn and return value
//
// This is ok: var a = safeRun(()=> v['dog', 2]);
dynamic ron(Function fn, [Function errFn]) {
  try {
    return fn();
  } catch (err) {
    if (errFn != null) {
      errFn(err);
    }
    return null;
  }
}

// Safe set List or Map value
//
// This is ok: safeSet(v, ['dog', 10, 'cat', 30], 'newValue');
dynamic sot(dynamic data, List params, dynamic value) {
  dynamic last = data;
  int l = params.length - 1;
  for (var i = 0; i < l; i++) {
    var k = params[i];
    if (last is List) {
      if (k >= last.length - 1) {
        last = null;
        break;
      }
      last = last[k];
    } else if (last is Map) {
      if (last.containsKey(k) == false) {
        last = null;
        break;
      }
      last = last[k];
    } else {
      last = null;
      break;
    }
  }

  if (last is List || last is Map) {
    last[params[l]] = value;
  }

  return data;
}

// safe get List and Map
// This is ok: safeGet(v, ['dog', 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, '...']);
dynamic got(dynamic data, List params) {
  dynamic last = data;
  for (var i = 0, l = params.length; i < l; i++) {
    var k = params[i];
    if (last is List) {
      if (k >= last.length - 1) {
        last = null;
        break;
      }
      last = last[k];
    } else if (last is Map) {
      if (last.keys.any((v) => v == k) == false) {
        last = null;
        break;
      }
      last = last[k];
    } else {
      last = null;
      break;
    }
  }
  return last;
}
