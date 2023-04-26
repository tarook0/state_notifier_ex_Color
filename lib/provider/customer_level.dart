import 'package:state_notifier/state_notifier.dart';
import 'package:state_notifier_ex/provider/counter.dart';

enum Level {
  bronz,
  silver,
  gold,
}

class CustomerLevel extends StateNotifier<Level> with LocatorMixin {
  CustomerLevel() : super(Level.bronz);
  @override
  void update(Locator watch) {
    final currentCounter = watch<CounterState>().counter;
    if (currentCounter >= 100) {
      state = Level.gold;
    } else if (currentCounter > 50 && currentCounter < 100) {
      state = Level.silver;
    } else {
      state = Level.bronz;
    }
    super.update(watch);
  }
}
