import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:test_mult/domain/entities/characters_data.dart';
import 'package:test_mult/internal/serializers/iterable_deserializer.dart';

import '../../application/services/dio_client.dart';
import '../../internal/serializers/json_deserializer.dart';
import '../../application/repository/characters_repository.dart';

class BackendCharacterRepository implements CharacterRepository {
  final JsonDeserializer<CharactersData> charactersDataDeserializer;
  final Dio dio;

  BackendCharacterRepository({
    required this.charactersDataDeserializer,
    required DioSettings dioClient,
  }) : dio = dioClient.dio;

  @override
  Future<List<CharactersData>?> getCharacters() async {
    try {
      final Response response = await dio.get('character/');

      if (response.statusCode == 200) {
        if (response.data.containsKey('results')) {
          final List<CharactersData> characters = charactersDataDeserializer
              .iterableFrom(response.data['results'])
              .toList();
          return characters;
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (error) {
      debugPrint('ошибка запроса: $error');
      return null;
    }
  }
}
