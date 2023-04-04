import 'package:flutter/material.dart';

class TextFormGlobal extends StatelessWidget {
  const TextFormGlobal({
    Key? key,
    required this.controller,required this.icon,required this.text,
  }) : super(key: key);
  final TextEditingController controller;
  final Icon icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(margin: EdgeInsets.all(10),

      child: SizedBox(
        width: 300,



        child: TextField(

          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 10),
            filled: true,
              fillColor: Colors.black12,

              prefixIcon: icon,
              hintText: text,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(width:2,color: Colors.red),
              )),
        ),
      ),
    );
  }
}

