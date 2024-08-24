

import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:nike/shoe_home.dart';
import 'package:nike/shoe_menu.dart';

class ShoesMainPage extends StatefulWidget{
  const ShoesMainPage({Key? key}) : super(key:key);

  @override 
  State<ShoesMainPage> createState() => _ShoesMainPageState();
}

class _ShoesMainPageState extends State<ShoesMainPage> {
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 179, 253, 30),
      body: ZoomDrawer(
        slideWidth: 230,
        angle: 0,
        showShadow: true,
        drawerShadowsBackgroundColor: Color.fromARGB(255, 11, 11, 11),
        menuScreenWidth: MediaQuery.of(context).size.width,
        borderRadius: 40,
        menuScreen: const ShoesMenuPage(), mainScreen: const ShoesHomePage()),
    );
  }
}