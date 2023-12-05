import 'package:mobx/mobx.dart';
import 'package:test_mult/application/usecases/get_character_usecase/get_character_usecase.dart';

import '../../../domain/entities/character.dart';

part 'character_controller.g.dart';

class CharacterController = _CharacterController with _$CharacterController;

abstract class _CharacterController with Store {
  @observable
  CharactersMult? character;

  @observable
  bool isLoading = false;

  final GetCharactersMultUsecase getCharactersMultUsecase;

  _CharacterController(this.getCharactersMultUsecase);

  @action
  Future<void> getCharacter() async {
    isLoading = true;
    try {
      character = await getCharactersMultUsecase.call();
    } catch (error) {
      print('$error');
    } finally {
      isLoading = false;
    }
  }
}