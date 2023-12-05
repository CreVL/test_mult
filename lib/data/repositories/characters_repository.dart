import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:test_mult/domain/entities/character.dart';

class CharacterRepository {
  final Dio dio;
  final String baseUrl;

  CharacterRepository({required this.dio, required this.baseUrl});

  Future<CharactersMult> getCharacter() async {
    final response = await dio.get('character/');

    return CharactersMult.fromJson(response.data);
  }
}