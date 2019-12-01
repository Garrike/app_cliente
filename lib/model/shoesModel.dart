import 'package:flutter/material.dart';

class Shoes {
  int id;
  String name;
  String descricao;
  double price;
  double size;
  Color cor1;
  Color cor2;
  Color cor3;
  String marca;
  String url;
  bool favorite;

  Shoes({
    this.id,
    this.name,
    this.descricao,
    this.price,
    this.size,
    this.cor1,
    this.cor2,
    this.cor3,
    this.marca,
    this.url,
    this.favorite,
  });
}