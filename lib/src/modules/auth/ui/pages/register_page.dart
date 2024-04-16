import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../theme.dart';
import '../../data/models/user.dart';
import '../../iterator/controller/auth_controller.dart';
import '../../iterator/state/auth_state.dart';

class RegisterPage extends StatelessWidget {
  final AuthController controller;

  RegisterPage({super.key, required this.controller});

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: login(),
    );
  }

  Widget login() {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, child) {
        if (controller.state is RegisteredState) {
          Modular.to.navigate('/auth/register');
        }
        return Center(
          child: Container(
            height: 400,
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'name',
                    ),
                  ),
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
                  TextFormField(
                    controller: _confirmPasswordController,
                    decoration: const InputDecoration(
                      labelText: 'Confirm password',
                    ),
                  ),
                  const Spacer(),
                  controller.state is LoadingState
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: () {
                            controller.register(
                              User(
                                email: _emailController.text,
                                name: _nameController.text,
                                password: _passwordController.text,
                                confirmPassword:
                                    _confirmPasswordController.text,
                              ),
                            );
                          },
                          child: const Text('Submit'),
                        )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
