import 'package:flutter/material.dart';
import 'package:phone_shop/screens/checkout_screen.dart';
import 'package:phone_shop/screens/welcome_screen.dart';
import 'screens/detail/detail_product_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/cart/cart_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product App',
      debugShowCheckedModeBanner: false,

      // ✅ Enable Material 3
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(253, 255, 245, 1),
          primary: const Color.fromARGB(255, 192, 192, 191),
          secondary: const Color.fromARGB(255, 246, 246, 246),
        ),
      ),

      // ✅ Default Screen
      // initialRoute: '/home',
      home: WelcomeScreen(),
      // ✅ Named routes
      routes: {
        '/home': (context) => const HomeScreen(),
        '/checkout': (context) => const CheckoutScreen(),
        '/detail': (context) => const DetailProductScreen(),
        '/cart': (context) => const CartScreen(),
      },
    );
  }
}
