
import 'package:bloc/bloc.dart';
import 'package:chatwithsocketio/models/messages.dart';
import 'package:chatwithsocketio/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

part 'messages_event.dart';
part 'messages_state.dart';
String time='${DateTime
    .now()
    .hour}:${DateTime
    .now()
    .minute}';
bool rep=false;
String matnRepl='';


class MessagesBloc extends Bloc<MessagesEvent, MessagesState>  {
  late IO.Socket? socket;
  MessagesBloc() : super(MessagesState(payamha: [],editing: false,reply: false)) {
    socket = IO.io("http://10.0.2.2:4000", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": true
    });

    on<sendMessage>((event, emit) {
      socket?.emit('sendMsg',{
        'type':'owner',
        'senderId':currentUser.id,
        'msg': event.message,
        'time':DateTime.now().toIso8601String(),
        'senderName':currentUser.name
      });
      if(state.reply){
        rep=true;
      }else{
        rep=false;
      }
      final newMessages = [...state.payamha, Messages('owner',currentUser.id,DateTime.now(),event.message,rep,matnRepl)];
      emit(MessagesState(payamha: newMessages,editing: false,reply: rep));

    },);
    on<RecivedMessage>((event, emit)  {
      if(state.reply){
        rep=true;
      }else{
        rep=false;
      }
      final newMessage =[
        ...state.payamha,
        Messages('otherMsg', event.id, event.time, event.payam,rep,matnRepl)
      ];
        if(event.id!=currentUser.id) {
          emit(MessagesState(payamha: newMessage,editing: false,reply: rep));
        }
        else{
          print('payame khodam');
        }
        print(state.payamha.length);
      // }

    },);

    socket?.on("sendMsgServer", (msg) {
      if(msg['type']=='otherMsg' ){
      add(RecivedMessage(msg["senderId"], msg["msg"],DateTime.parse(msg["time"])));
      }
        print(msg);
      // _messages.add(
      //     Messages(msg["senderId"], DateTime.parse(msg["time"]), msg["msg"]));

    });
    on<deleteMsg>((event,emit){
      final newMsg=[...state.payamha];
      newMsg.removeAt(event.index);
      return emit(MessagesState(payamha: newMsg,editing: false,reply: false));

    });
    on<edittt>((event, emit) {
      final e =!state.editing;
      final message=[...state.payamha];
      emit(MessagesState(payamha: message,editing:e,reply: false));
    },);
    on<editMsg>((event, emit) {
      final editingMsg=[...state.payamha];
      editingMsg[event.index].matn=event.matn;
      editingMsg[event.index].edited=true;
      return emit(MessagesState(payamha: editingMsg,editing:false,reply: false));

    },);

    on<reply>((event, emit) {
      final e=!state.reply;
      final editingMsg=[...state.payamha];
      return emit(MessagesState(payamha: editingMsg,editing:false,reply: e));
    },);
    on<reeply>((event, emit) {
      matnRepl=event.matnRepl;
    },);

  }
}
