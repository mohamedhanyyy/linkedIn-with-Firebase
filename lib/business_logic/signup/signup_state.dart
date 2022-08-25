import 'package:equatable/equatable.dart';

abstract class SignupState extends Equatable {
  const SignupState();
}

class SignupInitial extends SignupState {
  @override
  List<Object?> get props => [];
}

class SignupDone extends SignupState {
  @override
  List<Object?> get props => [];
}

class SignupLoading extends SignupState {
  @override
  List<Object?> get props => [];
}

class SignupError extends SignupState {
  String? error;

  SignupError(this.error);

  @override
  List<Object?> get props => [];
}
