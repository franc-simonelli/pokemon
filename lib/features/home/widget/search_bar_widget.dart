import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/pokemon/cubit/pokemon_cubit.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({
    super.key,
  });

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  TextEditingController _searchController = TextEditingController();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchWithDebounce);
  }

  _onSearchWithDebounce() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      searchText();
    });
  }

  searchText() {
    context.read<PokemonCubit>().filterPokemonByText(_searchController.text);
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _debounce?.cancel();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    Brightness brightness = Theme.of(context).brightness;

    return Opacity(
      opacity: 1,
      child: Container(
        height: 44,
        decoration: BoxDecoration(
          color: brightness == Brightness.light
              ? Colors.white
              : appColors.background,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey, width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 14),
          child: TextField(
            controller: _searchController,
            cursorColor: appColors.primaryContainer,
            style: const TextStyle(fontSize: 18),
            decoration: InputDecoration(
              prefixIcon: const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: _searchController.text != ''
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            _searchController = TextEditingController();
                          });
                          searchText();
                        },
                        child: const Icon(
                          Icons.close,
                          color: Colors.grey,
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
              contentPadding: const EdgeInsets.only(bottom: 3, left: 10),
              hintText: 'Cerca',
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 17),
              border: const OutlineInputBorder(),
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
