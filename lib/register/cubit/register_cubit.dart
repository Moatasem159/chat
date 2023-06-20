import 'package:chat/core/models/user_model.dart';
import 'package:chat/register/cubit/register_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> register() async {
    emit(RegisterLoadingState());
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
        email: emailController.text, password: passwordController.text).then((value){
      userData(collectionName: "users",
          email: emailController.text,
          name: nameController.text,
          password: passwordController.text);
      emit(RegisterSuccessState());
    }).catchError((onError){
      emit(RegisterErrorState(onError.toString()));
    });
  }
  Future<void> userData({required String collectionName,
    required String email,
    required String name,
    required String password}) async {
    await FirebaseFirestore.instance
        .collection(collectionName)
        .add(UserModel(name: name, email: email, password: password).toJson());
  }
  validate() async{
    if (formKey.currentState!.validate()) {
      await register();
    }
  }
}


