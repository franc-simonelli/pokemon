// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';

class DismissibleCard extends StatelessWidget {
  const DismissibleCard({
    required this.child,
    required this.pokemon,
    required this.onDismissed,
    super.key,
  });

  final Widget child;
  final PokemonModel pokemon;
  final Function(PokemonModel) onDismissed;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(pokemon), // deve essere univoco
      direction: DismissDirection.endToStart, // swipe da destra verso sinistra
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (direction) async {
        await onDismissed(pokemon);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: MyText.labelMedium(
              context: context,
              text: '${pokemon.name} removed from favorites',
              color: Colors.white,
            ),
            backgroundColor: Colors.black,
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            duration: Duration(seconds: 2), //
          ),
        );
      },
      child: child,
    );
  }
}
