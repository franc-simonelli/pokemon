import 'package:flutter/material.dart';
import 'package:pokedex/core/di/shared_export.dart';

typedef LoadingWidgetBuilder = Widget Function(bool isLoading);

class LoadingBuilder extends StatefulWidget {
  const LoadingBuilder({
    super.key,
    required this.idLoading,
    required this.builder,
  });

  final String idLoading;
  final LoadingWidgetBuilder builder;

  @override
  State<LoadingBuilder> createState() => _LoadingBuilderState();
}

class _LoadingBuilderState extends State<LoadingBuilder> {
  @override
  void initState() {
    super.initState();
    loadingNotifier.addListener(_loadingChangeHandler);
  }

  @override
  void dispose() {
    loadingNotifier.removeListener(_loadingChangeHandler);
    super.dispose();
  }

  void _loadingChangeHandler() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = loadingNotifier.isLoadingById(widget.idLoading);

    return widget.builder(
      isLoading,
    );
  }
}
