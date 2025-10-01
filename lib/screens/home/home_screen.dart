import 'package:flutter/material.dart';
import 'package:phone_shop/screens/cart/cart_screen.dart';

import 'package:phone_shop/screens/explore_product_page.dart';
import 'package:phone_shop/screens/profile_page.dart';
// import 'package:phone_shop/screens/welcome_screen.dart';
// import 'package:phone_shop/screens/detail/detail_product_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

  // --- helper widgets (same as your version) ---
  static Widget _buildCategoryChip(
    String label, {
    String? iconPath,
    bool selected = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ChoiceChip(
        avatar: iconPath != null
            ? Image.asset(iconPath, width: 28, height: 28)
            : null,
        label: Text(
          label,
          style: const TextStyle(fontSize: 16, color: Colors.black),
        ),
        selected: selected,
        selectedColor: Colors.deepPurple,
        labelStyle: TextStyle(color: selected ? Colors.white : Colors.black),
        onSelected: (_) {},
      ),
    );
  }

  static Widget _buildSectionTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        TextButton(onPressed: () {}, child: const Text("See All")),
      ],
    );
  }

  static Widget _buildPromotionCard() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      width: 320,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Padding(
        padding: EdgeInsets.all(23),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Discount ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.pinkAccent,
                  ),
                ),
                Text(
                  "Up to",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Text(
              "Promotion Banner",
              style: TextStyle(
                fontSize: 33,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildProductCard(
    BuildContext context,
    String name,
    String image,
    String price,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detail');
      },
      child: Container(
        width: 160,
        margin: const EdgeInsets.only(right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(image, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            Text(
              price,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: const [
                Icon(Icons.star, size: 16, color: Colors.amber),
                SizedBox(width: 4),
                Text(
                  "4.8 | Sold 250+",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildListProduct(String name, String price, String image) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(image, width: 60, height: 60, fit: BoxFit.cover),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name),
              Text(
                price,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              Row(
                children: const [
                  Icon(Icons.star, size: 16, color: Colors.amber),
                  SizedBox(width: 4),
                  Text(
                    "4.8 | Sold 250+",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    // Screen 0 -> Home UI
    _HomeContent(),

    // Screen 1 -> Categories (replace later with your own screen)
    ExploreProductPage(),
    // WelcomeScreen(),

    // Screen 2 -> Cart
    CartScreen(),
    // Screen 3 -> Profile
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _screens),
      bottomNavigationBar: NavigationBar(
        indicatorColor: Theme.of(context).canvasColor,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: ''),
          NavigationDestination(icon: Icon(Icons.list_alt), label: ''),
          NavigationDestination(icon: Icon(Icons.shop), label: ''),
          NavigationDestination(icon: Icon(Icons.person), label: ''),
        ],
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

/// --- extract Home UI into its own widget so IndexedStack works properly ---
class _HomeContent extends StatelessWidget {
  const _HomeContent();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            // Header user info
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage("assets/images/user.png"),
                        radius: 24,
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "User",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "Welcome Back!",
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.notifications_outlined, size: 32),
                    onPressed: () {},
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Search bar
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 305,
                  height: 40,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search product, brand",
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {},
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          12,
                        ), // rounded corners
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
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.tune),
                  style: IconButton.styleFrom(
                    backgroundColor: Color.fromRGBO(219, 220, 218, 1),
                    padding: EdgeInsets.all(8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        12,
                      ), // rounded corners
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            // Information Store Banner
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 13,
                  vertical: 25,
                ),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    transform: GradientRotation(26.6),
                    colors: [
                      Colors.black,
                      Color.fromARGB(255, 234, 149, 22), // gold
                      Colors.black,
                      Color.fromARGB(255, 75, 146, 203), // blue
                      Colors.black,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.black87, // darker pill background
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      child: Text(
                        "Information Store", // ✅ spelling fixed
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 45),

            // Categories Row
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  HomeScreen._buildCategoryChip("All"),
                  HomeScreen._buildCategoryChip(
                    "Apple",
                    iconPath: "assets/images/apple.png",
                  ),
                  HomeScreen._buildCategoryChip(
                    "Samsung",
                    iconPath: "assets/images/samsung_icon.png",
                  ),
                  HomeScreen._buildCategoryChip(
                    "Huawei",
                    iconPath: "assets/images/huawei.png",
                  ),
                  HomeScreen._buildCategoryChip(
                    "Xiaomi",
                    iconPath: "assets/images/xiaomi.png",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 35),

            // Promotion Banner
            const SizedBox(height: 19),
            SizedBox(
              height: 115,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return HomeScreen._buildPromotionCard();
                },
              ),
            ),
            SizedBox(height: 18),
            // Best Sellers
            HomeScreen._buildSectionTitle("Best Sellers"),
            const SizedBox(height: 10),
            SizedBox(
              height: 260,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  HomeScreen._buildProductCard(
                    context,
                    "iPhone 16",
                    "assets/images/iphone.png",
                    "\$799.99",
                  ),
                  HomeScreen._buildProductCard(
                    context,
                    "Samsung Galaxy S24 Ultra",
                    "assets/images/samsung.png",
                    "\$999.99",
                  ),
                  HomeScreen._buildProductCard(
                    context,
                    "Samsung Galaxy S24 Ultra",
                    "assets/images/samsung.png",
                    "\$999.99",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 26),

            // Recommendation
            HomeScreen._buildSectionTitle("Recommendation"),
            const SizedBox(height: 8),
            Column(
              children: [
                HomeScreen._buildListProduct(
                  "iPhone 15 Pro Max",
                  "\$1269.00",
                  "assets/images/iphone15.png",
                ),
                HomeScreen._buildListProduct(
                  "Galaxy Z Fold7",
                  "\$1899.99",
                  "assets/images/fold7.png",
                ),
                HomeScreen._buildListProduct(
                  "Galaxy Z Fold7",
                  "\$1899.99",
                  "assets/images/fold7.png",
                ),
                HomeScreen._buildListProduct(
                  "Galaxy Z Fold7",
                  "\$1899.99",
                  "assets/images/fold7.png",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
