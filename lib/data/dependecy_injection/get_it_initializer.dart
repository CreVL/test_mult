import 'package:get_it/get_it.dart';
import 'package:test_mult/data/deserializers/character_deserializer/characters_mult_deserializer.dart';
import 'package:test_mult/data/deserializers/character_deserializer/origin_deserializer.dart';
import '../../../../application/usecases/get_character_usecase/get_character_usecase.dart';
import '../../../../data/repositories/backend_character_repository.dart';
import '../../../../application/repository/characters_repository.dart';
import '../services/dio_client.dart';

final _getIt = GetIt.instance;

class GetItInitializer {
  static void setUp() {
    _getIt.registerLazySingleton<CharacterRepository>(
      () => BackendCharacterRepository(
        charactersDataDeserializer: CharactersDataDeserializer(
            originDeserializer: OriginDeserializer()),
        dioClient: DioSettings(),
      ),
    );

    _getIt.registerLazySingleton<GetCharactersDataUsecase>(
        () => GetCharactersDataUsecase(_getIt<CharacterRepository>()));
  }
}
