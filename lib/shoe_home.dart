import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:nike/model/shoes.dart';
import 'package:nike/shoe_details.dart';

class ShoesHomePage extends StatefulWidget {
  const ShoesHomePage({Key? key}) : super(key: key);

  @override
  State<ShoesHomePage> createState() => _ShoesHomePageState();
}

class _ShoesHomePageState extends State<ShoesHomePage>
    with TickerProviderStateMixin {
  late final TabController controller = TabController(length: 3, vsync: this);
  List<MenShoes> menShoes = MenShoesList;
  List<MenShoes> filteredShoes =[];

  void filterShoes(value) {
    setState(() {
      filteredShoes = menShoes.where((shoes){
        String shoeName = shoes.name.toLowerCase();
        String userTyped = value.toString().toLowerCase();

        return shoeName.contains(userTyped);
      }).toList();
    });
  }
  @override 
  void initState() {
    filteredShoes = List.from(menShoes);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 21, 21, 21),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            homeAppBar(),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                    child: TabBar(
                      
                        isScrollable: true,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorColor: Colors.white,
                        labelPadding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 2),
                        controller: controller,
                        tabs: [Text("Men"), Text("Women"), Text("Kids")])),
                Container(
                  height: 35,
                  width: 110,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 60, 60, 60),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(3),
                          topRight: Radius.circular(3),
                          bottomRight: Radius.circular(10))),
                          child: TextField(
                            onChanged: (value)=> filterShoes(value),
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.search,size: 18,),
                              hintText: "Search...",
                              hintStyle: TextStyle(
                                fontSize: 14,
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 5)
                            ),
                          ),
                )
              ],
            ),
            Expanded(
                child: TabBarView(
              controller: controller,
              children: [
                shoesStaggered(),
                 
                Center(
                  child: Text("Women"),
                ),
                Center(
                  child: Text("Kids"),
                )
              ],
            )),
          ],
        ),
      ),
    );
  }

  Widget shoesStaggered()=> MasonryGridView.count(
    crossAxisCount: 2,
    mainAxisSpacing: 10,
    crossAxisSpacing: 10,
    itemCount: filteredShoes.length,
    itemBuilder: (context,index){
      final menShoe = filteredShoes[index];
      return Container(
        height: menShoe.height,
        width: 80,
        // color: Colors.yellow,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left:50,
              child: Column(
                children: [
                  Container(
                    height: 120,
                    width: 120,
                    alignment: Alignment.bottomRight,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(255, 60, 60, 60)
                    ),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 80, 80, 80),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        )
                      ),
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          menShoe.isFavorite = !menShoe.isFavorite;
                        });
                      },
                      child: menShoe.isFavorite ? const Icon(Icons.favorite,color: Colors.red,)
                      :const Icon(Icons.favorite_border,size: 18,),
                    ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context)=> ShoesDetails(menShoe:menShoe)));
                    },
                    child: Container(
                      height: 50,
                      width: 110,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                        Text(
                          menShoe.name,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          "\$${menShoe.price}",
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 179, 253, 30),
                          ),
                        )
                      ],),
                    ),
                  )
                ],
              )),
              Positioned(
                top: menShoe.position,
                left: 40,
                child: Transform(
                  transform: Matrix4.rotationZ(-0.9),
                  child: Container(
                    height: 75,
                    width: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/${menShoe.image}"),
                        fit: BoxFit.cover,
                      )
                    ),
                  ),
                ))
          ],
        ),
      );
    },
    );


  Widget homeAppBar() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "New Collection",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w400,
            ),
          ),
          GestureDetector(
            onTap: (){
              ZoomDrawer.of(context)!.toggle();
            },
            child: Icon(Icons.menu))
        ],
      );
}
