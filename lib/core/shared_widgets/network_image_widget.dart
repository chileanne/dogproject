
 import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NetworkImageWidget extends StatelessWidget {
  final String image;
   const NetworkImageWidget({super.key,required this.image});

   @override
   Widget build(BuildContext context) {
     return Container(
       width: 400,
       height: 400,
       decoration:BoxDecoration(
           borderRadius: BorderRadius.circular(12.0)
       ),
       child: ClipRRect(
         borderRadius: BorderRadius.circular(12.0) ,
         child: CachedNetworkImage(
           imageUrl: image,
           progressIndicatorBuilder: (context, url, downloadProgress) =>
               Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
           errorWidget: (context, url, error) => Icon(Icons.error),

           fit: BoxFit.cover,


         ),
       ),
     );
   }
 }
