part of 'validation_bloc.dart';

@immutable
sealed class ValidationEvent {}

class BlocLoginPressed extends ValidationEvent {
  final String email;
  final String password;

  BlocLoginPressed({
    required this.email,
    required this.password,
  });


}

class BlocSignOutPressed extends ValidationEvent{
  
}