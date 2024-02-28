import 'package:bloc_login_validation/bloc/validation_bloc.dart';
import 'package:bloc_login_validation/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: BlocConsumer<ValidationBloc, ValidationState>(
        listener: (context, state) {
          if (state is ValidationFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red,
              content: Text(state.error),
            ));
          }
          if (state is ValidationSuccess) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          }
        },
        builder: (context, state) {
          if (state is ValidationLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      hintText: "Enter Email",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      hintText: "Enter Password",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<ValidationBloc>().add(
                          BlocLoginPressed(
                            email: emailController.text,
                            password: passwordController.text,
                          ),
                        );
                  },
                  child: const Text("Login"),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
