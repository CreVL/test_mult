import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:test_mult/domain/entities/characters_data.dart';
import 'package:test_mult/internal/serializers/iterable_deserializer.dart';
import '../../domain/entities/character_episode.dart';
import '../../internal/serializers/json_deserializer.dart';
import '../../application/repository/characters_repository.dart';
import '../services/dio_client.dart';

class BackendCharacterRepository implements CharacterRepository {
  final JsonDeserializer<CharactersData> charactersDataDeserializer;
  final JsonDeserializer<CharacterEpisode> characterEpisodeDeserializer;
  final Dio dio;

  BackendCharacterRepository({
    required this.charactersDataDeserializer,
    required this.characterEpisodeDeserializer,
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

  @override
  Future<List<CharacterEpisode>?> getEpisode(int characterId) async {
    try {
      final Response response = await dio.get('episode/', queryParameters: {
        'character': characterId,
      });

      if (response.statusCode == 200) {
        if (response.data.containsKey('results')) {
          final List<CharacterEpisode> episodes = characterEpisodeDeserializer
              .iterableFrom(response.data['results'])
              .where((episode) =>
              episode.characters!.contains(
                  'https://rickandmortyapi.com/api/character/$characterId'))
              .toList();

          return episodes.isNotEmpty ? episodes : null;
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
