

import 'package:flutter/material.dart';
import 'package:nike/model/shoes.dart';

class ShoesDetails extends StatefulWidget{
  final MenShoes menShoe;
  const ShoesDetails({Key? key,required this.menShoe}) : super(key: key);

  @override 
  State<ShoesDetails> createState()=> _ShoeDetailsState();
}

class _ShoeDetailsState extends State<ShoesDetails>{
  
  List<double> shoesSizes =[8,8.5,9,9.5,10,10.5,11,11.5];
  
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 21, 21, 21),
      bottomSheet: Container(
        height: 85,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        color: Color.fromARGB(255, 31, 31, 31),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text(
            '\$${widget.menShoe.price}',
            style: const TextStyle(
              fontSize: 18,
              color: Color.fromARGB(255, 179, 253, 30)
            ),
          ),
          Container(
            height: 100,
            width: 220,
            child: ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 179, 253, 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                )
              ),
              child: const Text(
                'Buy Now',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          detailsAppBar(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
           
            children: [
              Text(
                widget.menShoe.longName,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10,),
              Text(
               "Men's running shoe",
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.grey
                ),
              )
            ],
          ),
          Transform(
            transform: Matrix4.rotationZ(-0.2),
            child: Image.asset("assets/${widget.menShoe.image}",
            height: 180,
            fit: BoxFit.cover,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "Size",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              Container(
                height: 40,
                width: 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: shoesSizes.length,
                  itemBuilder: (context,index){
                    return Container(
                      height: 40,
                      width: 40,
                      alignment: Alignment.center ,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 41, 41, 41),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        shoesSizes[index].toString(),
                        style: TextStyle(
                          fontSize: 15
                        ),
                      ),
                    );
                  }),
              )
            ],
          ),
        


          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "Color",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              Container(
                height: 40,
                width: 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.menShoe.colors.length,
                  itemBuilder: (context,index){
                    return Container(
                      height: 40,
                      width: 40,
                      alignment: Alignment.center ,
                      margin: const EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        color: widget.menShoe.colors[index],
                        borderRadius: BorderRadius.circular(15),
                      ),
                    
                    );
                  }),
              )
            ],
          ),
          const Text(
            'Nike delivers innovative products, experiencees and services to inspire athletes.nike offer great comfort and maintain your feet posture every time you walk. Nike is one of the most popular brands of footwear',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 40,)
        ],),
      ),
    );
  }
  Widget detailsAppBar() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      GestureDetector(
        onTap: (){
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.arrow_back,
          size: 18,
        ),
      ),
      GestureDetector(
        onTap: (){
          setState(() {
            widget.menShoe.isFavorite = !widget.menShoe.isFavorite;
          });
        },
        child: widget.menShoe.isFavorite?  const Icon(
          Icons.favorite,
          size: 18,
          color: Colors.red,
        ): const Icon(
          Icons.favorite_border,
          size: 18,
        ),
      )
    ],
  );
}