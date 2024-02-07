import 'package:flutter/material.dart';

class FloatingButton{
  static floatingButton(BuildContext context){
    return Align(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
        child: FloatingActionButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: Icon(
            Icons.home_filled,
            size: 20,
          ),
          backgroundColor: Colors.deepPurple,
          elevation: 0,
        ),
      ),
      alignment: Alignment.centerRight,
    );
  }
}