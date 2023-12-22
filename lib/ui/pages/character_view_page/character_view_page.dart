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
        child: Stack(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    Image.network(
                      characterData.image ?? '',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 218,
                    ),
                    Container(
                      width: double.infinity,
                      height: 218,
                      decoration: BoxDecoration(
                          color: const Color(0xFF0B1E2D).withOpacity(0.65)),
                    ),
                    IconButton(
                      onPressed: () {
                        context.go('/');
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: RickAndMortyColors.white_000,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 120,
                ),
                Text(
                  characterData.name ?? '',
                  style: const TextStyle(
                    color: RickAndMortyColors.white_000,
                    fontSize: 34,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    height: 0.03,
                    letterSpacing: 0.25,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                    characterData.status ?? '',
                  style: const TextStyle(
                    color: RickAndMortyColors.green,
                    fontSize: 10,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    height: 0.16,
                    letterSpacing: 1.50,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                 Text(
                  characterData.url ?? '',
                  style: const TextStyle(
                    color: RickAndMortyColors.white_000,
                    fontSize: 13,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    height: 0.12,
                    letterSpacing: 0.50,
                  ),
                )
              ],
            ),
            Positioned(
              top: 138,
              left: MediaQuery.of(context).size.width / 2 - 80,
              child: CircleAvatar(
                radius: 80,
                backgroundColor: RickAndMortyColors.darkBlue,
                child: CircleAvatar(
                  radius: 73,
                  backgroundImage: NetworkImage(
                    characterData.image ?? '',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
