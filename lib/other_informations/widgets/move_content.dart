import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/other_informations/cubit/moveset_cubit.dart';
import 'package:pokedex/other_informations/models/move_model.dart';
import 'package:pokedex/pokemon/widget/info_section.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';

class MoveContent extends StatefulWidget {
  const MoveContent({
    required this.move,
    required this.showEffect,
    super.key,
  });

  final MoveModel move;
  final bool showEffect;

  @override
  State<MoveContent> createState() => _MoveContentState();
}

class _MoveContentState extends State<MoveContent> {
  @override
  void initState() {
    context.read<MovesetCubit>().checkMoveById(widget.move);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.move.isDownloaded != true
        ? Center(
            child: CupertinoActivityIndicator(),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // type / category
                Row(
                  children: [
                    Expanded(child: Container()),
                    Expanded(
                      flex: 3,
                      child: _buildType(),
                    ),
                    Expanded(child: Container()),
                    Expanded(
                      flex: 3,
                      child: _buildCategory(),
                    ),
                    Expanded(child: Container()),
                  ],
                ),
                SizedBox(height: 16),
                // stats
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildStats(
                        context: context,
                        text: 'Pow.',
                        value: widget.move.power != null
                            ? widget.move.power.toString()
                            : '-'),
                    _buildStats(
                        context: context,
                        text: 'Acc.',
                        value: widget.move.accuracy != null
                            ? "${widget.move.accuracy.toString()} %"
                            : '-'),
                    _buildStats(
                        context: context,
                        text: 'PP',
                        value: widget.move.pp != null
                            ? widget.move.pp.toString()
                            : '-'),
                  ],
                ),
                SizedBox(height: 16),
                // desc move

                if (widget.showEffect) ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: MyText.labelSmall(
                      context: context,
                      text: widget.move.effectEntries?.effect ?? '',
                    ),
                  ),
                  SizedBox(height: 20),
                ]
              ],
            ),
          );
  }

  Widget _buildStats({
    required BuildContext context,
    required String text,
    required String value,
  }) {
    return Column(
      children: [
        MyText.labelSmall(
          context: context,
          text: text,
        ),
        MyText.labelMedium(
          context: context,
          text: value,
          isFontBold: true,
        ),
      ],
    );
  }

  Widget _buildType() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InfoSection(
          element: widget.move.type ?? '',
          isBorder: true,
        ),
      ],
    );
  }

  Widget _buildCategory() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 1, 0.004)
            ..rotateX(0.0)
            ..rotateY(0.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.black54,
              border: Border.all(color: Colors.white),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 5,
                right: 10,
                top: 5,
                bottom: 5,
              ),
              child: Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: widget.move.generateColorCategory,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    widget.move.damageClass ?? '',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
