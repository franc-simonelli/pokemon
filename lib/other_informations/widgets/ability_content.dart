import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/other_informations/cubit/moveset_cubit.dart';
import 'package:pokedex/other_informations/models/moveset_model.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';

class AbilityContent extends StatefulWidget {
  const AbilityContent({
    required this.ability,
    super.key,
  });

  final AbilitiesModel ability;

  @override
  State<AbilityContent> createState() => _AbilityContentState();
}

class _AbilityContentState extends State<AbilityContent> {
  @override
  void initState() {
    context.read<MovesetCubit>().checkAbilityById(widget.ability);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.ability.isDownloaded != true
        ? Center(
            child: CupertinoActivityIndicator(),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: MyText.labelSmall(
                        context: context,
                        text: widget.ability.effectEntries?.effect ?? '',
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
          );
  }
}
