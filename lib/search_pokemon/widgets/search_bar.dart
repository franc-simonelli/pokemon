import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/search_pokemon/cubit/search_pokemon_cubit.dart';

class SearchBarPokemon extends StatefulWidget {
  const SearchBarPokemon({
    super.key,
  });

  @override
  State<SearchBarPokemon> createState() => _SearchBarPokemonState();
}

class _SearchBarPokemonState extends State<SearchBarPokemon> {
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

    return Opacity(
      opacity: 1,
      child: Container(
        height: 44,
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade800,
              offset: const Offset(-1, -1),
            ),
            const BoxShadow(
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
                          _searchController.text = '';
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
