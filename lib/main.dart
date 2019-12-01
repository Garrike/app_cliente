import 'dart:async';
import 'package:app_cliente/Produto.dart';
import 'package:app_cliente/productBanner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'profileClipper.dart';
import 'brandSelector.dart';
import 'package:app_cliente/model/shoesModel.dart';
import 'package:app_cliente/productCard.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app_cliente/bottom_navy_bar.dart';

void main() => runApp(MyApp());

var products = List<Shoes>();
//var products_initial = List<Shoes>();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.grey));
//    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash_Screen(),
    );
  }
}

// ignore: camel_case_types
class Splash_Screen extends StatefulWidget {
  @override
  _Splash_ScreenState createState() => _Splash_ScreenState();
}

// ignore: camel_case_types
class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    // TODO: implement initState
    products.add(Shoes(
        id: 1,
        name: "Nike Air Vapor",
        price: 345,
        cor1: Colors.red,
        favorite: false,
        url: "assets/images/180943_1702668_20190925155555.png"));
    products.add(Shoes(
        id: 2,
        name: "Nike Joyride Run",
        price: 656,
        cor1: Colors.blue,
        favorite: false,
        url: "assets/images/18912_1630320_20190822145858.png"));
    products.add(Shoes(
        id: 3,
        name: "Nike X Udercover",
        price: 163,
        cor1: Colors.green,
        favorite: false,
        url: "assets/images/180577_1780522_20191029225530.png"));
    products.add(Shoes(
        id: 4,
        name: "LeBron xVI Low",
        price: 745,
        cor1: Colors.indigo,
        favorite: false,
        url: "assets/images/20711_674610_20190625155445.png"));
    products.add(Shoes(
        id: 5,
        name: "Nike Alpha Dunk",
        price: 289,
        cor1: Colors.teal,
        cor2: Colors.blueGrey,
        favorite: false,
        url: "assets/images/52640_378834_20190607103719.png"));
    for (var item in products) {
      _updatePalettes(item);
    }
    super.initState();
    Timer(Duration(seconds: 5), () => Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) =>
            MyHomePage()), (Route<dynamic> route) => false)
    );
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.redAccent[400]),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50,
                        child: Icon(
                          Icons.shopping_cart,
                          color: Colors.green,
                          size: 50,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                      ),
                      Text(
                        "Cosméticos",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                    ),
                    Text(
                      "Loja Online\nCarregando...",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _updatePalettes(Shoes shoes) async {
    final PaletteGenerator generator = await PaletteGenerator.fromImageProvider(
      AssetImage(shoes.url),
    );
    //await new Future.delayed(const Duration(seconds: 5));

    Color cor1 = generator.lightVibrantColor.color;
    Color cor2 = generator.darkVibrantColor.color;
    Color cor3 = generator.dominantColor.color;

    print(cor1);
    setState(() {
      shoes.cor1 = cor1;
      shoes.cor2 = cor2;
      shoes.cor3 = cor3;
    });
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

//  @override
//  void initState() {
//    // TODO: implement initState
//
//  }
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
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: StickyHeader(
          header: Stack(
            children: <Widget>[
//              Container(
//                height: ScreenUtil().setHeight(500),
//                //width: ScreenUtil().setWidth(70),
//                //color: Colors.white,
//                decoration: BoxDecoration(
//                  gradient: LinearGradient(
//                    colors: [
//                      Colors.white.withOpacity(0.4),
//                      Colors.white.withOpacity(1.0),
//                    ],
//                    stops: [0.0, 0.2],
//                    begin: FractionalOffset.bottomCenter,
//                    end: FractionalOffset.topCenter
//                  ),
//                  boxShadow: [
//                    BoxShadow(
//                      color: Colors.white70,
//                      offset: Offset(0, 8),
//                      blurRadius: 8,
//                    ),
//                  ],
//                  borderRadius: BorderRadius.circular(10),
//                ),
//              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.white.withOpacity(0.8), Colors.white70.withOpacity(1.0)],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter
                  ),
                  borderRadius: new BorderRadius.only(
                    bottomLeft:  const  Radius.circular(30.0),
                    bottomRight: const  Radius.circular(30.0)
                  )
                ),
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          top: ScreenUtil().setHeight(20),
                          left: ScreenUtil().setWidth(40),
                          right: ScreenUtil().setWidth(40)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.menu),
                            onPressed: () {},
                          ),Padding(
                            padding: EdgeInsets.only(
                              top: ScreenUtil().setHeight(20),
                            ),
                            child: ClipOval(
                              clipper: ProfileClipper(),
                              child: Image.asset(
                                "assets/images/portrait.jpg",
                                width: ScreenUtil().setWidth(180),
                                height: ScreenUtil().setHeight(180),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: ScreenUtil().setHeight(210),
                        left: ScreenUtil().setWidth(70),
                        bottom: ScreenUtil().setHeight(60),
                      ),
                      child: Text("Explore",
                          style: TextStyle(
                              fontFamily: 'Headland One',
                              fontSize: 35,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
            ]
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Opacity(
                opacity: 1.0,
                child: BrandSelector(
                    brands: ["Nike", "Adidas", "Converse", "Vans"]
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(50),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(1050),
                child: AnimatedList(
                  key: _listKey,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  initialItemCount: products.length,
                  itemBuilder: (BuildContext context, int index, Animation<double> animation) {
                    Shoes shoes;
                    if(products.length != null)
                      shoes = products[index];
                    return products.length == null ?
                    Container(
                      width: ScreenUtil().setWidth(580),//620
                      height: ScreenUtil().setHeight(1100),//990
                      child: Text(
                        "Sem Item",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                        )
                      ),
                    ) :
                    SizeTransition(
                      key: ValueKey<int>(index),
                      axis: Axis.horizontal,
                      sizeFactor: animation,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: ScreenUtil().setWidth(30),
                        ),
                        child: ProductCard(shoes: shoes, cardNum: index),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(40),
              ),
              ProductBanner(
                shoes: products[4]
              ),
              Container(
                height: ScreenUtil().setHeight(545),
                child: Stack(
                  children: <Widget>[
                    StreamBuilder(
                      stream: Firestore.instance.collection('produto').snapshots(),
                      builder: (BuildContext context, AsyncSnapshot snapshot){
                        List<DocumentSnapshot> item = snapshot.data.documents;
                        print(item.length);
                        return ListView.builder(
                          itemCount: item.length,
                          itemBuilder: (context, index){
                            return ListTile(
                              leading: Icon(Icons.panorama),
                              title: Text(item[index]['nome']),
                              trailing: GestureDetector(
                                onTap: () {
                                  item[index].reference.delete();
                                },
                                child: Icon(Icons.delete),
                              ),
                            );
                          }
                        );
                      },
                    ),
                  ]
                ),
              ),
            ],
          ),
        )
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true, //j use this to remove appBar's elevation
        onItemSelected: (index) => setState(() {
          _currentIndex = index;
          //_pageController.animateToPage(index,
          //    duration: Duration(milliseconds: 300), curve: Curves.ease);
        }),
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.apps, color: Colors.lightBlue,),
            title: Text('Explore'),
            activeColor: Colors.blueGrey,
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.shopping_basket, color: Colors.cyan,),
              title: Text('Carrinho'),
              activeColor: Colors.blueGrey
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.people, color: Colors.lightGreen,),
              title: Text('Perfil'),
              activeColor: Colors.blueGrey
          ),
        ],
      ),
    );
  }
}

class Transition extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(seconds: 1),
      transitionBuilder: (Widget child, Animation<double> animation) =>
      ScaleTransition(
        child: child, scale: animation,
      ),
      child: Product(),
    );
  }
}