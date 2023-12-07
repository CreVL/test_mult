import 'package:mobx/mobx.dart';
import 'package:test_mult/application/usecases/get_character_usecase/get_character_usecase.dart';

import '../../../domain/entities/characters_mult.dart';

part 'character_controller.g.dart';

class CharacterController = _CharacterController with _$CharacterController;

abstract class _CharacterController with Store {
  final GetCharactersMultUsecase getCharactersMultUsecase;

  _CharacterController(this.getCharactersMultUsecase);

  @observable
  List<CharactersMult>? character;

  @observable
  bool isLoading = false;

  @action
  Future<void> getCharacter() async {
    isLoading = true;
      character = await getCharactersMultUsecase.call();
      isLoading = false;
  }
}
