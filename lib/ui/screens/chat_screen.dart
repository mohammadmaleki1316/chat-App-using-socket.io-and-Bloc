import 'package:chatwithsocketio/bloc/messages_bloc.dart';
import 'package:chatwithsocketio/core/find_user.dart';
import 'package:chatwithsocketio/models/messages.dart';
import 'package:chatwithsocketio/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';

import '../../socket_io/socket_client.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // late IO.Socket? socket;
  TextEditingController messageController = TextEditingController();
  String editMatn = '';
  int ind = -1;
  List<String> rep=[];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Public Chat Room',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: BlocBuilder<MessagesBloc, MessagesState>(
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    reverse: true,
                    itemCount: state.payamha.length,
                    itemBuilder: (context, index) {
                      state.payamha.sort((b, a) => a.time.compareTo(b.time));
                      bool isMe =
                          currentUser.id == state.payamha[index].senderId &&
                              state.payamha[index].type == 'owner';

                      return Column(
                        crossAxisAlignment: isMe
                            ? CrossAxisAlignment.end
                            : CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: isMe
                                ? MainAxisAlignment.end
                                : MainAxisAlignment.start,
                            children: [
                              Visibility(
                                visible: !isMe,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: CircleAvatar(
                                    radius: 18,
                                    backgroundImage: AssetImage(users[
                                            findUserIndex(users,
                                                state.payamha[index].senderId)]
                                        .imageAdress),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              GestureDetector(
                                onLongPress: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      backgroundColor: Colors.white70,
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextButton.icon(
                                            onPressed: () {
                                              ind=index;
                                              editMatn=state.payamha[ind].matn;
                                              rep.add(state.payamha[ind].matn);
                                              replying();
                                              print(state.reply);
                                              Navigator.pop(context);
                                            },
                                            label: Text('Reply'),
                                            icon: Icon(Icons.reply),
                                          ),
                                          TextButton.icon(
                                            onPressed: () {
                                              ind = index;
                                              messageController.text =
                                                  state.payamha[ind].matn;
                                              // state.editing = true;
                                              editMatn =
                                                  state.payamha[ind].matn;
                                              editing();
                                              Navigator.pop(context);
                                            },
                                            label: Text('Edit'),
                                            icon: Icon(Icons.edit),
                                          ),
                                          TextButton.icon(
                                            onPressed: () {
                                              delete(index);
                                              Navigator.pop(context);
                                            },
                                            label: Text('Delete'),
                                            icon: Icon(Icons.delete),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                onTap: () {},
                                child: SizedBox(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.76,
                                  child: Column(
                                    // crossAxisAlignment: isMe?CrossAxisAlignment.end:CrossAxisAlignment.start,
                                    children: [

                                      ChatBubble(
                                        clipper: ChatBubbleClipper5(
                                            type: isMe
                                                ? BubbleType.sendBubble
                                                : BubbleType.receiverBubble),
                                        backGroundColor: isMe
                                            ? Colors.blue
                                            : Colors.grey.withOpacity(0.5),
                                        margin:
                                            const EdgeInsets.symmetric(vertical: 3),
                                        alignment: isMe
                                            ? Alignment.topRight
                                            : Alignment.topLeft,
                                        child: Column(
                                          crossAxisAlignment: isMe
                                              ? CrossAxisAlignment.end
                                              : CrossAxisAlignment.start,
                                          children: [
                                            Visibility(
                                                visible: !isMe,
                                                child: Text(
                                                  users[findUserIndex(
                                                          users,
                                                          state.payamha[index]
                                                              .senderId)]
                                                      .name,
                                                  style:
                                                      TextStyle(color: Colors.red),
                                                )),
                                            SizedBox(
                                              height: 3,
                                            ),
                                            Visibility(
                                              visible: state.payamha[index].reply,
                                              child: GestureDetector(
                                                onTap: (){

                                                },
                                                child: ConstrainedBox(
                                                  constraints: BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width/2),
                                                  child: Container(
                                                    decoration: BoxDecoration(color: Colors.transparent.withOpacity(0.2),borderRadius: BorderRadius.circular(10)),
                                                    height: 30,
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          height: 30,
                                                          width: 5,
                                                          color: Colors.red.withOpacity(0.8),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.symmetric(horizontal: 8),
                                                          child: Align(
                                                            alignment: Alignment.centerLeft,
                                                            child:  Text(
                                                                state.payamha[index].repl.length > 10
                                                                    ? '${state.payamha[index].repl.substring(0, 10)}...'
                                                                    : state.payamha[index].repl),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 3,
                                            ),
                                            Text(
                                              state.payamha[index].matn,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontStyle: FontStyle.italic,
                                                  color: isMe
                                                      ? Colors.white
                                                      : Colors.black),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            SizedBox(
                                              width: 90,
                                              child: Row(
                                                mainAxisAlignment: isMe
                                                    ? MainAxisAlignment.end
                                                    : MainAxisAlignment.start,
                                                children: [
                                                  Visibility(
                                                      visible: state.payamha[index].edited,
                                                      child: Text('edited',style: TextStyle(fontSize: 10),)),
                                                  SizedBox(width: 3,),
                                                  Text(
                                                    '${state.payamha[index].time.hour}:${state.payamha[index].time.minute}',
                                                    style: TextStyle(
                                                        color: Colors.black54),
                                                  ),
                                                  Visibility(
                                                      visible: isMe,
                                                      child: Icon(CupertinoIcons
                                                          .checkmark_alt))
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
                BlocBuilder<MessagesBloc, MessagesState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        Visibility(
                          visible: state.editing || state.reply,
                          child: Row(
                            children: [
                              Expanded(
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                      maxWidth:
                                          MediaQuery.sizeOf(context).width /
                                              1.3),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.greenAccent.withAlpha(60),
                                    ),
                                    height: 40,
                                    width:
                                        MediaQuery.sizeOf(context).width - 60,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 3, horizontal: 8),
                                      child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            editMatn.length > 50
                                                ? '${editMatn.substring(0, 40)}...'
                                                : editMatn,
                                            style: TextStyle(
                                                color: Colors.black87),
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    if(state.editing){
                                      BlocProvider.of<MessagesBloc>(context).add(edittt());
                                      messageController.clear();
                                      editMatn='';

                                    }else if(state.reply){
                                    BlocProvider.of<MessagesBloc>(context).add(reply());
                                    editMatn='';
                                    }
                                  },
                                  icon: const Icon(Icons.close)),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: 45,
                                child: TextFormField(
                                  onChanged: (value) {
                                    print(state.reply);
                                  },
                                    maxLines: 5,
                                    minLines: 1,
                                    controller: messageController,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 4),
                                      fillColor: Colors.grey.withOpacity(0.1),
                                      filled: true,
                                      hintText: 'Write your message',
                                      hintStyle:
                                          const TextStyle(color: Colors.grey),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                          borderSide: BorderSide.none),
                                    )),
                              ),
                            )),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  if (state.editing == false ) {
                                    if (messageController.text.isNotEmpty) {
                                      BlocProvider.of<MessagesBloc>(context)
                                          .add(sendMessage(
                                              messageController.text));
                                      messageController.clear();
                                      if(!state.reply){
                                        print('false');
                                      }
                                        else {
                                        BlocProvider.of<MessagesBloc>(context)
                                            .add(reply());
                                      }
                                    }
                                  } else {
                                    if (messageController.text.isNotEmpty) {
                                      BlocProvider.of<MessagesBloc>(context).add(edittt());
                                      BlocProvider.of<MessagesBloc>(context)
                                          .add(editMsg(
                                              ind, messageController.text));
                                      messageController.clear();
                                    }
                                  }

                                },
                                child: CircleAvatar(
                                  radius: 20,
                                  child: Icon(
                                      state.editing ? Icons.check : Icons.send),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    );
                  },
                )
              ],
            );
          },
        ),
      ),
    );
  }

  void editing() {
    BlocProvider.of<MessagesBloc>(context).add(edittt());
  }

  void delete(int index) {
    BlocProvider.of<MessagesBloc>(context).add(deleteMsg(index));
  }

  void replying() {
    BlocProvider.of<MessagesBloc>(context).add(reply());
    BlocProvider.of<MessagesBloc>(context).add(reeply(editMatn));
  }
}
