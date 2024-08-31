

import 'package:chatwithsocketio/models/user.dart';
 User? sender;
void findUser(String senderId){
  for(var item in users){
    if(item.id==senderId){
      sender=User(item.id, item.name,item.phone , item.lastseen,item.imageAdress);
      break;
    }
  }
}