import 'package:chat/login/cubit/login_cubit.dart';
import 'package:chat/login/widgets/login_form.dart';
import 'package:chat/register/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: SafeArea(child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Login", style: TextStyle(
                fontSize: 20
            ),),
            const LoginForm(),
            TextButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => const RegisterScreen(),));
            }, child:
            const Text("register"))
          ],
        ),
      )),
    );
  }
}


