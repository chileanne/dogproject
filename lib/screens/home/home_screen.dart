

  import 'package:dogproject/core/nav_route/route.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
    const HomeScreen({super.key});

    @override
    State<HomeScreen> createState() => _HomeScreenState();
  }

  class _HomeScreenState extends State<HomeScreen> {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Dogs App",
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),),
          centerTitle: true,
          backgroundColor: Colors.red,

          actions: [
            IconButton(onPressed: (){
              context.pushNamed(AppRoute.favourite.name);
            }, icon: Icon(Icons.favorite,color: Colors.white,)),
            SizedBox(width: 20,),
          ],
        ),
        body: ListView(
          children: [

            dogWidget(title: "Random Dog \nPics By Breed", assetImage: "assets/dogone.png", color: Colors.red,
            ontap:(){

               context.pushNamed(AppRoute.randomDogByBreed.name);


            }),

            dogWidget(title: "Dog Images \nPics By Breed", assetImage: "assets/dogtwo.png", color: Colors.orange,
                ontap:(){

                  context.pushNamed(AppRoute.dogImagesByBreed.name);


                }),

            dogWidget(title: "Dog List By\nBreed & Sub-breed", assetImage: "assets/dogthree.png", color: Colors.lightBlue,
                ontap:(){

                  context.pushNamed(AppRoute.dogBreeds.name);


                }),

            dogWidget(title: "Random Dog Pic\nBy Breed & Sub-breed", assetImage: "assets/dogfour.png", color: Colors.deepOrange,
                ontap:(){

                  context.pushNamed(AppRoute.randomDogImageByBreedSubBreed.name);


                }),

            dogWidget(title: "Dog Images By\nBreed & Sub-breed", assetImage: "assets/dogfive.png", color: Colors.lightGreenAccent,
                ontap:(){

                  context.pushNamed(AppRoute.dogImagesByBreedSubBreed.name);


                }),



          ],
        ),
      );
    }


    dogWidget({required String title, required String assetImage, required Color color, required Null Function() ontap }){
      return   GestureDetector(
        onTap: ontap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(20.0)
            ),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title,style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 16.0
                  ),),
                  Image.asset(assetImage,height: 200,width: 200,),
                ],
              ),
            ),
          ),
        ),
      );
    }

  }




