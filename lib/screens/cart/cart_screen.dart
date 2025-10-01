import 'package:flutter/material.dart';
import 'package:phone_shop/screens/checkout_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // Dummy cart data
  final List<Map<String, dynamic>> _cartItems = [
    {
      "name": "iPhone 16",
      "color": "Pink",
      "price": 799.99,
      "qty": 1,
      "image": "assets/images/iphone.png",
    },
    {
      "name": "Samsung Galaxy S25 Ultra",
      "color": "JetBlack",
      "price": 1499.99,
      "qty": 1,
      "image": "assets/images/samsung.png",
    },
  ];

  double get totalPrice {
    return _cartItems.fold(
      0,
      (sum, item) => sum + (item["price"] * item["qty"]),
    );
  }

  void _increaseQty(int index) {
    setState(() {
      _cartItems[index]["qty"]++;
    });
  }

  void _decreaseQty(int index) {
    setState(() {
      if (_cartItems[index]["qty"] > 1) {
        _cartItems[index]["qty"]--;
      }
    });
  }

  void _removeItem(int index) {
    setState(() {
      _cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Product List",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 12),

            // List of cart items
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    height: 300,
                    child: ListView.builder(
                      itemCount: _cartItems.length,
                      itemBuilder: (context, index) {
                        return _buildCartItem(
                          title: _cartItems[index]["name"],
                          color: _cartItems[index]["color"],
                          image: _cartItems[index]["image"],
                          price: _cartItems[index]["price"],
                          qty: _cartItems[index]["qty"],
                          onRemove: () => _removeItem(index),
                          onIncrease: () => _increaseQty(index),
                          onDecrease: () => _decreaseQty(index),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            // Total & Checkout Button
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Total",
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "\$${totalPrice.toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 250,
                      child: FilledButton(
                        style: FilledButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              10,
                            ), // 👈 just a little rounded
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return CheckoutScreen();
                              },
                            ),
                          );
                        },
                        child: const Text(
                          "Checkout",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildCartItem({
  required String title,
  required String color,
  required String image,
  required double price,
  required int qty,
  required VoidCallback onRemove,
  required VoidCallback onIncrease,
  required VoidCallback onDecrease,
}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 12),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(image, width: 60, height: 60, fit: BoxFit.cover),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(color, style: const TextStyle(color: Colors.grey)),
              const SizedBox(height: 4),
              Text(
                "\$${price.toStringAsFixed(2)}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(
              icon: Image.asset('assets/images/deleteIcon.png', scale: 1.3),
              onPressed: onRemove,
            ),

            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove_circle_outline),
                  onPressed: onIncrease,
                ),
                Text("$qty", style: TextStyle(fontSize: 16)),
                IconButton(
                  icon: const Icon(Icons.add_circle_outline),
                  onPressed: onDecrease,
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
