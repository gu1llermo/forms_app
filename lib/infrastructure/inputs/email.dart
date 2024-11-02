import 'package:formz/formz.dart';

// Define input validation errors
enum EmailError { empty, invalidEmail }

// Extend FormzInput and provide the input type and error type.
class Email extends FormzInput<String, EmailError> {
  //
  static final emailRegExp = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );

  // Call super.pure to represent an unmodified form input.
  const Email.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Email.dirty(super.value) : super.dirty();
  //

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == EmailError.empty) return 'email requerido';
    if (displayError == EmailError.invalidEmail) {
      return 'Formato de email inválido';
    }
    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  EmailError? validator(String value) {
    if (value.trim().isEmpty) return EmailError.empty;
    value = value.trim();

    if (!emailRegExp.hasMatch(value)) {
      return EmailError.invalidEmail;
    }
    return null;
  }
}