import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linkedin/business_logic/signup/signup_cubit.dart';
import 'package:linkedin/business_logic/signup/signup_state.dart';
import 'package:linkedin/presentation/widgets/custom_button.dart';
import 'package:linkedin/presentation/widgets/custom_text_form_field.dart';

import '../../services/locator.dart';
import '../widgets/dialogues.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  Dialogues dialogues = locator.get<Dialogues>();

  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SignupCubit(SignupInitial()),
      child: BlocConsumer<SignupCubit, SignupState>(
        builder: (BuildContext context, SignupState state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const Text("Sign up"),
                    CustomTextFormField(
                      controller: emailController,
                      hintText: 'email',
                      prefixIcon: const Icon(Icons.email),
                      type: 'email',
                    ),
                    CustomTextFormField(
                      controller: passwordController,
                      hintText: 'password',
                      type: 'password',
                      prefixIcon: const Icon(Icons.lock),
                    ),
                    CustomTextFormField(
                      controller: nameController,
                      hintText: 'name',
                      type: '',
                      prefixIcon: const Icon(Icons.person),
                    ),
                    SizedBox(height: 50.h),
                    CustomElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context
                                .read<SignupCubit>()
                                .signUpWithEmailAndPassword(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    name: nameController.text,
                                    context: context);
                          }
                        },
                        buttonName:
                            state is SignupLoading ? 'Loading' : 'Sign up')
                  ],
                ),
              ),
            ),
          );
        },
        listener: (BuildContext context, SignupState state) {},
      ),
    );
  }
}
