import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_sample/bloc/counter_bloc.dart';
import 'package:flutter_bloc_sample/cubit/counter_cubit.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    
  //  final counterCubit = BlocProvider.of<CounterCubit>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: SafeArea(
        child: BlocBuilder<CounterBloc,int>(
        
          builder: (context, counter) {
            return Center(child: Text(counter.toString()));
          },
        ),
      ),
    );
  }
}
