import 'package:coffee_shop_app/config/palette.dart';
import 'package:flutter/material.dart';

class Promotion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 150.0,
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
            child: ClipRRect(
              child: Image.asset(
                'assets/images/promotion.jpg',
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          Container(
            height: 150.0,
            padding: EdgeInsets.only(left: 20.0, right: 150.0),
            child: Center(
              child: Text(
                "Get 20% discount for your first order today!",
                style: TextStyle(
                  color: Palette.brown,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
