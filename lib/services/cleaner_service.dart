import 'dart:async';

class CleanerService {
  Future<double> scanJunk() async {
    await Future<void>.delayed(const Duration(milliseconds: 600));
    return 1.6;
  }

  Stream<double> runClean() async* {
    for (var i = 0; i <= 10; i++) {
      await Future<void>.delayed(const Duration(milliseconds: 200));
      yield i / 10;
    }
  }
}
