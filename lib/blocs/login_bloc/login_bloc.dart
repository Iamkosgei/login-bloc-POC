import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:nnke/data/models/login_request.dart';
import 'package:nnke/data/repositories/auth_repo.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepo authRepository;

  //form
  final formKey = GlobalKey<FormState>();
  String? userName, password = "";
  LoginBloc({required this.authRepository}) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is LoginUserEvent) {
        emit(LoginLoading());
        try {
          await authRepository.loginUser(
            LoginRequest(
              username: event.userName,
              password: event.password,
            ),
          );

          emit(LoginSuccess());
        } catch (e) {
          emit(LoginError(e.toString()));
        }
      }
    });
  }
}
