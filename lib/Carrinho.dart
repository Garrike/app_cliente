import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Produto.dart';
import 'model/shoesModel.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(

        ),
    );
  }
}


class ProductCard extends StatefulWidget {
  final Shoes shoes;
  final int cardNum;

  ProductCard({Key key, this.shoes, this.cardNum}) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {

  @override
  Widget build(BuildContext context){
    //print("${_updatePalettes(widget.shoes)} + ${widget.shoes.url}");
    //cor = _updatePalettes(widget.shoes) as Color;
    print(widget.shoes.favorite);
    return InkWell(
      child: Container(
        width: ScreenUtil().setWidth(610),//642
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: ScreenUtil().setHeight(30)//40
                ),
                child: Container(
                  width: ScreenUtil().setWidth(580),//620
                  height: ScreenUtil().setHeight(1100),//990
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.white, widget.shoes.cor1],//[Colors.white, widget.shoes.cor1],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 8),
                        blurRadius: 8,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: ScreenUtil().setWidth(40),
                        top: ScreenUtil().setHeight(50),
                        child: Text(
                          "0${widget.cardNum + 1}",
                          style: TextStyle(
                              fontFamily: 'Pacifico',
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: ScreenUtil().setHeight(45),
                            bottom: ScreenUtil().setHeight(45),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
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
                                height: ScreenUtil().setHeight(20),
                              ),
                              Text(
                                "R\$${widget.shoes.price}",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white
                                ),
                              ),
                              SizedBox(
                                height: ScreenUtil().setHeight(25),
                              ),
                              Container(
                                width: ScreenUtil().setWidth(95),
                                height: ScreenUtil().setHeight(95),
//                                decoration: BoxDecoration(
//                                  color: Colors.white.withOpacity(1),
//                                  borderRadius: BorderRadius.circular(8),
//                                ),
                                child: InkWell(
                                  onTap: () {
                                    if(!(widget.shoes.favorite)){
                                      Scaffold.of(context).showSnackBar(SnackBar(
                                        content: Text("Adicionado aos favoritos"),
                                        backgroundColor: widget.shoes.cor1,
                                        duration: Duration(seconds: 1),
                                      ));
                                      setState(() {
                                        widget.shoes.favorite = true;
                                      });
                                    }
                                    else{
                                      Scaffold.of(context).showSnackBar(SnackBar(
                                        content: Text("Removido dos favoritos"),
                                        backgroundColor: widget.shoes.cor1,
                                        duration: Duration(seconds: 1),
                                      ));
                                      setState(() {
                                        widget.shoes.favorite = false;
                                      });
                                    }
                                  },
                                  child: Center(
                                    child: Icon( widget.shoes.favorite ? Icons.favorite : Icons.favorite_border,
                                      size: !widget.shoes.favorite ? 25 : 28,
                                      color: !widget.shoes.favorite ? Colors.white70 : Colors.white,
                                      //color: widget.shoes.cor1,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: ScreenUtil().setHeight(60),
              left: ScreenUtil().setWidth(-22),
              child: Image.asset(
                widget.shoes.url,
                width: ScreenUtil().setWidth(640),
                height: ScreenUtil().setHeight(610),
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Product()));
      },
    );
  }
}