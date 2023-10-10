import 'package:flutter/material.dart';
import 'package:shoppingcart_app/components/shoppingcart_detail.dart';
import 'package:shoppingcart_app/components/shoppingcart_header.dart';
import 'package:shoppingcart_app/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: ShoppingCartPage(),
    );
  }
}

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildShoppingCartAppBar(),
      body: Column(
        children: [
          ShoppingCartHeader(),
          ShoppingCartDetail(),
        ],
      ),
    );
  }
}

AppBar _buildShoppingCartAppBar() {
  return AppBar(
    leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
    actions: [IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart))],
    elevation: 0.0,
  );
}
