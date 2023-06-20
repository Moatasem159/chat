import 'package:chat/chats/screens/chat_screen.dart';
import 'package:chat/core/extension/empty_padding_extension.dart';
import 'package:chat/core/widgets/custom_button.dart';
import 'package:chat/core/widgets/custom_text_form_field.dart';
import 'package:chat/login/cubit/login_cubit.dart';
import 'package:chat/login/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is LoginErrorState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.error)));
        }
        if (state is LoginSuccessState) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const ChatScreen(),
              ),
              (route) => false);
        }
      },
      builder: (context, state) {
        LoginCubit cubit = LoginCubit.get(context);
        return Form(
          key: cubit.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              20.ph,
              CustomTextFormField(
                controller: cubit.emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "required";
                  }
                  return null;
                },
                title: "email",
                inputType: TextInputType.emailAddress,
              ),
              10.ph,
              CustomTextFormField(
                controller: cubit.passwordController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "required";
                  }
                  return null;
                },
                title: "password",
                inputType: TextInputType.text,
              ),
              10.ph,
              if (state is! LoginLoadingState)
                CustomButton(
                  name: "login",
                  width: 90,
                  onTap: () {
                    cubit.validate();
                  },
                ),
              if (state is LoginLoadingState) const CircularProgressIndicator()
            ],
          ),
        );
      },
    );
  }
}
