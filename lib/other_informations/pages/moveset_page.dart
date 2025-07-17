// ignore_for_file: use_build_context_synchronously
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/components/widgets/button_scaled.dart';
import 'package:pokedex/components/widgets/download_stream.dart';
import 'package:pokedex/games/widgets/games_tab.dart';
import 'package:pokedex/other_informations/cubit/moveset_cubit.dart';
import 'package:pokedex/other_informations/models/move_model.dart';
import 'package:pokedex/other_informations/widgets/ability_content.dart';
import 'package:pokedex/other_informations/widgets/move_content.dart';
import 'package:pokedex/pokemon/cubit/pokemon_cubit.dart';
import 'package:pokedex/route/go_router_config.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';

class MovesetPage extends StatelessWidget {
  const MovesetPage({
    required this.showEffect,
    super.key,
  });

  final bool showEffect;

  @override
  Widget build(BuildContext context) {
    // final gamesTab = context.watch<MovesetCubit>().gameTabCubit;

    return BlocBuilder<MovesetCubit, MovesetState>(
      builder: (context, state) {
        if (state.status == Status.loading) {
          return Center(
            child: CupertinoActivityIndicator(),
          );
        }
        if (state.status == Status.success) {
          return Column(
            children: [
              SizedBox(height: 30),
              // _buildGamesOption(state, appTheme),
              // GamesTab(
              //   games: gamesTab.state.games,
              //   gameSelected: gamesTab.state.gameSelected,
              //   onGameSelected: (game) {
              //     gamesTab.changeGameSelected(game);
              //   },
              // ),
              SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 30),
                      _buildAbilities(state, context),
                      SizedBox(height: 0),
                      _buildMoveset(context)
                    ],
                  ),
                ),
              ),
            ],
          );
        }
        return Container();
      },
    );
  }

  Widget _buildMoveset(BuildContext context) {
    final appTheme = Theme.of(context);
    return BlocBuilder<MovesetCubit, MovesetState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText.labelMedium(
                    context: context,
                    text: 'Moves',
                    color: appTheme.colorScheme.primary,
                    isFontBold: true,
                  ),
                  _buildDownloadButton(context, state)
                ],
              ),
            ),
            SizedBox(height: 30),
            _buildMovesLvUp(context, state, appTheme),
            SizedBox(height: 40),
            _buildMovesMachine(context, state, appTheme),
            SizedBox(height: 40),
            _buildMovesEgg(context, state, appTheme),
          ],
        );
      },
    );
  }

  Widget _buildMovesEgg(
    BuildContext context,
    MovesetState state,
    ThemeData appTheme,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (state.moveEgg.isNotEmpty) ...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: MyText.labelSmall(
              context: context,
              text: 'Moves egg',
              color: appTheme.colorScheme.primary,
              isFontBold: true,
            ),
          ),
          SizedBox(height: 10),
          _buildListMoves(state.moveEgg),
        ]
      ],
    );
  }

  Widget _buildMovesMachine(
    BuildContext context,
    MovesetState state,
    ThemeData appTheme,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (state.moveMachine.isNotEmpty) ...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: MyText.labelSmall(
              context: context,
              text: 'Moves machine (${state.moveMachine.length})',
              color: appTheme.colorScheme.primary,
              isFontBold: true,
            ),
          ),
          SizedBox(height: 10),
          _buildListMoves(state.moveMachine),
        ]
      ],
    );
  }

  Widget _buildMovesLvUp(
    BuildContext context,
    MovesetState state,
    ThemeData appTheme,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (state.moveLevelUp.isNotEmpty) ...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: MyText.labelSmall(
              context: context,
              text: 'Moves level-up (${state.moveLevelUp.length})',
              color: appTheme.colorScheme.primary,
              isFontBold: true,
            ),
          ),
          SizedBox(height: 10),
          _buildListMoves(state.moveLevelUp),
        ]
      ],
    );
  }

  Widget _buildDownloadButton(BuildContext context, MovesetState state) {
    final isDownloaded = state.isAllMovesDowloaded ?? false;

    final movesetCubit = context.watch<MovesetCubit>();
    return ButtonScaled(
      child: MyText.labelSmall(
        context: context,
        text: isDownloaded ? 'Show in table' : 'Download',
      ),
      onPress: () async {
        if (isDownloaded) {
          context.push(
            ScreenPaths.tableMoves,
            extra: state.pokemon,
          );
        } else {
          movesetCubit.downloadAllMoves();

          final showTable = await showDialog(
            barrierDismissible: false,
            barrierColor: Colors.black54,
            context: context,
            builder: (context) => Dialog(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // SizedBox(height: 10),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 16),
                    //   child: Align(
                    //     alignment: Alignment.centerRight,
                    //     child: GestureDetector(
                    //       onTap: () {
                    //         context
                    //             .read<MovesetCubit>()
                    //             .setShowDownloadIcon(true);
                    //         context.pop();
                    //       },
                    //       child: Icon(Icons.minimize),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(height: 20),
                    MyText.labelMedium(
                        context: context, text: 'Download in corso...'),
                    SizedBox(height: 30),
                    DownloadStream(
                      stream: movesetCubit.progressStream,
                    ),
                    SizedBox(height: 20),
                    ButtonScaled(
                      child:
                          MyText.labelMedium(context: context, text: 'Annulla'),
                      onPress: () {
                        movesetCubit.closeStream();
                        context.pop();
                      },
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          );
          await Future.delayed(Duration(milliseconds: 500));
          await context.read<MovesetCubit>().closeStream();

          if (showTable) {
            context.push(
              ScreenPaths.tableMoves,
              extra: state.pokemon,
            );
          }
        }
      },
    );
  }

  Widget _buildListMoves(List<MoveModel> list) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: list.length,
      itemBuilder: (context, index) {
        final item = list[index];
        return Column(
          children: [
            ExpansionTile(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.zero,
              ),
              title: MyText.labelMedium(
                context: context,
                text: item.move?.name?.toUpperCase() ?? '',
                isFontBold: true,
              ),
              children: [
                MoveContent(
                  move: item,
                  showEffect: showEffect,
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
          padding: EdgeInsets.zero,
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
