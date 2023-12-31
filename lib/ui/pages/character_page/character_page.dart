import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:test_mult/application/usecases/get_character_usecase/get_character_usecase.dart';
import 'package:test_mult/application/repository/characters_repository.dart';
import 'package:test_mult/ui/resources/rick_and_morty_colors.dart';

import '../../../application/usecases/get_episode_by_id/get_episode_by_id.dart';
import '../../state_managment/character_controller/character_controller.dart';
import '../../widgets/character_list_tile.dart';

class CharacterPage extends HookWidget {
  const CharacterPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final controller = useMemoized(
      () => CharacterController(
        GetCharactersDataUsecase(
          GetIt.I<CharacterRepository>(),
        ),
        GetCharacterEpisodeUsecase(
          GetIt.I<CharacterRepository>(),
        ),
      ),
    );

    useEffect(() {
      controller.getCharacter();
      return null;
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: RickAndMortyColors.darkBlue,
        title: const Text(
          "Rick and Morty",
          style: TextStyle(color: RickAndMortyColors.white_000),
        ),
      ),
      body: Observer(
        builder: (_) {
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.separated(
              itemCount: controller.character?.length ?? 0,
              itemBuilder: (context, index) {
                final character = controller.character?[index];
                return Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: CharacterListTile(
                    character: character,
                    onTap: () {},
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  height: 2,
                  color: RickAndMortyColors.dividerBlue,
                );
              },
            );
          }
        },
      ),
    );
  }
}
