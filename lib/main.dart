import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:test_mult/ui/pages/character_page/character_page.dart';

import 'application/services/dio_client.dart';
import 'data/repositories/characters_repository.dart';


void main() {
  final getIt = GetIt.instance;

  getIt.registerSingleton<DioSettings>(DioSettings());

  getIt.registerLazySingleton<CharacterRepository>(() => CharacterRepository(
    dio: getIt<DioSettings>().dio,
    baseUrl: 'https://rickandmortyapi.com/api/',
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          dividerColor: Colors.black,
          scaffoldBackgroundColor: Colors.white10,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.white10),
          textTheme: const TextTheme(
              bodyMedium: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 20)),
          listTileTheme: const ListTileThemeData(iconColor: Colors.grey)),
      home: const CharacterPage(title: 'Rick and Morty'),
    );
  }
}