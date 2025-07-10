import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';

class DownloadStream extends StatelessWidget {
  const DownloadStream({
    required this.stream,
    this.closeWindowWhenComplete = true,
    super.key,
  });

  final Stream<double> stream;
  final bool closeWindowWhenComplete;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<double>(
      stream: stream,
      builder: (context, snapshot) {
        final progress = snapshot.data ?? 0.0;

        var percent = (progress * 100).toStringAsFixed(0);

        if (percent == '100' && closeWindowWhenComplete) {
          context.pop(true);
        }

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: LinearProgressIndicator(
                value: progress,
              ),
            ),
            SizedBox(height: 10),
            MyText.labelMedium(
              context: context,
              text: '${(progress * 100).toStringAsFixed(0)}%',
            ),
          ],
        );
      },
    );
  }
}
