import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/features/home/widget/filter_section_item.dart';
import 'package:pokedex/filters/cubit/filters_cubit.dart';

class FilterSection extends StatelessWidget {
  const FilterSection({
    required this.typesSelect,
    super.key,
  });

  final List<String> typesSelect;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Expanded(
            child: BlocBuilder<FiltersCubit, FiltersState>(
              builder: (context, state) {
                return FilterSectionItem(
                  text: 'Tipo',
                  typesSelect: typesSelect.toList(),
                  onPress: () async {
                    // await showModalBottomSheet(
                    //   context: context,
                    //   isScrollControlled: true,
                    //   backgroundColor: Colors.transparent,
                    //   builder: (context) => SizedBox(
                    //     height: MediaQuery.of(context).size.height *
                    //         0.7, // Altezza desiderata
                    //     child: const AllTypeModalWidget(),
                    //   ),
                    // );
                  },
                );
              },
            ),
          ),
          const SizedBox(width: 40),
          Expanded(
            child: FilterSectionItem(
              text: 'Ordine',
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
