import 'package:flutter/material.dart';

class DetailProductScreen extends StatelessWidget {
  const DetailProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Product"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            // Product Image
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  "assets/images/iphone.png",
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Title + Price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "iPhone 16",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text(
                  "\$799.99",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // Rating
            Row(
              children: const [
                Icon(Icons.star, color: Colors.amber, size: 18),
                SizedBox(width: 4),
                Text("4.8 | Sold 250+"),
              ],
            ),
            const SizedBox(height: 26),

            // Detail Product Section
            const Text(
              "Detail Product",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 16),
            const Text("Condition\t\t\t\t\t\t\t\t\t\t\t\t\t: New"),
            const Text("Chip\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t: A18"),
            const Text("Weight\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t: 170 Gram"),
            const Text("Category\t\t\t\t\t\t\t\t\t\t\t\t\t\t: iOS"),
            const SizedBox(height: 8),
            const Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
              "Risus feugiat morbi sed orci. Justo, dignissim egestas "
              "pellentesque maecenas libero, nunc ipsum.",
            ),
            TextButton(onPressed: () {}, child: const Text("More Information")),

            const SizedBox(height: 20),

            // Storage Options
            const Text(
              "Choose Storage",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 15),
            Wrap(
              spacing: 8,
              children: [
                ChoiceChip(label: const Text("128GB"), selected: false),
                ChoiceChip(label: const Text("256GB"), selected: false),
                ChoiceChip(label: const Text("512GB"), selected: false),
                ChoiceChip(label: const Text("1TB"), selected: false),
              ],
            ),

            const SizedBox(height: 16),

            // Color Options
            const Text(
              "Choose Color",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 15),
            Wrap(
              spacing: 12,
              children: [
                _buildColorBox(Colors.black),
                _buildColorBox(Colors.blue),
                _buildColorBox(Colors.purple, isSelected: true),
                _buildColorBox(Colors.orange),
              ],
            ),

            const SizedBox(height: 24),

            // Reviews
            const Text(
              "Reviews",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            _buildReview("Achmed", "Feb 2022", "⭐️⭐️⭐️⭐️⭐️"),
            _buildReview("Sonya", "Jan 2022", "⭐️⭐️⭐️⭐️"),
          ],
        ),
      ),

      // Bottom Add to Cart
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.message),
            style: IconButton.styleFrom(
              padding: EdgeInsets.all(18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: const BorderSide(
                  color: Colors.black,
                  width: 2,
                ), // rounded corners
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: FilledButton(
              onPressed: () {},
              style: FilledButton.styleFrom(
                backgroundColor: Colors.black,
                fixedSize: Size(300, 60),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text("Add to Cart", style: TextStyle(fontSize: 18)),
            ),
          ),
        ],
      ),
    );
  }

  // Color Box Widget
  static Widget _buildColorBox(Color color, {bool isSelected = false}) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
        border: isSelected ? Border.all(color: Colors.black, width: 2) : null,
      ),
    );
  }

  // Review Widget
  static Widget _buildReview(String name, String date, String stars) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.circle, size: 50, color: Colors.grey),
                SizedBox(width: 8),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(stars),
                  ],
                ),
                // Text(date, style: const TextStyle(color: Colors.grey)),
              ],
            ),

            const SizedBox(height: 8),
            Row(children: [SizedBox(width: 8), Text(date)]),
            const SizedBox(height: 8),
            const Text(
              "The item is original. Sealed packaging. Specifications match. "
              "There is an official guarantee. Appropriate equipment. "
              "Color to order. The stuff is smooth. The seller is very friendly.",
            ),
          ],
        ),
      ),
    );
  }
}
