// ignore_for_file: deprecated_member_use

import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/pokemon/widget/info_section.dart';
import 'package:pokedex/shared/utils/capitaliza_first_letter.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';

enum EnumRelation {
  weaknesses,
  resistence,
  immunity;

  String get title {
    switch (this) {
      case weaknesses:
        return 'Weaknesses';
      case resistence:
        return 'Resistence';
      case immunity:
        return 'Immunity';
    }
  }
}

class DamageRelations extends StatelessWidget {
  const DamageRelations({
    required this.weaknesses,
    required this.resistence,
    required this.immunity,
    required this.isLoading,
    super.key,
  });

  final List<String> weaknesses;
  final List<String> resistence;
  final List<String> immunity;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    Map<String, List<String>> groupedWeaknesses = {
      "x4": [],
      "x2": [],
    };

    Map<String, List<String>> groupedReistence = {
      "x4": [],
      "x2": [],
    };

    Map<String, int> elementCountsWeaknesses = {};
    for (var element in weaknesses) {
      elementCountsWeaknesses[element] =
          (elementCountsWeaknesses[element] ?? 0) + 1;
    }

    Map<String, int> elementCountsResistence = {};
    for (var element in resistence) {
      elementCountsResistence[element] =
          (elementCountsResistence[element] ?? 0) + 1;
    }

    elementCountsWeaknesses.forEach((element, count) {
      if (count == 2) {
        groupedWeaknesses["x4"]!.add(element);
      } else {
        groupedWeaknesses["x2"]!.add(element);
      }
    });

    elementCountsResistence.forEach((element, count) {
      if (count == 2) {
        groupedReistence["x4"]!.add(element);
      } else {
        groupedReistence["x2"]!.add(element);
      }
    });

    return Column(
      children: [
        _buildList(
          title: 'Weaknesses',
          context: context,
          groupedElements: groupedWeaknesses,
          type: EnumRelation.weaknesses,
        ),
        SizedBox(height: 10),
        _buildList(
          title: 'Resistence',
          context: context,
          groupedElements: groupedReistence,
          type: EnumRelation.resistence,
        ),
        SizedBox(height: 10),
        if (immunity.isNotEmpty)
          _buildList(
            title: 'Immunity',
            context: context,
            groupedElements: groupedReistence,
            type: EnumRelation.immunity,
          ),
      ],
    );
  }

  Widget _buildList({
    required String title,
    required BuildContext context,
    required Map<String, List<String>> groupedElements,
    required EnumRelation type,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [],
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 10,
          left: 10,
          right: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MyText.labelMedium(
              context: context,
              text: title,
              isFontBold: true,
            ),
            SizedBox(height: 5),
            !isLoading
                ? Center(
                    child: CupertinoActivityIndicator(),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 12),
                      if (type == EnumRelation.weaknesses) ...[
                        if (groupedElements['x4']!.isNotEmpty) ...[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: MyText.labelMedium(
                                    context: context, text: '4 x'),
                              ),
                              Expanded(
                                flex: 7,
                                child: Wrap(
                                  spacing: 0.0,
                                  runSpacing: 0.0,
                                  children: [
                                    ...groupedElements['x4']!.mapIndexed(
                                      (index, element) {
                                        return TypePokemon(
                                          element:
                                              capitalizeFirstLetter(element),
                                        );
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                        ],
                        if (groupedElements['x2']!.isNotEmpty) ...[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: MyText.labelMedium(
                                  context: context,
                                  text: '2 x',
                                ),
                              ),
                              Expanded(
                                flex: 7,
                                child: Wrap(
                                  spacing: 0.0,
                                  runSpacing: 0.0,
                                  children: [
                                    ...groupedElements['x2']!.mapIndexed(
                                      (index, element) {
                                        return TypePokemon(
                                          element:
                                              capitalizeFirstLetter(element),
                                        );
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                        ]
                      ],
                      if (type == EnumRelation.resistence) ...[
                        if (groupedElements['x2']!.isNotEmpty) ...[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: MyText.labelMedium(
                                    context: context, text: '¹/₂ x'),
                              ),
                              Expanded(
                                flex: 7,
                                child: Wrap(
                                  spacing: 0.0,
                                  runSpacing: 0.0,
                                  children: [
                                    ...groupedElements['x2']!.mapIndexed(
                                      (index, element) {
                                        return TypePokemon(
                                          element:
                                              capitalizeFirstLetter(element),
                                        );
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                        ],
                        if (groupedElements['x4']!.isNotEmpty) ...[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: MyText.labelMedium(
                                  context: context,
                                  text: '¹/₄ x',
                                ),
                              ),
                              Expanded(
                                flex: 7,
                                child: Wrap(
                                  spacing: 0.0,
                                  runSpacing: 0.0,
                                  children: [
                                    ...groupedElements['x4']!.mapIndexed(
                                      (index, element) {
                                        return TypePokemon(
                                          element:
                                              capitalizeFirstLetter(element),
                                        );
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                        ],
                      ],
                      if (type == EnumRelation.immunity &&
                          immunity.isNotEmpty) ...[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: MyText.labelMedium(
                                context: context,
                                text: '0 x',
                              ),
                            ),
                            Expanded(
                              flex: 7,
                              child: Wrap(
                                spacing: 0.0,
                                runSpacing: 0.0,
                                children: [
                                  ...immunity.mapIndexed(
                                    (index, element) {
                                      return TypePokemon(
                                        element: capitalizeFirstLetter(element),
                                      );
                                    },
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                      ]
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
