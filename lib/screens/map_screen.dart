import 'package:coffee_shop_app/config/palette.dart';
import 'package:coffee_shop_app/widgets/map_screen/delivery_form.dart';
import 'package:coffee_shop_app/widgets/map_screen/google_map.dart';
import 'package:flutter/material.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        GoogleMapWidget(),
        DeliveryForm(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 25.0),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Palette.brown,
              size: 25.0,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        )
      ]),
    );
  }
}
