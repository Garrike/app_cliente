import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bottom_navy_bar.dart';

class Product extends StatefulWidget {
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance =
    ScreenUtil(width: 1125, height: 2436, allowFontScaling: true)
      ..init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        elevation: 1.5,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(
              context,
            );
          },
        ),
      ),
//      bottomNavigationBar: BottomNavyBar(
//        selectedIndex: _currentIndex,
//        showElevation: true, //j use this to remove appBar's elevation
//        onItemSelected: (index) => setState(() {
//          _currentIndex = index;
//          //_pageController.animateToPage(index,
//          //    duration: Duration(milliseconds: 300), curve: Curves.ease);
//        }),
//        items: [
//          BottomNavyBarItem(
//            icon: Icon(Icons.apps, color: Colors.lightBlue,),
//            title: Text('Explore'),
//            activeColor: Colors.blueGrey,
//          ),
//          BottomNavyBarItem(
//              icon: Icon(Icons.shopping_basket, color: Colors.deepOrangeAccent,),
//              title: Text('Pedido', ),
//              activeColor: Colors.blueGrey
//          ),
//          BottomNavyBarItem(
//              icon: Icon(Icons.people, color: Colors.lightGreen,),
//              title: Text('Perfil'),
//              activeColor: Colors.blueGrey
//          ),
//        ],
//      ),
    );
  }
}