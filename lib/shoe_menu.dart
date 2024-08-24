

import 'package:flutter/material.dart';

class ShoesMenuPage extends StatefulWidget{
  const ShoesMenuPage({Key? key}) : super(key:key);

  @override 
  State<ShoesMenuPage> createState() => _ShoesMenuPageState();
}

class _ShoesMenuPageState extends State<ShoesMenuPage> {
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 179, 253, 30),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(18, 40, 18, 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.black,
                ),
                SizedBox(width: 12,),
                Text(
                  'John doe',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
            // const SizedBox(height: 50,),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              Text(
                'New Collection',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.w600
                ),
              ),
              const SizedBox(height: 20,),
               Text(
                'Catatlouge',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.grey,
                  fontWeight: FontWeight.w600
                ),
              ),
              const SizedBox(height: 10,),
               Text(
                'Your Cart',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.grey,
                  fontWeight: FontWeight.w600
                ),
              ),
              const SizedBox(height: 10,),
               Text(
                'Favorites ',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.grey,
                  fontWeight: FontWeight.w600
                ),
              ),
              const SizedBox(height: 10,),
               Text(
                'Settings',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.grey,
                  fontWeight: FontWeight.w600
                ),
              ),
            ],),
            Row(
              children: [
                Icon(
                  Icons.exit_to_app,
                  size: 25,
                  color: Colors.black.withOpacity(0.5),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Sign Out",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black.withOpacity(0.5),
                    fontWeight: FontWeight.w600
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}