import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/features/home/widget/filter_section_item.dart';
import 'package:pokedex/filters/cubit/filters_cubit.dart';
import 'package:pokedex/filters/widgets/all_type_widget.dart';

class FilterSection extends StatelessWidget {
  const FilterSection({
    required this.typesSelect,
    super.key,
  });

  final List<String> typesSelect;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Row(
        children: [
          Expanded(
            child: BlocBuilder<FiltersCubit, FiltersState>(
              builder: (context, state) {
                return FilterSectionItem(
                  text: state.typesSelect.isEmpty
                      ? 'Type '
                      : 'Type (${state.typesSelect.length})',
                  typesSelect: typesSelect.toList(),
                  onPress: () async {
                    final filtersCubit = context.read<FiltersCubit>();
                    await showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (context) => SizedBox(
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: AllTypeModalWidget(
                          filtersCubit: filtersCubit,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          const SizedBox(width: 40),
          Expanded(
            child: FilterSectionItem(
              text: 'Order',
              onPress: () {
                // context.read<FiltersCubit>().setParamsFilter('Spc.Atk');
              },
            ),
          ),
        ],
      ),
    );
  }
}
