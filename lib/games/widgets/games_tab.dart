import 'package:flutter/material.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';

class GamesTab extends StatefulWidget {
  const GamesTab({
    required this.games,
    required this.gameSelected,
    required this.onGameSelected,
    super.key,
  });

  final List<String> games;
  final String gameSelected;
  final Function onGameSelected;

  @override
  State<GamesTab> createState() => _GamesTabState();
}

class _GamesTabState extends State<GamesTab> {
  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: SizedBox(
        height: 35,
        child: ListView.builder(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          itemCount: widget.games.length,
          itemBuilder: (context, index) {
            final game = widget.games[index];
            final isSelected = widget.gameSelected == game;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GestureDetector(
                onTap: () {
                  widget.onGameSelected(game);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 100),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: isSelected
                          ? Colors.white
                          : appTheme.colorScheme.primaryContainer,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    color: isSelected
                        ? appTheme.colorScheme.onSecondary
                        : appTheme.colorScheme.primaryContainer,
                  ),
                  child: Center(
                    child: MyText.labelSmall(
                      context: context,
                      text: game,
                      color: Colors.white,
                    ),
                  ),
                ),
                // child: Chip(
                //   label: MyText.labelSmall(
                //     context: context,
                //     text: game,
                //   ),
                //   backgroundColor: isSelected
                //       ? appTheme.colorScheme.secondaryContainer
                //       : appTheme.colorScheme.primaryContainer,
                // ),
              ),
            );
          },
        ),
      ),
    );
  }
}
