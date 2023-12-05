import 'package:flutter/material.dart';

import '../../domain/entities/character.dart';

class CharacterListTile extends StatelessWidget {
  CharacterListTile({Key? key, characterStatus, required this.characters})
      : super(key: key);

  final CharactersMult characters;

  @override
  Widget build(BuildContext context) {


    final theme = Theme.of(context);

    return ListTile(
      title: Text(
        characters.status ?? '',
        style: theme.textTheme.bodyMedium,
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
      ),
    );
  }
}
