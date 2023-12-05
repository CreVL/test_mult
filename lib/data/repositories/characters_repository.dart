import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:test_mult/domain/entities/character.dart';

import '../../application/services/dio_client.dart';

class CharacterRepository {
  final Dio dio;

  CharacterRepository({required DioSettings dioClient}) : dio = dioClient.dio;

  Future<CharactersMult> getCharacter() async {
    try {
      final Response response = await dio.get('character/');

      print('Response data: ${response.data}');

      return CharactersMult.fromJson(response.data);
    } catch (error) {
      print('$error');
      throw error;
    }
  }
}
