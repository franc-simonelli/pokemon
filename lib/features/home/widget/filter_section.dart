import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/features/home/widget/filter_section_item.dart';
import 'package:pokedex/filters/widgets/all_type_widget.dart';
import 'package:pokedex/filters/cubit/filters_cubit.dart';

class FilterSection extends StatelessWidget {
  const FilterSection({
    super.key,
  });

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
                  typesSelect: state.typesSelect.toList(),
                  onPress: () async {
                    await showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (context) => SizedBox(
                        height: MediaQuery.of(context).size.height *
                            0.7, // Altezza desiderata
                        child: const AllTypeModalWidget(),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          const SizedBox(width: 20),
          const Expanded(
            child: FilterSectionItem(
              text: 'Ordine',
            ),
          ),
        ],
      ),
    );
  }
}
