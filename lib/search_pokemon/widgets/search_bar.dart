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

class _SearchBarPokemonState extends State<SearchBarPokemon>
    with SingleTickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  late FocusNode _focusNode;
  Timer? _debounce;
  // late AnimationController _controller;
  // late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    // _controller = AnimationController(
    //   vsync: this,
    //   duration: Duration(milliseconds: 600),
    // )..repeat(reverse: true);

    // _rotationAnimation = Tween<double>(begin: -0.05, end: 0.05).animate(
    //   CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    // );

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
    // _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    final color = Theme.of(context).scaffoldBackgroundColor;
    return Opacity(
      opacity: 1,
      child: Container(
        height: 44,
        decoration: BoxDecoration(
          color: color,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade700,
              offset: const Offset(0, -1),
            ),
            BoxShadow(
              color: Colors.black,
              offset: Offset(2, 2),
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
                // child: RotationTransition(
                //   turns: _rotationAnimation,
                //   child: Icon(
                //     Icons.search,
                //     color: Colors.grey,
                //   ),
                // ),
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
              hintText: 'Cerca un pokemon . . .',
              hintStyle: const TextStyle(
                color: Colors.grey,
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
      ),
    );
  }
}
