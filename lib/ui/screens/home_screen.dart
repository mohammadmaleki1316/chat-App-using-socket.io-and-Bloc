import 'package:chatwithsocketio/bloc/messages_bloc.dart';
import 'package:chatwithsocketio/models/user.dart';
import 'package:chatwithsocketio/ui/screens/chat_screen.dart';
import 'package:chatwithsocketio/ui/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/messages.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    bool exist = true;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 65,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ));
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: CircleAvatar(
                backgroundImage: AssetImage(currentUser.imageAdress),
              ),
            ),
          ),
          title: const Text(
            'Chat',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.edit,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.chat,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              child: TextFormField(
                  controller: searchController,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.withOpacity(0.1),
                    filled: true,
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    hintText: 'Search',
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none),
                  )),
            ),
            if (exist) ...[
              ListTile(
                leading: const CircleAvatar(
                  child: Text('P'),
                ),
                title: const Text('Public Chat Room'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider(
                          create: (context) => MessagesBloc(),
                          child: ChatScreen(),
                        ),
                      ));
                },
              )
            ] else ...[
              const Spacer(),
              const Text(
                'Get Started',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'press',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.chat,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'to start messaging',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              const Spacer(),
            ]
          ],
        ));
  }
}
