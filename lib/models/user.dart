

import 'package:chatwithsocketio/models/messages.dart';
import 'package:flutter/cupertino.dart';

class User {
  String id;
  String name;
  String phone;
  DateTime lastseen;
  String imageAdress;

  User(this.id, this.name,this.phone,this.lastseen,this.imageAdress);
}


User currentUser = users[0];

List<User> users=[
  User('a', 'ali','09941352525',DateTime.now(),'assets/images/a.jpg' ),
  User('b', 'nader','09122425828',DateTime(2024,07,21,08,10,24),'assets/images/b.jpg'),
  User('c', 'mohammad','09365032507',DateTime(2024,07,20,10,20,24),'assets/images/c.jpg'),
  User('d', 'morad', '09332565545',DateTime(2024,07,21,07,00,24),'assets/images/d.jpg'),
  User('f', 'asghar','09133588433',DateTime(2024,07,20,23,40,24),'assets/images/f.jpg'),
];