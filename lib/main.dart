import 'package:flutter/material.dart';
import 'package:test_mult/ui/pages/character_page/character_page.dart';
import 'common/controllers/data/dependecy_injection/get_it_initializer.dart';

void main() {
  appStart();
  runApp(const MyApp());
}

void appStart() async {
  GetItInitializer.setUp();
  WidgetsFlutterBinding.ensureInitialized();
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
