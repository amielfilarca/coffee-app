import 'package:coffee_shop_app/config/palette.dart';
import 'package:coffee_shop_app/models/coffee_model.dart';
import 'package:coffee_shop_app/screens/details_screen.dart';
import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
          child: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                'Time for a coffee!',
                style: TextStyle(
                    color: Palette.brown,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
              ),
              IconButton(
                  icon: Icon(Icons.search, size: 30.0),
                  onPressed: () {
                    print('Search button pressed.');
                  })
            ]),
            SizedBox(height: 20.0),
            Flexible(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                children: List.generate(coffee.length, (index) {
                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailsScreen(coffee: coffee[index]),
                      ),
                    ),
                    child: Container(
                      child: Card(
                        elevation: 0.0,
                        color: Palette.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Center(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Hero(
                                  tag: index,
                                  child: Image.asset(
                                      '${coffee[index].imageUrl}',
                                      height: 70.0),
                                ),
                                Text(
                                  '${coffee[index].name}',
                                  style: TextStyle(
                                      color: Palette.brown,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  '\$${coffee[index].price.toStringAsFixed(2)}',
                                  style: TextStyle(
                                      color: Palette.brown, fontSize: 18.0),
                                ),
                              ]),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
