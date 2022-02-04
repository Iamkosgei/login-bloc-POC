import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nnke/blocs/login_bloc/login_bloc.dart';
import 'package:nnke/data/repositories/auth_repo.dart';
import 'package:nnke/utils/locator.dart';

import 'login_page_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          LoginBloc(authRepository: locator.get<AuthRepoImpl>()),
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.white,
          ),
          body: const LoginPageForm()),
    );
  }
}
