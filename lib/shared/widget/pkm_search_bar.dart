import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/route/go_router_config.dart';
import 'package:pokedex/theme/app_colors.dart';

class PkmSearchBar extends StatelessWidget {
  const PkmSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).scaffoldBackgroundColor;
    return GestureDetector(
      onTap: () {
        context.push(ScreenPaths.searchPokemon, extra: false);
      },
      child: Container(
        height: 44,
        decoration: BoxDecoration(
          color: color,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade800,
              offset: const Offset(0, -1),
            ),
            BoxShadow(
              color: Colors.black,
              offset: Offset(3, 3),
            )
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Icon(
                Icons.search,
                color: AppColors.lightGrey,
              ),
            ),
            Text(
              'Cerca un pokemon . . .',
              style: TextStyle(
                color: AppColors.lightGrey,
                fontSize: 16,
                fontStyle: FontStyle.italic,
              ),
            )
          ],
        ),
      ),
    );
  }
}
