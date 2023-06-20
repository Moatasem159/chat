import 'package:chat/chats/cubit/chat_cubit.dart';
import 'package:chat/core/extension/empty_padding_extension.dart';
import 'package:flutter/material.dart';

class SendMessageField extends StatelessWidget {
  const SendMessageField({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10,left: 10,right: 10),
      child: SizedBox(
        height:45,
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: ChatCubit.get(context).textController,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                    hintText: "Write your message..."),
              ),
            ),
            5.pw,
            GestureDetector(
              onTap: (){
                ChatCubit.get(context).validate(text: ChatCubit.get(context).textController.text);
              },
              child: Container(
                width: 40,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    shape: BoxShape.circle),
                height: 50,
                child:const Icon(
                  Icons.send,color: Colors.white,
                  size: 22,
                ),

              ),
            )
          ],
        ),
      ),
    );
  }
}