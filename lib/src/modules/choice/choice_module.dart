import 'package:flexcardapio/src/modules/choice/choice_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'choice_page.dart';

class ChoiceModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton(
          (i) => ChoiceController(i()),
        ),
      ];

  @override
  List<ModularRoute> get routes =>
      [ChildRoute('/', child: (context, args) => const ChoicePage())];
}
