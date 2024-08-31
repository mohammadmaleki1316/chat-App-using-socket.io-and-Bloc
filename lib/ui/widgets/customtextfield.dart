import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.controller,
    this.obsecuretext=false, required this.color, required this.onchange, required this.hint});

  final TextEditingController controller;

  final bool obsecuretext;
  final Color color;
  final String hint;
  final ValueChanged<String> onchange;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 350,
        height: 45,
        child: TextFormField(
          controller: controller,
          onChanged:onchange ,
          decoration: InputDecoration(
              filled: true,
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey),
              fillColor: color,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none
              ),
          ),
            obscureText: obsecuretext,

        ));
  }
}
