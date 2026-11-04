
import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 100), 
          Container(height: 400, color: Colors.blue),

          SizedBox(
            height: 100,
            child: Row(
              children: [
                Expanded(child: Container(color: Colors.green)),
                Container(width: 100, color: Colors.pinkAccent)
              ],
            ),
          ),

          SizedBox(
            height: 100,
            child: Row(
              children: [
                Expanded(child: Container(color: Colors.amber)),
                const SizedBox(width: 20),
                Expanded(child: Container(color: Colors.amber)),
                const SizedBox(width: 20),
                Expanded(child: Container(color: Colors.amber)),
              ],
            ),
          ),

          const SizedBox(height: 50),
          Expanded(child: Container(color: Colors.pinkAccent)),
        ],
      ),
    ),
  ),
);