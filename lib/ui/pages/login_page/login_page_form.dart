import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nnke/blocs/login_bloc/login_bloc.dart';
import 'package:nnke/ui/widgets/primary_button.dart';
import 'package:nnke/ui/widgets/primary_text_filed.dart';
import 'package:nnke/utils/assets.dart';
import 'package:nnke/utils/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPageForm extends StatelessWidget {
  const LoginPageForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _loginbloc = context.read<LoginBloc>();
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text(state.error),
          ));
        } else if (state is LoginSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.green,
            content: Text('Welcome'),
          ));
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _loginbloc.formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 240,
                    height: 240,
                    child: SvgPicture.asset(
                      loginSvg,
                    ),
                  ),
                ),
                const Text(
                  'Login',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                PrimaryTextField(
                  label: 'Username',
                  onSaved: (String? value) {
                    _loginbloc.userName = value;
                  },
                  validator: (String? value) {
                    if (value == null) {
                      return 'Username required';
                    }
                    if (value.isEmpty) {
                      return 'Username required';
                    }

                    return null;
                  },
                ),
                const SizedBox(
                  height: 16.0,
                ),
                PrimaryTextField(
                  label: 'Password',
                  onSaved: (String? value) {
                    _loginbloc.password = value;
                  },
                  validator: (String? value) {
                    if (value == null) {
                      return 'Password required';
                    }
                    if (value.isEmpty) {
                      return 'Password required';
                    }

                    return null;
                  },
                ),
                const SizedBox(
                  height: 16.0,
                ),
                PrimaryButton(
                  txt: 'Login',
                  isLoading: state is LoginLoading,
                  onPressed: () {
                    if (_loginbloc.formKey.currentState?.validate() ?? false) {
                      _loginbloc.formKey.currentState?.save();

                      _loginbloc.add(LoginUserEvent(_loginbloc.userName ?? '',
                          _loginbloc.password ?? ''));
                    }
                  },
                ),
                Row(
                  children: const [
                    Expanded(
                      child: Divider(
                        thickness: 2.0,
                      ),
                    ),
                    Text(' OR '),
                    Expanded(
                      child: Divider(
                        thickness: 2.0,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot password?',
                        style: TextStyle(
                          color: primaryColor,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'New User?',
                        style: TextStyle(
                          color: primaryColor,
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      iconSize: 32,
                      onPressed: () {},
                      icon: const FaIcon(FontAwesomeIcons.google),
                      color: primaryColor,
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    IconButton(
                      iconSize: 32,
                      onPressed: () {},
                      icon: const FaIcon(
                        FontAwesomeIcons.facebook,
                        color: primaryColor,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
