
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:socket_io_client/socket_io_client.dart' as IO;
//
// import '../bloc/messages_bloc.dart';
//  late IO.Socket? socket;
//
// void connect(BuildContext context) {
//   socket = IO.io("http://10.0.2.2:4000", <String, dynamic>{
//     "transports": ["websocket"],
//     "autoConnect": false
//   });
//   socket!.connect();
//   socket!.onConnect((_) {
//     print('connected to backend');
//     socket!.on("sendMsgServer", (msg) {
//       BlocProvider.of<MessagesBloc>(context).add(
//
//             RecivedMessage( msg['senderId'],msg['msg'])
//       );
//
//
//     });
//   });
//
//   socket!.onError((err) {
//     print(err);
//   });
//   socket!.onConnecting((err) {
//     print('connect  $err');
//   });
//   socket!.onConnectError((err) {
//     print(err);
//   });
// }
// void sendMsg(String msg) {
//   connect();
//   messages.add(Messages(currentUser, DateTime.now(), msg));
//   socket!.emit("sendMsg", {
//     "type": "owner",
//     "msg": msg,
//     "sendername": currentUser.name,
//   });
// }

