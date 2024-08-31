



class Messages {
  String type;
  String senderId;
  DateTime time;
  String matn;
  bool reply;
  String repl;
  bool edited=false;

  Messages(this.type,this.senderId, this.time, this.matn,this.reply,this.repl);


}

// List<Messages> messages2 =[
//   Messages('a', DateTime(2024,7,21,13,40,22),'che khabar?' ),
//   Messages('c', DateTime(2024,7,21,10,20,22),'salam'),
//   Messages('d', DateTime(2024,7,21,10,10,22),'salam'),
//   Messages('d',DateTime(2024,7,21,10,11,22),'khoobin?'),
//   Messages('f', DateTime(2024,7,21,09,40,22),'salam'),
//   Messages('c', DateTime(2024,7,21,11,00,22),'cheghad salaaam mmmmmmmmmmmm'),
//   Messages('a', DateTime(2024,7,21,08,40,22),'salam' ),
//   Messages('b', DateTime(2024,7,21,08,40,22),'salam che khabar bache ha?' )
// ];

