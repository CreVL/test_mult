import 'package:test_mult/domain/entities/characters_mult.dart';
import 'package:test_mult/domain/entities/info.dart';

class Character {
  final Info? info;
  final List<CharactersMult>? results;

  Character({this.info, this.results});
}
