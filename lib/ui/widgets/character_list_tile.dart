import 'package:flutter/material.dart';

import '../../domain/entities/characters_data.dart';

class CharacterListTile extends StatelessWidget {
  const CharacterListTile({Key? key, required this.character}) : super(key: key);

  final CharactersData? character;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(8),
      child: ListTile(
        title: Text(
          character?.name ?? '',
          style: theme.textTheme.bodyMedium,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              character?.status ?? "",
              style: theme.textTheme.bodyMedium,
            ),
            Text(
              character?.species ?? "",
              style: theme.textTheme.bodyMedium,
            ),
            Text(
              character?.gender ?? "",
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ),
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(character?.image ?? ''),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
        ),
      ),
    );
  }
}
