import 'package:test_mult/domain/entities/characters_data.dart';
import 'package:test_mult/domain/entities/info.dart';

class Character {
  final Info? info;
  final List<CharactersData>? results;

  Character({this.info, this.results});
}
