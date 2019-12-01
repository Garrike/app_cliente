import 'package:app_cliente/model/shoesModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductBanner extends StatefulWidget {
  final Shoes shoes;
  ProductBanner({this.shoes});

  @override
  _ProductBannerState createState() => _ProductBannerState();
}

class _ProductBannerState extends State<ProductBanner> {
  @override
  Widget build(BuildContext context) {
    print(widget.shoes.cor1);
    return new Container(
      height: ScreenUtil().setHeight(545),//415
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setHeight(48),
              vertical: ScreenUtil().setWidth(70)
            ),
            padding: EdgeInsets.only(
              top: ScreenUtil().setHeight(60),
              left: ScreenUtil().setWidth(50),
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.lightGreen,
                  Colors.lightBlue
//                  Color(0xFFFEB692),
//                  Colors.blueAccent  //Color(0xFFEA5455),
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft
              ),

              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, 4),
                  blurRadius: 4,
                ),
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, -6),
                  blurRadius: 4,
                ),
              ],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.shoes.name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(30),
                ),
                Text(
                  "R\$${widget.shoes.price}",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Colors.white
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: ScreenUtil().setHeight(-80),
            right: ScreenUtil().setWidth(-10),
            child: Image.asset(
              widget.shoes.url,
              width: ScreenUtil().setWidth(660),
              height: ScreenUtil().setHeight(590),
            ),
          )
        ],
      ),
    );
  }
}
