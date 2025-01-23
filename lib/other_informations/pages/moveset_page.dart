import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/other_informations/cubit/moveset_cubit.dart';
import 'package:pokedex/other_informations/widgets/ability_content.dart';
import 'package:pokedex/other_informations/widgets/move_content.dart';
import 'package:pokedex/pokemon/cubit/pokemon_cubit.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';

class MovesetPage extends StatefulWidget {
  const MovesetPage({
    super.key,
  });

  @override
  State<MovesetPage> createState() => _MovesetPageState();
}

class _MovesetPageState extends State<MovesetPage> {
  bool onlyStats = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovesetCubit, MovesetState>(
      builder: (context, state) {
        if (state.status == Status.loading) {
          return Scaffold(
            body: Center(
              child: CupertinoActivityIndicator(),
            ),
          );
        }
        if (state.status == Status.success) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                _buildAbilities(state, context),
                SizedBox(height: 20),
                _buildMoveset(state, context)
              ],
            ),
          );
        }
        return Container();
      },
    );
  }

  Widget _buildMoveset(MovesetState state, BuildContext context) {
    final appTheme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText.labelMedium(
                context: context,
                text: 'Moves',
                color: appTheme.colorScheme.primary,
                isFontBold: true,
              ),
              _buildSwitchMoves()
            ],
          ),
        ),
        SizedBox(height: 10),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: state.moveset?.moves?.length,
          itemBuilder: (context, index) {
            final item = state.moveset?.moves?[index];
            return Column(
              children: [
                ExpansionTile(
                  // initiallyExpanded: item?.isDownloaded ?? false,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.zero,
                  ),
                  // title: MyTextTranslateMedium(
                  //   key: UniqueKey(),
                  //   text: item?.move?.name?.toUpperCase() ?? '',
                  //   isFontBold: true,
                  // ),
                  title: MyText.labelMedium(
                    context: context,
                    text: item?.move?.name?.toUpperCase() ?? '',
                    isFontBold: true,
                  ),
                  children: [
                    MoveContent(
                      move: item!,
                      onlyStats: onlyStats,
                    ),
                  ],
                ),
                Divider(
                  endIndent: 20,
                  indent: 20,
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _buildSwitchMoves() {
    final appTheme = Theme.of(context).colorScheme;
    return Row(
      children: [
        MyText.labelSmall(context: context, text: 'Show  effect desc.'),
        SizedBox(width: 10),
        CupertinoSwitch(
          activeColor: appTheme.primaryContainer,
          value: onlyStats,
          onChanged: (value) {
            setState(() {
              onlyStats = value;
            });
          },
        ),
      ],
    );
  }

  Widget _buildAbilities(MovesetState state, BuildContext context) {
    final appTheme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: MyText.labelMedium(
            context: context,
            text: 'Abilities',
            color: appTheme.colorScheme.primary,
            isFontBold: true,
          ),
        ),
        SizedBox(height: 10),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: state.moveset?.abilities?.length,
          itemBuilder: (context, index) {
            final item = state.moveset?.abilities?[index];
            return Column(
              children: [
                ExpansionTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  // title: MyTextTranslateMedium(
                  //   text: item?.ability?.name?.toUpperCase() ?? '',
                  //   isFontBold: true,
                  // ),
                  title: MyText.labelMedium(
                    context: context,
                    text: item?.ability?.name?.toUpperCase() ?? '',
                    isFontBold: true,
                  ),
                  children: [
                    AbilityContent(ability: item!),
                  ],
                ),
                Divider(
                  endIndent: 20,
                  indent: 20,
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
