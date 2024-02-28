part of 'validation_bloc.dart';

@immutable
sealed class ValidationState {}

final class ValidationInitial extends ValidationState {}

final class ValidationSuccess extends ValidationState {
  final String email;

  ValidationSuccess({required this.email});

}

final class ValidationFailure extends ValidationState {
  final String error;

  ValidationFailure(this.error);
}

final class ValidationLoading extends ValidationState {}
