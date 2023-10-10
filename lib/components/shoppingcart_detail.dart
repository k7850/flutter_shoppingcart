import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoppingcart_app/constants.dart';

class ShoppingCartDetail extends StatelessWidget {
  const ShoppingCartDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(40)),
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildDetailNameAndPrice(),
            _buildDetailRatingAndReviewCount(),
            _buildDetailColorOptions(),
            _buildDetailButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailColorOptions() => Padding(
        padding: EdgeInsets.only(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Color Options"),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildDetailIcon(Colors.black),
                  _buildDetailIcon(Colors.red),
                  _buildDetailIcon(Colors.yellow),
                  _buildDetailIcon(Colors.green),
                  _buildDetailIcon(Colors.white),
                  _buildDetailIcon(Colors.grey),
                  _buildDetailIcon(Colors.cyan),
                  _buildDetailIcon(Colors.purple),
                ],
              ),
            )
          ],
        ),
      );

  Widget _buildDetailRatingAndReviewCount() {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.star, color: Colors.yellow),
              Icon(Icons.star, color: Colors.yellow),
              Icon(Icons.star, color: Colors.yellow),
              Icon(Icons.star_half_sharp, color: Colors.yellow),
              Icon(Icons.star_border, color: Colors.yellow),
            ],
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(text: "review", style: TextStyle(color: Colors.black)),
                TextSpan(text: "(26)", style: TextStyle(color: Colors.blue)),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDetailNameAndPrice() {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Urban Soft AL 10.0", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text("\$699", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildDetailIcon(Color mColor) {
    return Padding(
      padding: EdgeInsets.only(right: 10),
      child: Stack(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(color: Colors.white, border: Border.all(), shape: BoxShape.circle),
          ),
          Positioned(
            left: 5,
            top: 5,
            child: ClipOval(child: Container(color: mColor, width: 40, height: 40)),
          )
        ],
      ),
    );
  }

  Widget _buildDetailButton(BuildContext context) {
    return Align(
      child: TextButton(
        onPressed: () {
          showCupertinoDialog(
            context: context,
            builder: (context) => CupertinoAlertDialog(
              title: Text("장바구니에 담으시겠습니까?"),
              actions: [
                CupertinoDialogAction(
                  child: Text("확인", style: TextStyle(color: Colors.blue)),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          );
        },
        style: TextButton.styleFrom(
          backgroundColor: kAccentColor,
          minimumSize: Size(300, 50),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        child: Text(
          "Add to Cart",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
