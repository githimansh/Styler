import 'package:flutter/material.dart';

class NotificationItem {
  final String title;
  final String description;
  final String date; 
  final IconData icon;

  NotificationItem({
    required this.title,
    required this.description,
    required this.date,
    required this.icon,
  });
}
