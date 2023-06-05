import 'package:flexcardapio/src/core/ui/helpers/messages.dart';
import 'package:flexcardapio/src/modules/choice/choice_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../core/ui/helpers/loader.dart';

class ChoicePage extends StatefulWidget {
  const ChoicePage({Key? key}) : super(key: key);

  @override
  State<ChoicePage> createState() => _ChoicePageState();
}

class _ChoicePageState extends State<ChoicePage> with Loader, Messages {
  final controller = Modular.get<ChoiceController>();

  final disposers = <ReactionDisposer>[];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final filterDisposer = reaction(
        (_) => controller,
        (_) {
          controller.loadChoices();
        },
      );

      final statusDisposer = reaction((_) => controller.status, (status) {
        switch (status) {
          case ChoiceStateStatus.initial:
            break;
          case ChoiceStateStatus.loading:
            showLoader();
            break;
          case ChoiceStateStatus.laoded:
            hideloader();
            break;
          case ChoiceStateStatus.error:
            hideloader();
            showError(
              controller.errorMessage ?? 'Erro ao os sites',
            );
            break;
        }
      });
      disposers.addAll([statusDisposer, filterDisposer]);
      controller.loadChoices();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 40, top: 10, right: 40),
      child: Column(
        children: [
          Expanded(
            child: Observer(
              builder: (_) {
                return GridView.builder(
                  itemCount: controller.choiceTypes.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    mainAxisExtent: 120,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 10,
                    maxCrossAxisExtent: 680,
                  ),
                  itemBuilder: (context, index) {
                    final paymentTypeModel = controller.choiceTypes[index];
                    return Column(
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              Modular.to
                                  .navigate('/site/${paymentTypeModel.id}');
                            },
                            child: const Text('site 1')),
                        ElevatedButton(
                            onPressed: () {
                              Modular.to
                                  .pushNamed('/site/${paymentTypeModel.id}');
                            },
                            child: const Text('site 2')),
                        ElevatedButton(
                            onPressed: () {
                              Modular.to
                                  .pushNamed('/site/${paymentTypeModel.id}');
                            },
                            child: const Text('site 3')),
                      ],
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
