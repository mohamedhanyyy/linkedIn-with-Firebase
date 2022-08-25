import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkedin/business_logic/login/login_cubit.dart';
import 'package:linkedin/business_logic/login/login_state.dart';
import 'package:linkedin/presentation/widgets/custom_button.dart';
import 'package:linkedin/presentation/widgets/custom_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(LoginInitial()),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (BuildContext context, LoginState state) {},
        builder: (BuildContext context, LoginState state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("login"),
            ),
            body: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      type: 'email',
                      controller: emailController,
                      hintText: 'Email',
                      prefixIcon: const Icon(Icons.email),
                    ),
                    CustomTextFormField(
                      type: 'password',
                      controller: passwordController,
                      hintText: 'Password',
                      prefixIcon: const Icon(Icons.lock),
                    ),
                    CustomElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            context
                                .read<LoginCubit>()
                                .loginWithEmailAndPassword(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    context: context,
                            );
                          }
                        },
                        buttonName:
                            state is LoginLoading ? 'Loading' : 'Login'),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
