import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/shared/widget/content_modal_widget.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';
import 'package:pokedex/stats_pokemon/models/nature_enum.dart';

class NatureList extends StatelessWidget {
  const NatureList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ContentModalWidget(
      title: MyText.labelLarge(
        context: context,
        text: 'Select nature',
      ),
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: Nature.values.length,
                  itemBuilder: (context, index) {
                    final nature = Nature.values[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: InkWell(
                        onTap: () {
                          return context.pop(nature);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade800),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ListTile(
                            title: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: MyText.labelMedium(
                                    context: context,
                                    text: nature.getDesc(),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: _buildStatUp(context, nature),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: _buildStatDown(context, nature),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatUp(BuildContext context, Nature nature) {
    return Row(
      children: [
        Icon(
          Icons.keyboard_double_arrow_up_outlined,
          color: Colors.green,
        ),
        SizedBox(width: 8),
        MyText.labelSmall(
          context: context,
          text: nature.getStatUp().getDesc(),
        ),
      ],
    );
  }

  Widget _buildStatDown(BuildContext context, Nature nature) {
    return Row(
      children: [
        Icon(
          Icons.keyboard_double_arrow_down_outlined,
          color: Colors.red,
        ),
        SizedBox(width: 8),
        MyText.labelSmall(
          context: context,
          text: nature.getStatDown().getDesc(),
        ),
      ],
    );
  }
}
