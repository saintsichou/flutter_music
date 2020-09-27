import 'package:flutter/material.dart';

Widget icon_btn(ico,Function handle,{Color color=Colors.white}) {
    return IconButton(
        icon: Icon(
          ico,
          color: color,
        ),
        onPressed: handle);
  }