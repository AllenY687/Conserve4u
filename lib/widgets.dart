import 'package:flutter/material.dart';

Widget buildInfoCard(IconData icon, String title, String content) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
    ),
    padding: EdgeInsets.all(16),
    margin: EdgeInsets.only(bottom: 16),
    child: Row(
      children: [
        Icon(icon),
        SizedBox(width: 8),
        Expanded( // Use Expanded to wrap the Column
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                content,
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
