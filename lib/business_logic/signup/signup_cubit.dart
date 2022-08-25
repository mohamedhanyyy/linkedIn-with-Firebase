import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkedin/business_logic/signup/signup_state.dart';
import 'package:linkedin/data/remote/firebase_helper.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(super.initialState);

  void signUpWithEmailAndPassword(
      {required String email,
      required String password,
      required String name,
      required BuildContext context}) {
    emit(SignupLoading());
    FirebaseHelper.signupUser(
            email: email, password: password, name: name, context: context)
        .then((value) {
      emit(SignupDone());
    }).catchError((error) {
      emit(SignupError(error.message));
    });
  }
}
