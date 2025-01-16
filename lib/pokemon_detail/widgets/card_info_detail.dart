import 'package:flutter/material.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';

class CardInfoDetail extends StatelessWidget {
  const CardInfoDetail({
    required this.info,
    required this.value,
    this.isLoading = false,
    super.key,
  });

  final String info;
  final String value;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Icon(
              Icons.access_alarm,
              size: 18,
            ),
            SizedBox(width: 10),
            MyText.labelSmall(context: context, text: info),
          ],
        ),
        SizedBox(height: 5),
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: isLoading
                ? CircularProgressIndicator.adaptive()
                : MyText.labelMedium(
                    context: context,
                    text: value,
                    isFontBold: true,
                  ),
          ),
        )
      ],
    );
  }
}
