import 'package:flutter/material.dart';

texts({title, text, icon}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        const SizedBox(width: 10,),
        Icon(
          icon,
          color: Colors.blue,
          size: 18,
        ),
        const SizedBox(width: 7),
        Text(
          text,
          style: const TextStyle(color: Colors.black,fontSize: 18),
        ),
      ],
    ),
  );
}
