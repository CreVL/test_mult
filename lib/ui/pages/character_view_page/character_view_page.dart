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
            SingleChildScrollView(
              child: Column(
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
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        CharacterDetails(
                          subTitle: characterData.gender ?? '',
                          title: 'Пол',
                        ),
                        const Spacer(),
                        CharacterDetails(
                          subTitle: characterData.species ?? '',
                          title: 'Расса',
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              CharacterDetails(
                                subTitle: characterData.origin?.name ?? '',
                                title: 'Место рождения',
                              )
                            ],
                          ),
                          const Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: RickAndMortyColors.white_000,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              CharacterDetails(
                                subTitle: characterData.location?.name ?? '',
                                title: 'Местоположение',
                              )
                            ],
                          ),
                          const Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: RickAndMortyColors.white_000,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  const Divider(
                    height: 2,
                    color: RickAndMortyColors.dividerBlue,
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Text(
                          'Эпизоды',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            height: 0.07,
                            letterSpacing: 0.15,
                          ),
                        ),
                        Spacer(),
                        Text(
                          'Все эпизоды',
                          style: TextStyle(
                            color: Color(0xFF5B6975),
                            fontSize: 12,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            height: 0.11,
                            letterSpacing: 0.50,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) =>
                        Text(characterData.episode?[index] ?? ''),
                    itemCount: characterData.episode?.length,
                  ),
                ],
              ),
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

class CharacterDetails extends StatelessWidget {
  const CharacterDetails(
      {Key? key, required this.title, required this.subTitle})
      : super(key: key);

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFF5B6975),
            fontSize: 12,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            height: 0.11,
            letterSpacing: 0.50,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          subTitle,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            height: 0.10,
            letterSpacing: 0.25,
          ),
        ),
      ],
    );
  }
}
