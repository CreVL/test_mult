import 'package:test_mult/domain/entities/origin.dart';

class CharactersMult {
  final int? id;
  final String? name;
  final String? status;
  final String? species;
  final String? type;
  final String? gender;
  final Origin? origin;
  final Origin? location;
  final String? image;
  final List<String>? episode;
  final String? url;
  final String? created;

  CharactersMult(
      {this.id,
        this.name,
        this.status,
        this.species,
        this.type,
        this.gender,
        this.origin,
        this.location,
        this.image,
        this.episode,
        this.url,
        this.created});
}