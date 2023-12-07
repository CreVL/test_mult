import 'package:dio/dio.dart';
import 'package:test_mult/domain/entities/characters_mult.dart';
import 'package:test_mult/internal/serializers/iterable_deserializer.dart';


import '../../application/services/dio_client.dart';
import '../../internal/serializers/json_deserializer.dart';
import 'characters_repository.dart';

class BackendCharacterRepository implements CharacterRepository {
  final JsonDeserializer<CharactersMult> charactersMultDeserializer;
  final Dio dio;

  BackendCharacterRepository({
    required this.charactersMultDeserializer,
    required DioSettings dioClient,
  }) : dio = dioClient.dio;

  @override
  Future<List<CharactersMult>?> getCharacters() async {
    try {
      final Response response = await dio.get('character/');

      if (response.statusCode == 200) {
        if (response.data.containsKey('results')) {
          final List<CharactersMult> characters = charactersMultDeserializer
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
      print('ошибка запрос: $error');
      return null;
    }
  }
}



// @override
// Future<List<Checkpoint>?> getCheckpoints({
//   String? nameContains,
// }) async {
//   final queryParameters = {
//     if (nameContains != null) "name__contains": nameContains,
//   };
//   final response = await _httpClient.get(
//     RoadObjectsQuestionnaireUrls.checkpoints,
//     queryParameters: queryParameters,
//   );
//   if (response?.data == null || response?.statusCode != 200) return null;
//   return checkpointDeserializer.iterableFrom(response!.data!).toList();
// }




// class CharacterRepository {
//   final Dio dio;
//
//   CharacterRepository({required DioSettings dioClient})
//       : dio = dioClient.dio;
//
//   Future<List<CharactersMult>?> getCharacters() async {
//     final Response response = await dio.get('character/');
//     if (response.statusCode == 200) {
//       if (response.data.containsKey('results')) {
//         return (response.data['results'] as List)
//             .map((characterData) =>
//             CharactersMult.fromJson(characterData))
//             .toList();
//       } else {
//         return null;
//       }
//     } else {
//       return null;
//     }
//   }
// }