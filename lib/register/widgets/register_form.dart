import 'package:chat/core/extension/empty_padding_extension.dart';
import 'package:chat/core/widgets/custom_button.dart';
import 'package:chat/core/widgets/custom_text_form_field.dart';
import 'package:chat/login/screens/login_screen.dart';
import 'package:chat/register/cubit/register_cubit.dart';
import 'package:chat/register/cubit/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        if(state is RegisterErrorState)
          {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)));
          }
        if(state is RegisterSuccessState)
          {
            Navigator.push(context,MaterialPageRoute(builder: (context) => const LoginScreen()));
          }
      },
      builder: (context, state) {
        RegisterCubit cubit = RegisterCubit.get(context);
        return Form(
          key: cubit.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              20.ph,
              CustomTextFormField(
                controller: cubit.nameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "required";
                  }
                  return null;
                },
                title: "name",
                inputType: TextInputType.emailAddress,
              ),
              10.ph,
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
              if(state is !RegisterLoadingState)
              CustomButton(
                name: "register",
                width: 120,
                onTap: () {cubit.validate();},
              ),
              if(state is RegisterLoadingState)
                const CircularProgressIndicator()

            ],
          ),
        );
      },
    );
  }
}
