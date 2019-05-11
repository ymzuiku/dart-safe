library safe;

dynamic safe(Function fn, [Function errFn]) {
  try {
    return fn();
  } catch (err) {
    if (errFn != null) {
      errFn(err);
    }
    return null;
  }
}
