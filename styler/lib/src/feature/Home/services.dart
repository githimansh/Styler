import 'package:flutter/material.dart';
import 'package:styler/src/models/services_model.dart';

class ItemCard extends StatefulWidget {
  final Item item;
  final VoidCallback? onSelect;

  // Added onSelect as a parameter for reusability
  ItemCard({required this.item, this.onSelect});

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image on the left
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: AssetImage(widget.item.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 12),
          // Textual information
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.item.name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text('\$${widget.item.price.toStringAsFixed(2)}'),
                SizedBox(height: 4),
                Text(widget.item.time),
              ],
            ),
          ),
          SizedBox(width: 12),
          // Select button
          ElevatedButton.icon(
            onPressed: () {
              // Toggle selection
              setState(() {
                isSelected = !isSelected;
              });
              if (widget.onSelect != null) {
                widget.onSelect!();
              }
            },
            icon: Icon(isSelected ? Icons.check : Icons.add),
            label: Text(isSelected ? 'Selected' : 'Select'),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              backgroundColor: isSelected ? Colors.green : Colors.white,
              side: BorderSide(color: Colors.brown),
            ),
          ),
        ],
      ),
    );
  }
}
