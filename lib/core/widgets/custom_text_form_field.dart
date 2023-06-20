import 'package:chat/core/extension/screen_size_extension.dart';
import 'package:flutter/material.dart';
class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final String title;
  final TextInputType inputType;
  const CustomTextFormField({
    super.key,
    required this.title,
    required this.inputType,
    this.controller,
    this.validator});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.only(
          left: context.getWidth(w: 49),
          right: context.getWidth(w: 43)),
      child: TextFormField(
        style: const TextStyle(
          color: Colors.black,
          fontSize: 15,
        ),
        controller: controller,
        validator: validator,
        textAlignVertical: TextAlignVertical.center,
        keyboardType: inputType,
        decoration:InputDecoration(
          fillColor: Colors.white,
          filled: true,
          labelText: title,
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          errorStyle: const TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 12,
            height: 0.5,
          ),
        ),
      ),
    );
  }
}