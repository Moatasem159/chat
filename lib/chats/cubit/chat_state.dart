abstract class ChatStates {}
class ChatInitialState extends ChatStates{}
class SendMessageLoadingState extends ChatStates{}
class SendMessageSuccessState extends ChatStates{}
class SendMessageErrorState extends ChatStates{}
class GetMessageSuccessState extends ChatStates{}
class GetMessageLoadingState extends ChatStates{}
