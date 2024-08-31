part of 'messages_bloc.dart';


@immutable
sealed class MessagesEvent {}

class sendMessage extends MessagesEvent {
    final String message;
    sendMessage(this.message);
}

 class RecivedMessage extends MessagesEvent{
  final String id;
  final String payam;
  final DateTime time;

  RecivedMessage(this.id, this.payam,this.time);
}

class deleteMsg extends MessagesEvent {
  final int index;

  deleteMsg(this.index);
}
class editMsg extends MessagesEvent{
  final int index;
  final String matn;
  final bool editing=false;

  editMsg(this.index, this.matn);
}
class edittt extends MessagesEvent{}
class reply extends MessagesEvent{

}
class reeply extends MessagesEvent{
  String  matnRepl;

  reeply(this.matnRepl);
}