import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Container(
      color: Colors.blue[300],
      padding: const EdgeInsets.all(50),
      margin: const EdgeInsets.all(50),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue[100],
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Center(
          child: Text(
            'CATD students',
            style: TextStyle(fontSize: 60, color: Colors.white),
          ),
        ),
      ),
    ),
  ),  
);