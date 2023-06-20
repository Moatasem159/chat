class MessageModel{
  final String senderId;
  final String date;
  final String text;


  MessageModel({required this.senderId, required this.date, required this.text});

 factory MessageModel.fromJson(dynamic json)=>MessageModel(
    senderId:json['senderId'],
    date:json['date'],
    text:json['text']);

  Map<String ,dynamic> toMap(){
    return {
      'senderId':senderId,
      'date':date,
      'text':text,
    };
  }


}