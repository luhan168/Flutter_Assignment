import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Checkout"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product List
              const Text(
                "Product List",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 20),

              _buildCartItem(
                "iPhone 16",
                "Pink",
                "assets/images/iphone.png",
                799.99,
              ),
              _buildCartItem(
                "Samsung Galaxy S25Ultra",
                "JetBlack",
                "assets/images/samsung.png",
                1499.99,
              ),

              const SizedBox(height: 20),

              // Shipping
              const Text(
                "Shipping",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 18),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  "Street No. 3, Phum Kampong Krabei, Sangkat \nSvay Por,\n"
                  "Krong Battambang, Battambang Province, \nCambodia.\n",
                  style: TextStyle(fontSize: 14, color: Colors.black87),
                ),
              ),

              const SizedBox(height: 24),

              // Promo Code
              const Text(
                "Pro Code",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 17),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Row(
                      children: [
                        Icon(Icons.card_giftcard, color: Colors.black87),
                        SizedBox(width: 8),
                        Text(
                          "NEWUSER (Discount 20%)",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios, size: 16),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Payment Method
              const Text(
                "Payment Method",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 12),

              RadioListTile(
                value: "aba",
                groupValue: "aba",
                onChanged: (value) {},
                title: Row(
                  children: [
                    Image.asset("assets/images/aba.png", width: 32, height: 32),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text(
                        "ABA\nBalance \$ 2,299.98",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                controlAffinity: ListTileControlAffinity.trailing,
              ),
              const SizedBox(height: 8),
              const Text(
                "Other Method",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Column(
                children: [
                  RadioListTile(
                    value: "visa",
                    groupValue: "aba",
                    onChanged: (value) {},
                    title: const Text("Visa Card"),
                    controlAffinity: ListTileControlAffinity.trailing,
                  ),
                  RadioListTile(
                    value: "paypal",
                    groupValue: "aba",
                    onChanged: (value) {},
                    title: const Text("Paypal"),
                    controlAffinity: ListTileControlAffinity.trailing,
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // Order Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Order Now",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCartItem(
    String title,
    String color,
    String image,
    double price,
  ) {
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
                onPressed: () {},
              ),

              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove_circle_outline),
                    onPressed: () {},
                  ),
                  const Text("1", style: TextStyle(fontSize: 16)),
                  IconButton(
                    icon: const Icon(Icons.add_circle_outline),
                    onPressed: () {},
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
