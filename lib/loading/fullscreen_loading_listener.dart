import 'package:flutter/material.dart';
import 'package:pokedex/core/di/shared_export.dart';
import 'package:pokedex/shared/utils/debounce.dart';

class FullScreenLoadingListener extends StatefulWidget {
  const FullScreenLoadingListener({super.key});

  @override
  State<FullScreenLoadingListener> createState() =>
      _FullScreenLoadingListenerState();
}

class _FullScreenLoadingListenerState extends State<FullScreenLoadingListener> {
  bool showFullScreenLoading = false;
  late VoidCallback _debounceSetState;

  ///Check if there is a fullscreen loading
  bool get needShowFullScreen {
    return loadingNotifier.loadingHandlerList
        .any((loadingHandler) => loadingHandler.maybeWhen(
              fullscreen: (idLoading) => true,
              orElse: () => false,
            ));
  }

  @override
  void initState() {
    super.initState();
    _debounceSetState = debounce(
      updateState,
      200,
      leading: false,
      trailing: true,
    );
    loadingNotifier.addListener(onChangeLoadingNotifier);
  }

  void onChangeLoadingNotifier() {
    //Check if the fullscreen boolean changed
    if (needShowFullScreen != showFullScreenLoading) {
      _debounceSetState();
    }
  }

  void updateState() {
    setState(() {
      showFullScreenLoading = needShowFullScreen;
    });
  }

  @override
  void dispose() {
    loadingNotifier.removeListener(onChangeLoadingNotifier);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (showFullScreenLoading) {
      return Positioned.fill(
        child: Container(
          color: Colors.black.withOpacity(0.5),
          child: const Center(
            child: SizedBox.square(
              dimension: 40,
              child: CircularProgressIndicator.adaptive(strokeWidth: 2),
            ),
          ),
        ),
      );
    }
    return const SizedBox.shrink();
  }
}
