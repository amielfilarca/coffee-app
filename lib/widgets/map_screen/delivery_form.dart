import 'package:coffee_shop_app/config/palette.dart';
import 'package:flutter/material.dart';

class DeliveryForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        Positioned(
          bottom: 0.0,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0)),
            ),
            width: double.infinity,
            height: 300.0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: ListView(children: [
                Text(
                  'Delivery Address',
                  style: TextStyle(
                      color: Palette.brown,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30.0),
                Container(
                  decoration: BoxDecoration(
                      color: Palette.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 25.0,
                          ),
                          Container(
                            width: 240.0,
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Your Address',
                                border: InputBorder.none,
                              ),
                              style: TextStyle(color: Palette.brown),
                            ),
                          ),
                        ]),
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  decoration: BoxDecoration(
                      color: Palette.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.add,
                            size: 25.0,
                          ),
                          Container(
                            width: 240.0,
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Any Introduction?',
                                border: InputBorder.none,
                              ),
                              style: TextStyle(color: Palette.brown),
                            ),
                          ),
                        ]),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  onPressed: () {
                    print('I am Here button pressed.');
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50.0,
                    child: Text(
                      'I am Here',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
                  color: Palette.green,
                )
              ]),
            ),
          ),
        )
      ]),
    );
  }
}
