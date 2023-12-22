import 'package:flutter/material.dart';
import 'package:test_mult/routes/route_config.dart';
import 'package:test_mult/ui/resources/rick_and_morty_colors.dart';
import 'data/dependecy_injection/get_it_initializer.dart';

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
    return MaterialApp.router(
      routerConfig: RouteConfig.returnRouter(),
      title: 'Flutter Demo',
      theme: ThemeData(
        dividerColor: RickAndMortyColors.darkBlue,
        scaffoldBackgroundColor: RickAndMortyColors.darkBlue,
        colorScheme: ColorScheme.fromSeed(seedColor: RickAndMortyColors.darkBlue),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(backgroundColor: RickAndMortyColors.darkBlue),
        listTileTheme: const ListTileThemeData(iconColor: Colors.grey),
      ),
    );
  }
}