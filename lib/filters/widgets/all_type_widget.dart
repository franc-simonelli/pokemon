import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/shared/widget/content_modal_widget.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';
import 'package:pokedex/filters/cubit/filters_cubit.dart';
import 'package:pokedex/filters/widgets/item_type_widget.dart';

class AllTypeModalWidget extends StatelessWidget {
  const AllTypeModalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FiltersCubit, FiltersState>(
      builder: (context, state) {
        return ContentModalWidget(
          title: const Text(''),
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () async {
                    // await context.read<TypeCubit>().removeAllTypes();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 26),
                    child: MyText.labelSmall(
                      context: context,
                      text: 'Remove all',
                    ),
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    // physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.fromLTRB(26, 26, 26, 50),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                    ),
                    itemCount: state.allTypes.length,
                    itemBuilder: (_, i) {
                      final item = state.allTypes[i];
                      final isSelect = state.typesSelect.contains(item);
                      return InkWell(
                        onTap: () async {
                          await context
                              .read<FiltersCubit>()
                              .selectFilters(item);
                          // await Future.delayed(Duration(milliseconds: 400));

                          // await context
                          //     .read<PokemonCubit>()
                          //     .filterPokemonByType(list);
                        },
                        child: ItemTypeWidget(
                          type: item,
                          isSelect: isSelect,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
    //   },
    // );
  }
}
