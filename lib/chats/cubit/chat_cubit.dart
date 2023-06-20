import 'package:chat/chats/cubit/chat_state.dart';
import 'package:chat/chats/models/message_model.dart';
import 'package:chat/core/global.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatCubit extends Cubit<ChatStates> {
  ChatCubit() : super(ChatInitialState());

  static ChatCubit get(context) => BlocProvider.of(context);
  TextEditingController textController = TextEditingController();

  void sendMessages({required String text}) async {
    textController.clear();
    emit(SendMessageLoadingState());
    FirebaseFirestore.instance
        .collection("messages")
        .add(MessageModel(
                date: DateTime.now().toIso8601String(),
                text: text,
                senderId: Global.userId)
            .toMap())
        .then((value) {
      emit(SendMessageSuccessState());
    }).catchError((error) {
      emit(SendMessageErrorState());
    });
  }

  validate({required String text}) {
    if (text.isNotEmpty) {
      sendMessages(text: text);
    }
  }
  List<MessageModel> messages = [];
  Stream<QuerySnapshot<Object>>getMassages(){
    return FirebaseFirestore.instance
        .collection("messages")
        .orderBy('date', descending: false)
        .snapshots();
  }


  List<MessageModel> createList(snapshot){
    messages.clear();
    if (snapshot.hasData) {
      for (var i = 0; i < snapshot.data!.docs.length; i++) {
        messages.add(MessageModel.fromJson(snapshot.data!.docs[i]));
      }
    }
    return messages;
  }
}
