import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// StateProvider for managing count
final countProvider = StateProvider<int>((ref) => 0);

class RecommendedWidget extends ConsumerWidget {
  final String imageUrl;
  final String name;
  final String price;
  final String duration;

  const RecommendedWidget({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.duration,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Accessing the count value from the provider
    final count = ref.watch(countProvider);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Row(
        children: [
          // Image Section
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              imageUrl,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10), // Space between image and text
          // Text and Details Section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 0),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  duration,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          // Button Section
          Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  // Update the count value in the provider
                  ref.read(countProvider.notifier).state++;
                },
                child: Text("Select + $count"), // Corrected this line
              ),
            ],
          ),
        ],
      ),
    );
  }
}
