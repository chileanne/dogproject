

import 'package:flutter/material.dart';

import 'network_image_widget.dart';

class RandomImageWidgets extends StatelessWidget {
   final String imageUrl;
   final Function() ontap;
   final Function() ontapFavourite;

   const RandomImageWidgets({super.key, required this.imageUrl, required this.ontap,required this.ontapFavourite});

    @override
    Widget build(BuildContext context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          SizedBox(height: 50,),
          GestureDetector(
            onTap: ontapFavourite,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child:  NetworkImageWidget(image: imageUrl ,),
            ),
          ),


          SizedBox(height: 50,),


          ElevatedButton(onPressed: ontap, child: Text("Fetch"))

        ],
      );
    }
  }
