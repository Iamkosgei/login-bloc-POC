part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginUserEvent extends LoginEvent {
  final String userName, password;

  const LoginUserEvent(this.userName, this.password);
}
