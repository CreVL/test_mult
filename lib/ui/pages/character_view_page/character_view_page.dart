import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_mult/ui/resources/rick_and_morty_colors.dart';

import '../../../domain/entities/characters_data.dart';

class CharacterViewPage extends StatelessWidget {

  const CharacterViewPage({
    super.key,
    required this.characterData,
  });

  final CharactersData characterData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    child: Image.network(
                      characterData.image ??
                      '',
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      context.go('/');
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: RickAndMortyColors.white_000,
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
