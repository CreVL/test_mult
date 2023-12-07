import 'package:mobx/mobx.dart';
import 'package:test_mult/application/usecases/get_character_usecase/get_character_usecase.dart';

import '../../../domain/entities/characters_data.dart';

part 'character_controller.g.dart';

class CharacterController = CharacterControllerBase with _$CharacterController;

abstract class CharacterControllerBase with Store {
  final GetCharactersDataUsecase getCharactersDataUsecase;

  CharacterControllerBase(this.getCharactersDataUsecase);

  @observable
  List<CharactersData>? character;

  @observable
  bool isLoading = false;

  @action
  Future<void> getCharacter() async {
    isLoading = true;
    character = await getCharactersDataUsecase.call();
    isLoading = false;
  }
}
