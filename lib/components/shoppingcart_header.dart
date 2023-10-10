import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shoppingcart_app/constants.dart';

class ShoppingCartHeader extends StatefulWidget {
  const ShoppingCartHeader({super.key});

  @override
  State<ShoppingCartHeader> createState() => _ShoppingCartHeaderState();
}

class _ShoppingCartHeaderState extends State<ShoppingCartHeader> {
  int selectedId = 0;

  List<String> selectedPic = [
    "assets/p1.jpeg",
    "assets/p2.jpeg",
    "assets/p3.jpeg",
    "assets/p4.jpeg",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [buildHeaderPic(), buildHeaderSelector()],
    );
  }

  Padding buildHeaderPic() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AspectRatio(
        aspectRatio: 5 / 3,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            selectedPic[selectedId],
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Padding buildHeaderSelector() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 10, 30, 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildHeaderSelectorButton(0, Icons.directions_bike),
          _buildHeaderSelectorButton(1, Icons.motorcycle),
          _buildHeaderSelectorButton(2, CupertinoIcons.car),
          _buildHeaderSelectorButton(3, CupertinoIcons.airplane),
        ],
      ),
    );
  }

  Container _buildHeaderSelectorButton(var id, var mIcon) {
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        color: id == selectedId ? kAccentColor : kSecondaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: IconButton(
        onPressed: () => setState(() => selectedId = id),
        icon: Icon(mIcon, color: Colors.black),
      ),
    );
  }
}
