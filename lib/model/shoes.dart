


import 'package:flutter/material.dart';

class MenShoes {
  final String image , name , longName;
  final int price;
  final double height, position;
  bool isFavorite;
  final List<Color> colors;

  MenShoes({
    required this.image, 
    required this.name,
    required this.longName,
    required this.position,
    required this.price,
    required this.colors,
    required this.height,
    required this.isFavorite,
  });
}


final MenShoesList =[
  MenShoes(
    image: "nike_air.png",
    name: "Air Max 90",
    longName: "Nike Air Max 90",
    colors: [Colors.green, Colors.grey, Colors.black],
    position: 110,
    price: 120,
    height: 230,
    isFavorite: false),
  MenShoes(
    image: "nike_air.png",
    name: "Air Max 90",
    longName: "Nike Air Max 90",
    position: 170,
    colors: [Colors.green, Colors.grey, Colors.black],
    price: 120,
    height: 300,
    isFavorite: false),
  MenShoes(
    image: "nike_air.png",
    name: "Air Max 90",
    longName: "Nike Air Max 90",
    position: 110,
    colors: [Colors.green, Colors.grey, Colors.black],
    price: 120,
    height: 230,
    isFavorite: false),
  MenShoes(
    image: "nike_air.png",
    name: "Air Max 90",
    longName: "Nike Air Max 90",
    colors: [Colors.green, Colors.grey, Colors.black],
    position: 110,
    price: 120,
    height: 230,
    isFavorite: false)
];




