import 'package:flutter/material.dart';

texts({title, text, icon}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        SizedBox(width: 10,),
        Icon(
          icon,
          color: Colors.blue,
          size: 18,
        ),
        SizedBox(width: 7),
        Text(
          text,
          style: TextStyle(color: Colors.black,fontSize: 18),
        ),
      ],
    ),
  );
}
