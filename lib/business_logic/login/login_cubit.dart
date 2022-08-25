import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkedin/business_logic/login/login_state.dart';
import 'package:linkedin/data/remote/firebase_helper.dart';
import 'package:linkedin/services/navigator.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(LoginInitial loginInitial) : super(loginInitial);

  void loginWithEmailAndPassword(
      {required String email,
      required String password,
      required BuildContext context}) {
    emit(LoginLoading());
    FirebaseHelper.loginUser(email: email, password: password, context: context)
        .then((value) {
      emit(LoginDone());
      AppNavigator.navigateReplacement(context: context, routeName: 'home');
    }).catchError((error) {
      emit(LoginError(error.message));
    });
  }
}
