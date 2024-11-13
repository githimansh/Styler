import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styler/src/common/provider/provider.dart';
import 'package:styler/src/feature/Home/services.dart';
import 'package:styler/src/models/services_model.dart';
// import 'package:styler/src/utlis/widgets/item_card.dart'; // Assuming ItemCard is in the widgets folder

class ItemListScreen extends ConsumerWidget {
  final String title;
  final Color appBarColor;
  final List<String> categories;
  final Function(Item)? onItemSelect;

  // Making title, appBarColor, categories, and onItemSelect customizable
  ItemListScreen({
    required this.title,
    required this.appBarColor,
    required this.categories,
    this.onItemSelect,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(itemsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: appBarColor,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          for (var category in categories)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                  ),
                ),
                SizedBox(height: 8),
                ...items
                    .where((item) => item.category == category)
                    .map((item) => ItemCard(
                          item: item,
                          onSelect: onItemSelect != null
                              ? () => onItemSelect!(item)
                              : null, // Call onItemSelect if provided
                        ))
                    .toList(),
                SizedBox(height: 16),
              ],
            ),
        ],
      ),
    );
  }
}
