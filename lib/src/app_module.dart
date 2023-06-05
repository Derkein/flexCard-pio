import 'package:flexcardapio/src/modules/testss/test_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'modules/choice/choice_module.dart';
import 'modules/core/core_module.dart';
import 'modules/template/base_layout.dart';
import 'modules/testss/test_page.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
        ChoiceModule(),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/choice/', module: ChoiceModule()),
        ChildRoute('/site/:numero', child: (context, args) {
          final numero = args.params['numero'];
          final routeData = getRouteData(numero);

          return BaseLayout(
            body: TestPage(numero: args.params['numero']),
            color: routeData.color,
            title: routeData.title,
            imagePath: routeData.imagePath,
          );
        }),
      ];

  RouteData getRouteData(String numero) {
    Color color;
    String title;
    String imagePath;

    if (numero == '1') {
      color = Colors.black;
      title = 'Title 1';
      imagePath = 'image1.jpg';
    } else if (numero == '2') {
      color = Colors.red;
      title = 'Title 2';
      imagePath = 'image2.jpg';
    } else if (numero == '3') {
      color = Colors.blue;
      title = 'Title 3';
      imagePath = 'image3.jpg';
    } else {
      color = Colors.white;
      title = 'Default Title';
      imagePath = '';
    }

    return RouteData(color: color, title: title, imagePath: imagePath);
  }
}

class RouteData {
  final Color color;
  final String title;
  final String imagePath;

  RouteData(
      {required this.color, required this.title, required this.imagePath});
}
