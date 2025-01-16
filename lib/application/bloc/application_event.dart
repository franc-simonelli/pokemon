part of 'application_bloc.dart';

abstract class ApplicationEvent extends Equatable {
  const ApplicationEvent();

  @override
  List<Object?> get props => [];
}

class ApplicationStart extends ApplicationEvent {
  const ApplicationStart(
      // {
      // required this.tasks,
      // }
      );

  // final List<ApplicationBootTask>? tasks;

  @override
  List<Object?> get props => [];
}

class ApplicationDownload extends ApplicationEvent {}

class ApplicationPause extends ApplicationEvent {}

class ApplicationResume extends ApplicationEvent {}

class ApplicationFirstScreenPresented extends ApplicationEvent {}

class ApplicationLinkOpened extends ApplicationEvent {
  const ApplicationLinkOpened(this.uri);

  final Uri uri;

  @override
  List<Object?> get props => [uri];
}

class ApplicationLinkConsumed extends ApplicationEvent {}

class ApplicationOpenSignIn extends ApplicationEvent {}

class ApplicationOpenSignInConsumed extends ApplicationEvent {}
