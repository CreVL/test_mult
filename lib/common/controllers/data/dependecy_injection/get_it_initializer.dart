

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'application/services/dio_client.dart';
import 'application/usecases/get_character_usecase/get_character_usecase.dart';
import 'data/repositories/characters_repository.dart';

final _getIt = GetIt.instance;

class GetItInitializer {
  static void setUp() {
    _getIt.registerLazySingleton<Dio>(() => Dio());
    _getIt.registerLazySingleton<CharacterRepository>(
            () => CharacterRepository(dioClient: DioSettings()));
    _getIt.registerLazySingleton<GetCharactersMultUsecase>(
            () => GetCharactersMultUsecase(_getIt<CharacterRepository>()));
  }
}