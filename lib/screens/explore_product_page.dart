import 'package:flutter/material.dart';

class ExploreProductPage extends StatelessWidget {
  const ExploreProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Text(
          "Explore Products",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: "Search product, brand",
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12), // rounded corners
                  borderSide: BorderSide.none, // remove visible border
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Color.fromRGBO(219, 220, 218, 1),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Search by Category
            const Text(
              "Search by Category",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                _buildCategoryChip("Apple", 'assets/images/apple.png'),
                _buildCategoryChip("Xiaomi", 'assets/images/xiaomi.png'),
                _buildCategoryChip("Samsung", 'assets/images/samsung_icon.png'),
                _buildCategoryChip("Honor", 'assets/images/honor.png'),
                _buildCategoryChip("Huawei", 'assets/images/huawei.png'),
              ],
            ),
            const SizedBox(height: 25),

            // Trending Search
            const Text(
              "Trending Search",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                Chip(
                  backgroundColor: Color.fromRGBO(237, 237, 237, 1),
                  label: Text("iPhone 16"),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // rounded corners
                    side: BorderSide.none, // remove border
                  ),
                ),
                Chip(
                  backgroundColor: Color.fromRGBO(237, 237, 237, 1),
                  label: Text("Galaxy S24Ultra"),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // rounded corners
                    side: BorderSide.none, // remove border
                  ),
                ),
                Chip(
                  backgroundColor: Color.fromRGBO(237, 237, 237, 1),
                  label: Text("iPhone 15 Pro Max"),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // rounded corners
                    side: BorderSide.none, // remove border
                  ),
                ),
                Chip(
                  backgroundColor: Color.fromRGBO(237, 237, 237, 1),
                  label: Text("Honor 400"),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // rounded corners
                    side: BorderSide.none, // remove border
                  ),
                ),
                Chip(
                  backgroundColor: Color.fromRGBO(237, 237, 237, 1),
                  label: Text("Huawei Pura 70"),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // rounded corners
                    side: BorderSide.none, // remove border
                  ),
                ),
                Chip(
                  backgroundColor: Color.fromRGBO(237, 237, 237, 1),
                  label: Text("Xiaomi 15 Ultra"),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // rounded corners
                    side: BorderSide.none, // remove border
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),

            // Trending Products Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Trending Products",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "See All",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Product List
            _buildProductTile(
              "Honor 400 Pro",
              "\$348",
              "⭐ 4.8 | Sold 250+",
              "assets/images/honor-400.jpg",
            ),
            _buildProductTile(
              "Samsung Galaxy S24Ultra",
              "\$348",
              "⭐ 4.8 | Sold 250+",
              "assets/images/Galaxy-s24-ultra.jpg",
            ),
            _buildProductTile(
              "iPhone 16",
              "\$348",
              "⭐ 4.8 | Sold 250+",
              "assets/images/iPhone_16.jpg",
            ),
          ],
        ),
      ),
    );
  }

  // Category Chip Widget
  static Widget _buildCategoryChip(String label, String image) {
    return GestureDetector(
      onTap: () {},
      child: Chip(
        avatar: Image.asset(image),
        label: Text(label),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  // Product Tile Widget
  static Widget _buildProductTile(
    String title,
    String price,
    String subtitle,
    String imageUrl,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imageUrl,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.grey, fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
