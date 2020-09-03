import 'package:coffee_shop_app/config/palette.dart';
import 'package:coffee_shop_app/widgets/home_screen/products.dart';
import 'package:coffee_shop_app/widgets/home_screen/promotion.dart';
import 'package:coffee_shop_app/widgets/home_screen/user_info.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.green,
      body: SafeArea(
        child: Column(
          children: [
            UserInfo(),
            Promotion(),
            SizedBox(height: 20.0),
            Products(),
          ],
        ),
      ),
    );
  }
}
