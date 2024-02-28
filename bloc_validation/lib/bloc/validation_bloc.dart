// ignore_for_file: avoid_print

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'validation_event.dart';
part 'validation_state.dart';

class ValidationBloc extends Bloc<ValidationEvent, ValidationState> {
  ValidationBloc() : super(ValidationInitial()) {
    on<BlocLoginPressed>(_blocLoginPressed);
    
    on<BlocSignOutPressed>(_blocSignOutPressed);
  }
  
  void _blocLoginPressed(event, emit) async {
      emit(ValidationLoading());
      try {
        if (event.email.contains("@gmail.com") && event.password.length > 6) {
          await Future.delayed(const Duration(seconds: 2));
          emit(ValidationSuccess(email: event.email));
          return;
        } else {
          emit(ValidationFailure("invalid password or email"));
          return;
        }
      } catch (e) {
        emit(ValidationFailure(e.toString()));
      }
    }

    void _blocSignOutPressed(event, emit) {
      emit(ValidationInitial());
    }
  @override
  void onChange(Change<ValidationState> change) {
    print(change);
    super.onChange(change);
  }
}
