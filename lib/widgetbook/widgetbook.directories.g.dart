// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:pokedex/widgetbook/lib/features/home/home_screen.dart' as _i2;
import 'package:pokedex/widgetbook/lib/features/home/widget/filter_section.dart'
    as _i3;
import 'package:pokedex/widgetbook/lib/features/home/widget/filter_section_item.dart'
    as _i4;
import 'package:pokedex/widgetbook/lib/features/home/widget/search_bar_widget.dart'
    as _i5;
import 'package:pokedex/widgetbook/lib/pokemon/card_pokemon.dart' as _i6;
import 'package:pokedex/widgetbook/lib/pokemon/image_type.dart' as _i7;
import 'package:pokedex/widgetbook/lib/pokemon/info_section.dart' as _i8;
import 'package:pokedex/widgetbook/lib/pokemon/info_type_section.dart' as _i9;
import 'package:pokedex/widgetbook/lib/type/all_type_widget.dart' as _i10;
import 'package:pokedex/widgetbook/lib/type/item_type_widget.dart' as _i11;
import 'package:widgetbook/widgetbook.dart' as _i1;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'features',
    children: [
      _i1.WidgetbookFolder(
        name: 'home',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'HomeScreen',
            useCase: _i1.WidgetbookUseCase(
              name: 'Home screen',
              builder: _i2.homeScreen,
            ),
          ),
          _i1.WidgetbookFolder(
            name: 'widget',
            children: [
              _i1.WidgetbookLeafComponent(
                name: 'FilterSection',
                useCase: _i1.WidgetbookUseCase(
                  name: 'Filter section',
                  builder: _i3.filterSection,
                ),
              ),
              _i1.WidgetbookLeafComponent(
                name: 'FilterSectionItem',
                useCase: _i1.WidgetbookUseCase(
                  name: 'Filter section item',
                  builder: _i4.filterSectionItem,
                ),
              ),
              _i1.WidgetbookLeafComponent(
                name: 'SearchBarWidget',
                useCase: _i1.WidgetbookUseCase(
                  name: 'Search bar',
                  builder: _i5.searchBar,
                ),
              ),
            ],
          ),
        ],
      )
    ],
  ),
  _i1.WidgetbookFolder(
    name: 'pokemon',
    children: [
      _i1.WidgetbookFolder(
        name: 'widget',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'CardItem',
            useCase: _i1.WidgetbookUseCase(
              name: 'Card pokemon',
              builder: _i6.cardPokemon,
            ),
          ),
          _i1.WidgetbookComponent(
            name: 'ImageType',
            useCases: [
              _i1.WidgetbookUseCase(
                name: 'Image type fire',
                builder: _i7.typeImageFire,
              ),
              _i1.WidgetbookUseCase(
                name: 'Image type grass',
                builder: _i7.typeImageGrass,
              ),
              _i1.WidgetbookUseCase(
                name: 'Image type slider',
                builder: _i7.typeImageSlider,
              ),
              _i1.WidgetbookUseCase(
                name: 'Image type water',
                builder: _i7.typeImageWater,
              ),
            ],
          ),
          _i1.WidgetbookComponent(
            name: 'InfoSection',
            useCases: [
              _i1.WidgetbookUseCase(
                name: 'Info section',
                builder: _i8.cardPokemon,
              ),
              _i1.WidgetbookUseCase(
                name: 'Info type section',
                builder: _i9.cardPokemon,
              ),
            ],
          ),
        ],
      )
    ],
  ),
  _i1.WidgetbookFolder(
    name: 'type',
    children: [
      _i1.WidgetbookLeafComponent(
        name: 'AllTypeModalWidget',
        useCase: _i1.WidgetbookUseCase(
          name: 'All type widget',
          builder: _i10.allTypeModalWidget,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'ItemTypeWidget',
        useCase: _i1.WidgetbookUseCase(
          name: 'Item type widget',
          builder: _i11.itemTypeWidget,
        ),
      ),
    ],
  ),
];
