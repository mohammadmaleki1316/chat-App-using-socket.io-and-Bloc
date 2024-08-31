
import 'package:chatwithsocketio/models/user.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Me',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(currentUser.imageAdress),
                    radius: 80,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    currentUser.name.toUpperCase(),
                    style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Edit',
                      style: TextStyle(fontSize: 20, color: Colors.blueAccent),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Profile',
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
            ),
             const ListTile(
              leading: CircleAvatar(radius: 30,backgroundColor: Colors.green,child:Icon(Icons.offline_pin_rounded),),
              title: Text('Active Status'),
              subtitle: Text('Online'),
            ),
            ListTile(
              leading: const CircleAvatar(radius: 30,child:Icon(Icons.person) ,),
              title: const Text('Username'),
              subtitle: Text(currentUser.id),
            ),
            ListTile(
              leading: const CircleAvatar(radius: 30,backgroundColor: Colors.blue,child:Icon(Icons.phone) ,),
              title: const Text('Phone Number'),
              subtitle: Text(currentUser.phone),
            ),
          ],
        ),
      ),
    );
  }
}


