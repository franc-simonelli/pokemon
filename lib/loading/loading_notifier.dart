// ignore_for_file: no_leading_underscores_for_local_identifiers
import 'package:flutter/material.dart';
import 'package:pokedex/loading/handlers/loading_handler.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

class LoadingNotifier extends ChangeNotifier {
  final loadingHandlerList = <LoadingHandler>[];

  /// Add a new task to the list of pending tasks and return the identifier
  String addFullscreenLoadingTask([String? taskIdentifier]) {
    final _taskIdentifier = taskIdentifier ?? _uuid.v4();
    loadingHandlerList
        .add(LoadingHandler.fullscreen(idLoading: _taskIdentifier));
    notifyListeners();
    return _taskIdentifier;
  }

  /// Add a new task to the list of pending tasks and return the identifier
  void addCustomTask(LoadingHandler loadingHandler) {
    loadingHandlerList.add(loadingHandler);
    notifyListeners();
  }

  /// Remove a task from the list of pending tasks using the identifier
  void removeTask(String taskIdentifier) {
    loadingHandlerList.removeWhere(
        (loadingHandler) => loadingHandler.idLoading == taskIdentifier);
    notifyListeners();
  }

  bool isLoadingById(String identifier) {
    return loadingHandlerList
        .any((loadingHandler) => loadingHandler.idLoading == identifier);
  }

  @override
  void dispose() {
    loadingHandlerList.clear();
    super.dispose();
  }
}
