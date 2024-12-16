import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styler/src/common/provider/provider.dart';
import 'package:styler/src/utlis/AppColors.dart';

class NotificationScreen extends ConsumerWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifications = ref.watch(notificationProvider);

    final groupedNotifications = <String, List<NotificationItem>>{};
    for (var notification in notifications) {
      groupedNotifications.putIfAbsent(notification.date, () => []).add(notification);
    }
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Notification', style: TextStyle(color: AppColors.textColor, fontWeight: FontWeight.bold),),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
        backgroundColor: AppColors.background,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        children: groupedNotifications.entries.map((entry) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                entry.key,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: AppColors.textColor,
                ),
              ),
              const SizedBox(height: 10),
              ...entry.value.map(_buildNotificationCard),
              const SizedBox(height: 20),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildNotificationCard(NotificationItem notification) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: AppColors.iconBackground,
            
            child: Icon(notification.icon, color: AppColors.buttonColor),
          ),
          title: Text(
            notification.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(notification.description),
          isThreeLine: true,
        ),
      ),
    );
  }
}
