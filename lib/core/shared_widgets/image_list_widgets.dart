
 import 'package:cached_network_image/cached_network_image.dart';
import 'package:dogproject/core/shared_widgets/network_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/bloc/favourtie_bloc/favourite_bloc.dart';

class ListImageWidgets extends StatelessWidget {
  final List<String> imageList;
   const ListImageWidgets({super.key, required this.imageList});

   @override
   Widget build(BuildContext context) {
     final favouriteBloc = BlocProvider.of<FavourtiesBloc>(context);
     return  ListView.builder(
         itemCount: imageList.length,
         itemBuilder: (context,index){
           return  Padding(
             padding: const EdgeInsets.all(12.0),
             child: GestureDetector(
               onTap: (){
                 favouriteBloc.add(AddFavourites(dogImage: imageList[index]));
               },
               child: NetworkImageWidget(image: imageList[index] ,),
             ),
           );
         });
   }
 }
