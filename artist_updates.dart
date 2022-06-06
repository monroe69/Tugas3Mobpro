import 'package:flutter/material.dart';

import '../../../shared/classes/classes.dart';
import '../../../shared/views/outlined_card.dart';

class ArtistUpdates extends StatelessWidget {
  const ArtistUpdates({required this.artist});

  final Artist artist;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final update in artist.updates)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedCard(
              clickable: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 20,
                ),
                child: Text(update),
              ),
            ),
          )
      ],
    );
  }
}
