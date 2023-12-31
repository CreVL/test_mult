import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_mult/routes/route_name.dart';
import 'package:test_mult/ui/resources/rick_and_morty_colors.dart';

import '../../domain/entities/characters_data.dart';

class CharacterListTile extends StatelessWidget {
  const CharacterListTile(
      {Key? key, required this.character, required this.onTap})
      : super(key: key);

  final CharactersData? character;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: InkWell(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(37.0),
          bottomLeft: Radius.circular(37.0),
        ),
        onTap: () {
          context.goNamed(RouteNames.viewPage, extra: character);
        },
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage('${character?.image}'),
              radius: 37,
            ),
            const SizedBox(
              width: 18,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  character?.status ?? "",
                  style: TextStyle(
                    color: character?.status == 'Alive'
                        ? RickAndMortyColors.green
                        : character?.status == 'Dead'
                            ? RickAndMortyColors.red
                            : RickAndMortyColors.gray,
                    fontSize: 10,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    height: 1.60,
                    letterSpacing: 1.50,
                  ),
                ),
                Text(
                  character?.name ?? '',
                  style: const TextStyle(
                      color: RickAndMortyColors.white_000,
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      height: 1.50,
                      letterSpacing: 0.50),
                ),
                Text(
                  character?.gender ?? "",
                  style: const TextStyle(
                      color: RickAndMortyColors.gray,
                      fontSize: 12,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      height: 1.33,
                      letterSpacing: 0.50),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
