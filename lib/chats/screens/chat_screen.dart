import 'package:chat/chats/cubit/chat_cubit.dart';
import 'package:chat/chats/cubit/chat_state.dart';
import 'package:chat/chats/models/message_model.dart';
import 'package:chat/chats/widgets/send_message_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(),
      child: BlocBuilder<ChatCubit, ChatStates>(
        builder: (context, state) {
          ChatCubit cubit = ChatCubit.get(context);
          return SafeArea(
            child: Scaffold(
              body: StreamBuilder<QuerySnapshot>(

                stream: cubit.getMassages(),
                builder: (context, snapshot) {
                  cubit.createList(snapshot);
                  return ChatList(messages: cubit.messages);
                },
              ),
              bottomSheet: const SendMessageField(),
            ),
          );
        },
      ),
    );
  }
}

class ChatList extends StatelessWidget {
  const ChatList({super.key, required this.messages});
  final List<MessageModel> messages;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: true,
      itemCount: messages.length,
      itemBuilder: (context, index) {
        return MessageTile(message: messages[index]);
      },
    );
  }
}

class MessageTile extends StatelessWidget {
  const MessageTile({
    super.key,
    required this.message,
  });
  final MessageModel message;
  @override
  Widget build(BuildContext context) {
    // if(message.senderId==Global.userId)
    //   {return Align(
    //     alignment: AlignmentDirectional.centerEnd,
    //     child: Padding(
    //       padding: const EdgeInsets.only(left: 20, bottom: 15, right: 10),
    //       child: Container(
    //           decoration: const BoxDecoration(
    //               color: Colors.blue,
    //               borderRadius: BorderRadiusDirectional.only(
    //                 bottomStart: Radius.circular(10),
    //                 topStart: Radius.circular(10),
    //                 topEnd: Radius.circular(10),
    //               )),
    //           padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.end,
    //             children: [
    //               Text(message.text),
    //               Text(message.date),
    //             ],
    //           )),
    //     ),
    //   );}
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, bottom: 15, right: 10),
        child: Container(
            decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadiusDirectional.only(
                  bottomStart: Radius.circular(10),
                  topStart: Radius.circular(10),
                  topEnd: Radius.circular(10),
                )),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(message.text),
                Text(message.date),
              ],
            )),
      ),
    );
  }
}
