// ignore_for_file: empty_catches

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/pokemon/cubit/pokemon_cubit.dart';

part 'download_state.dart';
part 'download_cubit.freezed.dart';

class DownloadCubit extends Cubit<DownloadState> {
  DownloadCubit({
    required this.totalNumber,
  }) : super(
          DownloadState(
            statusDonwload: Status.initial,
            totalNumber: totalNumber,
          ),
        );

  final int totalNumber;
  final StreamController<double> _progressController =
      StreamController<double>();

  // Esponi lo stream di progresso
  Stream<double> get progressStream => _progressController.stream;

  // Metodo per avviare il download
  Future<void> startDownload() async {
    try {
      for (int i = 1; i <= 100; i++) {
        await Future.delayed(Duration(milliseconds: 50));
        _progressController.add(i / 100);
      }
    } catch (e) {
    } finally {
      _progressController.close();
    }
  }
}
