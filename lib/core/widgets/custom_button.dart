import 'package:chat/core/extension/screen_size_extension.dart';
import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  final String name;
  final double width;
  final VoidCallback onTap;
  const CustomButton({super.key, required this.name, required this.width,required this.onTap});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromRGBO(13, 0, 237, 1),
        foregroundColor: Colors.white,
        elevation: 0,
        padding: EdgeInsets.zero,
        fixedSize: Size(context.getWidth(w: width), context.getHeight(h: 46)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}