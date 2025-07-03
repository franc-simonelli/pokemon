import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/search_pokemon/cubit/search_pokemon_cubit.dart';
import 'package:pokedex/theme/app_colors.dart';

class PkmInputSearchBar extends StatefulWidget {
  const PkmInputSearchBar({
    super.key,
  });

  @override
  State<PkmInputSearchBar> createState() => _PkmInputSearchBarState();
}

class _PkmInputSearchBarState extends State<PkmInputSearchBar>
    with SingleTickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  late FocusNode _focusNode;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _searchController.addListener(_onSearchWithDebounce);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  _onSearchWithDebounce() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      searchText();
    });
  }

  searchText() {
    context.read<SearchPokemonCubit>().filterPokemons(_searchController.text);
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _debounce?.cancel();
    _searchController.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    final color = Theme.of(context).scaffoldBackgroundColor;
    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade800,
            offset: const Offset(0, -1),
          ),
          BoxShadow(
            color: Colors.black,
            offset: Offset(3, 3),
          )
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 14),
        child: TextField(
          focusNode: _focusNode,
          controller: _searchController,
          cursorColor: appColors.primaryContainer,
          style: const TextStyle(fontSize: 18),
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: EdgeInsets.only(top: 10),
              child: Icon(
                Icons.search,
                color: AppColors.lightGrey,
              ),
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: _searchController.text != ''
                  ? GestureDetector(
                      onTap: () {
                        _searchController.text = '';
                        searchText();
                      },
                      child: Icon(
                        Icons.close,
                        color: AppColors.lightGrey,
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
            contentPadding: const EdgeInsets.only(bottom: 3, left: 10),
            hintText: 'Cerca un pokemon . . .',
            hintStyle: const TextStyle(
              color: AppColors.lightGrey,
              fontSize: 16,
              fontStyle: FontStyle.italic,
            ),
            border: const OutlineInputBorder(),
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
