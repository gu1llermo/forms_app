import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../../infrastructure/inputs/inputs.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(const RegisterFormState());

  bool get isPosting => state.formStatus == FormStatus.posting;

  void onSubmit() {
    emit(state.copyWith(
      formStatus: FormStatus.posting,
      username: Username.dirty(state.username.value),
      password: Password.dirty(state.password.value),
      email: Email.dirty(state.email.value),
      isValid: Formz.validate([
        state.password,
        state.username,
        state.email,
      ]),
    ));
    debugPrint('Cubit Submit: $state');
  }

  void usernameChanged(String value) {
    final username = Username.dirty(value);

    emit(state.copyWith(
      username: username,
      formStatus: FormStatus.invalid,
      isValid: Formz.validate([username, state.password, state.email]),
    ));
  }

  void emailChanged(String value) {
    final email = Email.dirty(value);

    emit(state.copyWith(
      email: email,
      formStatus: FormStatus.invalid,
      isValid: Formz.validate([email, state.username, state.password]),
    ));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(
      password: password,
      formStatus: FormStatus.invalid,
      isValid: Formz.validate([password, state.username, state.email]),
    ));
  }
}
