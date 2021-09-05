import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AuthEvent {}

class LoggedIn extends AuthEvent {
  final String user;
  const LoggedIn({required this.user});

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'Logged In {$user}';
}

class LoggedOut extends AuthEvent {}
