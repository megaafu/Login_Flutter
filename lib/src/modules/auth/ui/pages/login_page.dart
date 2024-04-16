import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:simpleapp/src/modules/auth/iterator/state/auth_state.dart';
import 'package:simpleapp/src/theme.dart';

import '../../data/models/user_authenticate.dart';
import '../../iterator/controller/auth_controller.dart';

class LoginPage extends StatelessWidget {
  final AuthController controller;

  LoginPage({super.key, required this.controller});

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: login());
  }

  Widget login() {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, child) {
        if (controller.state is LoggedState) {
          Modular.to.navigate('/home/page');
        }
        return Center(
          child: Container(
            height: 400,
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'email',
                    ),
                  ),
                  const Spacer(),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      labelText: 'password',
                    ),
                  ),
                  const Spacer(),
                  controller.state is LoadingState
                      ? CircularProgressIndicator(
                          color: primary,
                        )
                      : ElevatedButton(
                          onPressed: () {
                            controller.login(
                              UserAuthenticate(
                                email: _emailController.text,
                                password: _passwordController.text,
                              ),
                            );
                          },
                          child: const Text('Submit'),
                        ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Modular.to.pushNamed('/auth/register');
                    },
                    child: const Text("Register"),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
