import 'package:bloc_login_validation/bloc/validation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("home"),
      ),
      body: BlocListener<ValidationBloc, ValidationState>(
        listener: (context, state) {
        if(state is ValidationInitial){
          Navigator.of(context).pop();
        }
        },
        child: Column(
          children: [
            BlocBuilder<ValidationBloc, ValidationState>(
              builder: (context, state) {
                return Center(
                  child: Text((state as ValidationSuccess).email),
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                context.read<ValidationBloc>().add(BlocSignOutPressed());
              },
              child: Text("logout"),
            )
          ],
        ),
      ),
    );
  }
}
