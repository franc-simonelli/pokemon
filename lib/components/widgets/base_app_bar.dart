import 'package:flutter/material.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';

class BaseAppBar extends StatelessWidget {
  const BaseAppBar({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      surfaceTintColor: Colors.black,
      backgroundColor: Colors.transparent,
      pinned: false,
      floating: false,
      automaticallyImplyLeading: false,
      leading: const SizedBox.shrink(),
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          color: Colors.transparent,
          child: Column(
            children: [
              _buildAppBar(context),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      title: MyText.labelLarge(
        context: context,
        text: title,
        isFontBold: true,
      ),
      centerTitle: true,
    );
  }
}
