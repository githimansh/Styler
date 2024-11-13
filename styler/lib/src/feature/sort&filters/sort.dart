import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styler/src/common/provider/sortProvider.dart';

class FilterModal extends ConsumerWidget {
  const FilterModal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Sort & Filters',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          ..._buildFilterSections(ref),
          const SizedBox(height: 16),
          _buildActionButtons(context, ref),
        ],
      ),
    );
  }

  List<Widget> _buildFilterSections(WidgetRef ref) {
    // Define filter sections with their titles, options, and providers
    final filters = [
      {'title': 'Category', 'options': ['All', 'Dresses', 'Designer'], 'provider': categoryProvider},
      {'title': 'Rating', 'options': ['All', '5 Stars', '4 Stars'], 'provider': ratingProvider},
      {'title': 'Price Range', 'options': ['All', '\$100 - \$300', '\$30 - \$100'], 'provider': priceRangeProvider},
      {'title': 'Specialty', 'options': ['All', 'Sustainable Fashion'], 'provider': specialtyProvider},
      {'title': 'Services Offered', 'options': ['All', 'Custom Design'], 'provider': servicesProvider},
    ];

    return filters.map((filter) {
      final title = filter['title'] as String;
      final options = filter['options'] as List<String>;
      final provider = filter['provider'] as StateProvider<String?>;

      final selectedOption = ref.watch(provider);
      return _buildFilterOption(
        title: title,
        options: options,
        selectedOption: selectedOption,
        onOptionSelected: (value) => ref.read(provider.notifier).state = value,
      );
    }).toList();
  }

  Widget _buildFilterOption({
    required String title,
    required List<String> options,
    required String? selectedOption,
    required ValueChanged<String> onOptionSelected,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 10,
          children: options.map((option) {
            final isSelected = option == selectedOption;
            return ChoiceChip(
              label: Text(
                option,
                style: TextStyle(
                  fontSize: 14,
                  color: isSelected ? Colors.white : Colors.blue,
                ),
              ),
              selected: isSelected,
              onSelected: (_) => onOptionSelected(option),
              selectedColor: Colors.blue,
              backgroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              side: const BorderSide(color: Colors.blue, width: 1),
            );
          }).toList(),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          onPressed: () => _resetFilters(ref),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            side: const BorderSide(color: Colors.blue),
          ),
          child: const Text('Cancel', style: TextStyle(color: Colors.blue)),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
          child: const Text('Apply', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }

  void _resetFilters(WidgetRef ref) {
    for (final provider in [categoryProvider, ratingProvider, priceRangeProvider, specialtyProvider, servicesProvider]) {
      ref.read(provider.notifier).state = 'All';
    }
  }
}
