import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_mult/routes/route_name.dart';
import '../domain/entities/character.dart';
import '../domain/entities/characters_data.dart';
import '../ui/pages/character_page/character_page.dart';
import '../ui/pages/character_view_page/character_view_page.dart';

class RouteConfig {
  static GoRouter returnRouter() {
    return GoRouter(
      initialLocation: '/',
      routes: <RouteBase>[
        GoRoute(
            path: '/',
            name: RouteNames.initial,
            routes: <RouteBase>[
              GoRoute(
                path: 'viewPage',
                name: RouteNames.viewPage,
                builder: (context, state) {
                  CharactersData characterData = state.extra as CharactersData;
                  return CharacterViewPage(
                    characterData: characterData,
                  );
                },
              )
            ],
            pageBuilder: (context, state) {
              return const MaterialPage(
                child: CharacterPage(
                  title: 'Rick and Morty',
                ),
              );
            }),
      ],
    );
  }
}

