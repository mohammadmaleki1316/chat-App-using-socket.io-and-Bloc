

import 'package:flutter/material.dart';

class CustomListtile extends StatelessWidget {
   CustomListtile({super.key,required this.image, required this.leading, required this.title, required this.trailing});
  final Image image;
  final String leading;
  final String title;
  final String trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      subtitle: Text(leading),
      leading: CircleAvatar(child: Icon(Icons.person),),
      title: Text(title),
      trailing: Text(trailing),

    );
  }
}
