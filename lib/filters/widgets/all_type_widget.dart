import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/components/widgets/button_scaled.dart';
import 'package:pokedex/shared/widget/content_modal_widget.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';
import 'package:pokedex/filters/cubit/filters_cubit.dart';
import 'package:pokedex/filters/widgets/item_type_widget.dart';

class AllTypeModalWidget extends StatelessWidget {
  const AllTypeModalWidget({
    required this.filtersCubit,
    super.key,
  });

  final FiltersCubit filtersCubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FiltersCubit, FiltersState>(
      bloc: filtersCubit,
      builder: (context, state) {
        return ContentModalWidget(
          title: const Text(''),
          child: Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ButtonScaled(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: MyText.labelSmall(
                        context: context,
                        text: 'Remove all',
                      ),
                    ),
                    onPress: () async {
                      await filtersCubit.removeAllTypes();
                    },
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 0.7,
                        crossAxisSpacing: 30,
                        mainAxisSpacing: 20,
                      ),
                      itemCount: state.allTypes.length,
                      itemBuilder: (_, i) {
                        final item = state.allTypes[i];
                        final isSelect = state.typesSelect.contains(item);

                        return InkWell(
                          onTap: () async {
                            await filtersCubit.selectFilters(item);
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
          ),
        );
      },
    );
    //   },
    // );
  }
}
