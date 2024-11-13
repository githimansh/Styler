import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:styler/src/models/services_model.dart'; 
import 'package:styler/src/models/user.dart'; 

final userProvider = Provider<User>((ref) {
  return User(
    name: "Neha Singh",
    location: "Mumbai, Maharashtra",
    imageUrl: "https://via.placeholder.com/150", 
  );
});

class Appointment {
  final String title;
  final String time;
  final String date;

  Appointment({
    required this.title,
    required this.time,
    required this.date,
  });
}
final appointmentProvider = Provider<Appointment>((ref) {
  return Appointment(
    title: "Bridal, Amelia Couture",
    time: "10:23 AM",
    date: "Today, Morning",
  );
});

class Tailor {
  final String name;
  final double rating;
  final int ordersCompleted;
  final double price;
  final String tag;
  final String image;

  Tailor({
    required this.name,
    required this.rating,
    required this.ordersCompleted,
    required this.price,
    required this.tag,
    required this.image,
  });
}

final tailorProvider = Provider<List<Tailor>>((ref) {
  return [
    Tailor(
      name: 'Amelia Couture',
      rating: 4.8,
      ordersCompleted: 2347,
      price: 500,
      tag: 'Designer',
      image: 'assets/images/tailor.png',
    ),
    Tailor(
      name: 'Luxe Tailor',
      rating: 4.6,
      ordersCompleted: 1872,
      price: 300,
      tag: 'Designer',
      image: 'assets/images/tailor.png',
    ),
    Tailor(
      name: 'Elegant Stitch',
      rating: 4.3,
      ordersCompleted: 1640,
      price: 120,
      tag: 'Tailor',
      image: 'assets/images/tailor.png',
    ),
    Tailor(
      name: 'Chic Tailors',
      rating: 4.5,
      ordersCompleted: 1320,
      price: 150,
      tag: 'Tailor',
      image: 'assets/images/tailor.png',
    ),
  ];
});


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

final notificationProvider = Provider<List<NotificationItem>>((ref) {
  return [
    NotificationItem(
      title: 'Your Order is Ready!',
      description: 'Your custom suit is now complete and ready for pickup.',
      date: 'Today',
      icon: Icons.check_circle,
    ),
    NotificationItem(
      title: 'Appointment Reminder',
      description: 'Your fitting appointment with Luxe Tailor is tomorrow at 3 PM.',
      date: 'Yesterday',
      icon: Icons.calendar_today,
    ),
    NotificationItem(
      title: 'Exclusive Discount',
      description: 'Enjoy 20% off your next alteration service for a limited time!',
      date: 'Yesterday',
      icon: Icons.local_offer,
    ),
    NotificationItem(
      title: 'New Collection Alert',
      description: 'Bella Designs just launched a new summer collection, check it out!',
      date: 'September 05, 2024',
      icon: Icons.drafts, 
    ),
    NotificationItem(
      title: 'Order Shipped',
      description: 'Your order #78984 has been shipped and is on its way to you.',
      date: 'September 05, 2024',
      icon: Icons.local_shipping,
    ),
    NotificationItem(
      title: 'Profile Updated',
      description: 'Your profile and measurements have been successfully updated.',
      date: 'September 05, 2024',
      icon: Icons.person,
    ),
  ];
});

final filterProvider = StateProvider<String>((ref) => 'All');
final selectedTailorsProvider = StateProvider<List<int>>((ref) => []);


final itemsProvider = Provider<List<Item>>((ref) {
  return [
    Item(
      name: 'Clara Devereaux',
      imageUrl: 'assets/clara_image.png',
      price: 40.0,
      time: '40 Mins',
      category: 'Recommended',
    ),
    Item(
      name: 'VIP Couture Experience Package',
      imageUrl: 'assets/vip_couture.png',
      price: 40.0,
      time: '40 Mins',
      category: 'Packages',
    ),
    Item(
      name: 'Custom Tailored Suits',
      imageUrl: 'assets/custom_tailored_suits.png',
      price: 40.0,
      time: '40 Mins',
      category: 'Popular',
    ),
    // Add more items here as needed
  ];

  
});
