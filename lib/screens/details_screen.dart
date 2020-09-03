import 'package:coffee_shop_app/config/palette.dart';
import 'package:coffee_shop_app/models/coffee_model.dart';
import 'package:coffee_shop_app/screens/map_screen.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final Coffee coffee;

  DetailsScreen({this.coffee});

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int _quantity = 1;
  int _selectedSizeIndex = 1;
  static const List _sizes = const ['S', 'M', 'L'];
  static const List _avatars = const [
    'assets/images/avatar1.jpg',
    'assets/images/avatar2.jpg',
    'assets/images/avatar3.jpg',
    'assets/images/avatar4.jpg',
    'assets/images/avatar5.jpg',
  ];

  Widget _buildAvatars(int index) {
    return Transform(
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        child: Image.asset(
          'assets/images/avatar${index + 1}.jpg',
          height: 25.0,
        ),
      ),
      transform:
          Matrix4.translationValues(index.toDouble() * 12 + 20, 10.0, 0.0),
    );
  }

  Widget _buildSizeButtons(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        width: 50.0,
        height: 30.0,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            width: 1.5,
          ),
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        child: RaisedButton(
          elevation: 0.0,
          color: _selectedSizeIndex == index ? Colors.white : Palette.green,
          onPressed: () {
            setState(() {
              _selectedSizeIndex = index;
            });
          },
          child: Text(
            _sizes[index],
            style: TextStyle(
              color: _selectedSizeIndex == index ? Colors.black : Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.green,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Palette.green,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Details',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.map),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MapScreen(),
                ),
              );
            },
          )
        ],
      ),
      body: Column(children: [
        Container(
          child: Center(
            child: Column(children: [
              Text(
                widget.coffee.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                '\$${widget.coffee.price.toStringAsFixed(2)}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ]),
          ),
        ),
        Container(
          height: 300.0,
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _sizes
                      .asMap()
                      .entries
                      .map((MapEntry map) => _buildSizeButtons(map.key))
                      .toList(),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                child: Hero(
                  tag: coffee.indexOf(widget.coffee),
                  child: Image.asset(
                    widget.coffee.imageUrl,
                    height: MediaQuery.of(context).size.width / 2,
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          width: 150.0,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            IconButton(
                icon: Icon(Icons.remove),
                color: Colors.white,
                onPressed: () {
                  setState(() {
                    _quantity > 1 ? _quantity-- : null;
                  });
                }),
            Text(
              _quantity.toString(),
              style: TextStyle(color: Colors.white),
            ),
            IconButton(
                icon: Icon(Icons.remove),
                color: Colors.white,
                onPressed: () {
                  setState(() {
                    _quantity++;
                  });
                }),
          ]),
        ),
        SizedBox(
          height: 50.0,
        ),
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 4,
              height: 50.0,
              child: Stack(
                children: _avatars
                    .asMap()
                    .entries
                    .map((MapEntry map) => _buildAvatars(map.key))
                    .toList(),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 4,
              child: Text(
                '155+ Review',
                style: TextStyle(color: Colors.white, fontSize: 12.0),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(25.0))),
              width: MediaQuery.of(context).size.width / 2,
              height: 50.0,
              child: ClipRRect(
                child: RaisedButton(
                  onPressed: () {
                    print('Add to Cart button pressed.');
                  },
                  child: Text(
                    'Add to Cart',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25.0),
                ),
              ),
            ),
          ],
        )
      ]),
    );
  }
}
