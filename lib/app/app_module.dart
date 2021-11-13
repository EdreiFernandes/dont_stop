import 'package:dont_stop/app/screens/menu.dart';
import 'package:dont_stop/app/services/timer_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<TimerService>((i) => TimerServiceImpl()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => Menu()),
      ];
}
