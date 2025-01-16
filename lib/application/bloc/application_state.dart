part of 'application_bloc.dart';

abstract class ApplicationState extends Equatable {
  const ApplicationState();

  @override
  List<Object?> get props => [];
}

class ApplicationInitial extends ApplicationState {}

class ApplicationBooting extends ApplicationState {}

class ApplicationUpdateRequired extends ApplicationState {}

class ApplicationDownloadRequired extends ApplicationState {}

class ApplicationDownloading extends ApplicationState {}

class ApplicationError extends ApplicationState {
  const ApplicationError({required this.message});

  final String? message;

  @override
  List<Object?> get props => [message];
}

class ApplicationReady extends ApplicationState {
  const ApplicationReady({
    this.paused = false,
    this.firstScreenPresented = false,
  });

  final bool paused;
  final bool firstScreenPresented;

  ApplicationReady copyWith({
    bool? paused,
    bool? firstScreenPresented,
  }) {
    return ApplicationReady(
      paused: paused ?? this.paused,
      firstScreenPresented: firstScreenPresented ?? this.firstScreenPresented,
    );
  }

  @override
  List<Object?> get props => [
        paused,
        firstScreenPresented,
      ];
}
