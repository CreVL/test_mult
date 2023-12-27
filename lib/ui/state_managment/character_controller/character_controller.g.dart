// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CharacterController on CharacterControllerBase, Store {
  late final _$characterAtom =
      Atom(name: 'CharacterControllerBase.character', context: context);

  @override
  List<CharactersData>? get character {
    _$characterAtom.reportRead();
    return super.character;
  }

  @override
  set character(List<CharactersData>? value) {
    _$characterAtom.reportWrite(value, super.character, () {
      super.character = value;
    });
  }

  late final _$episodeAtom =
      Atom(name: 'CharacterControllerBase.episode', context: context);

  @override
  List<CharacterEpisode>? get episode {
    _$episodeAtom.reportRead();
    return super.episode;
  }

  @override
  set episode(List<CharacterEpisode>? value) {
    _$episodeAtom.reportWrite(value, super.episode, () {
      super.episode = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'CharacterControllerBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$getCharacterAsyncAction =
      AsyncAction('CharacterControllerBase.getCharacter', context: context);

  @override
  Future<void> getCharacter() {
    return _$getCharacterAsyncAction.run(() => super.getCharacter());
  }

  late final _$getEpisodeAsyncAction =
      AsyncAction('CharacterControllerBase.getEpisode', context: context);

  @override
  Future<void> getEpisode(int characterId) {
    return _$getEpisodeAsyncAction.run(() => super.getEpisode(characterId));
  }

  @override
  String toString() {
    return '''
character: ${character},
episode: ${episode},
isLoading: ${isLoading}
    ''';
  }
}
