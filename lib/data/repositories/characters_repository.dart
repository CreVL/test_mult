import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:test_mult/domain/entities/character.dart';

import '../../application/services/dio_client.dart';

class CharacterRepository {
  final Dio dio;

  CharacterRepository({required DioSettings dioClient})
      : dio = dioClient.dio;

  Future<List<CharactersMult>?> getCharacter() async {
      final Response response = await dio.get('character/');
      if (response.statusCode == 200) {
        if (response.data.containsKey('results')) {
          return (response.data['results'] as List)
              .map((characterData) =>
              CharactersMult.fromJson(characterData))
              .toList();
        } else {
          return null;
        }
      } else {
        return null;
      }
  }
}
