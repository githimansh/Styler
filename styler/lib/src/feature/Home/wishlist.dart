import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styler/src/common/provider/provider.dart';
import 'package:styler/src/models/wishlist_model.dart';
import 'package:styler/src/utlis/AppColors.dart';
import 'package:styler/src/utlis/Widgets/Custom_Buttom.dart';

final filterProvider = StateProvider<String>((ref) => 'All');
final selectedTailorsProvider = StateProvider<List<int>>((ref) => []);

class MyWishlistScreen extends ConsumerWidget {
  const MyWishlistScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Wishlist'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          _buildFilterTabs(ref),
          _buildSearchBar(),
          Expanded(
            child: ListView(
              children: _buildTailorCards(ref),
            ),
          ),
          _buildCheckoutButton(),
        ],
      ),
    );
  }

  Widget _buildFilterTabs(WidgetRef ref) {
    final selectedFilter = ref.watch(filterProvider);
    final filters = ['All', 'Dresses'];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: filters.map(
          (filter) => GestureDetector(
            onTap: () => ref.read(filterProvider.notifier).state = filter,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: selectedFilter == filter ? Colors.brown : Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.brown),
              ),
              child: Text(
                filter,
                style: TextStyle(
                  color: selectedFilter == filter ? Colors.white : Colors.brown,
                ),
              ),
            ),
          ),
        ).toList(),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          hintText: 'Search',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey[200],
        ),
      ),
    );
  }

  List<Widget> _buildTailorCards(WidgetRef ref) {
    final tailors = ref.watch(tailorProvider);
    final selectedFilter = ref.watch(filterProvider);

    return tailors
        .where((tailor) => selectedFilter == 'All' || tailor.tag == selectedFilter)
        .map((tailor) => _buildTailorCard(ref, tailor))
        .toList();
  }

  Widget _buildTailorCard(WidgetRef ref, tailor) {
    final selectedTailors = ref.watch(selectedTailorsProvider);

    return Container(
      width: 370,
      height: 167,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            offset: const Offset(0, 6),
            blurRadius: 30,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                image: AssetImage(tailor.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tailor.name,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      tailor.rating.toString(),
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${tailor.ordersCompleted} orders completed',
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w800,
                        fontSize: 12,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () {},
                  child: Text(tailor.tag),
                  style: TextButton.styleFrom(
                    backgroundColor: tailor.tag == 'Designer' ? Colors.blue : Colors.pink,
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${tailor.price}+',
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckoutButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomButton(
        buttonText: 'Checkout',
        onPressed: () {},
      ),
    );
  }
}
