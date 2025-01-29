import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/download/cubit/download_cubit.dart';

class DownloadPage extends StatefulWidget {
  const DownloadPage({
    required this.totalPage,
    super.key,
  });

  final int totalPage;

  @override
  State<DownloadPage> createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
  // late DownloadCubit _downloadCubit;

  @override
  void initState() {
    // _downloadCubit = DownloadCubit(totalNumber: widget.totalPage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<double>(
      stream: context.read<DownloadCubit>().progressStream,
      builder: (context, snapshot) {
        final progress = snapshot.data ?? 0.0;
        return Column(
          children: [
            LinearProgressIndicator(value: progress),
            SizedBox(height: 10),
            Text('${(progress * 100).toStringAsFixed(0)}%'),
          ],
        );
      },
    );
  }
}
