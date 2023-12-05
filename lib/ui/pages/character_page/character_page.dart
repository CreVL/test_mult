import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:test_mult/application/usecases/get_character_usecase/get_character_usecase.dart';
import 'package:test_mult/data/repositories/characters_repository.dart';

import '../../../domain/entities/character.dart';
import '../../state_managment/character_controller/character_controller.dart';

class CharacterPage extends HookWidget {
  const CharacterPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final controller = useMemoized(
      () => CharacterController(
        GetCharactersMultUsecase(
          GetIt.I<CharacterRepository>(),
        ),
      ),
    );


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Rick and Morty"),
      ),
      body: Observer(
        builder: (_) {
          if (controller.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: 11,
              itemBuilder: (context, index) {
                return CharacterListTile(character: controller.character);
              },
            );
          }
        },
      ),
    );
  }
}

class CharacterListTile extends StatelessWidget {
  CharacterListTile({Key? key, required this.character}) : super(key: key);

  final CharactersMult? character;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      title: Text(
        '${character?.name}',
        style: theme.textTheme.bodyMedium,
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
      ),
    );
  }
}
