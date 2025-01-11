

 import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/constants/api_constants.dart';
import '../../core/shared_widgets/random_image_widgets.dart';
import '../../data/bloc/favourtie_bloc/favourite_bloc.dart';
import '../../data/bloc/random_image_bloc/random_bloc.dart';

class RandomDogImageBreedSubbreed extends StatefulWidget {
   const RandomDogImageBreedSubbreed({super.key});

   @override
   State<RandomDogImageBreedSubbreed> createState() => _RandomDogImageBreedSubbreedState();
 }

 class _RandomDogImageBreedSubbreedState extends State<RandomDogImageBreedSubbreed> {

   @override
   void initState() {
     // TODO: implement initState
     super.initState();
     context.read<RandomBloc>().add(
         fetchImage(path: ApiConstants.getRandomDogImageByBreedApi));

   }

   @override
   Widget build(BuildContext context) {
     final favouriteBloc = BlocProvider.of<FavourtiesBloc>(context);

     return Scaffold(
       appBar: AppBar(
         title: Text("Random Pics Breeds & SubBreed",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white),),
         centerTitle: true,
         backgroundColor: Colors.deepOrange,
       ),

       body: BlocConsumer<RandomBloc, RandomStates>(
         listener: (context, state) {
           // TODO: implement listener
         },
         builder: (context, state) {
           if(state is RandomLoading){
             return const Center(
               child: CircularProgressIndicator(),
             );
           } else if(state is RandomSuccess){
             return RandomImageWidgets(
                 imageUrl: state.image,
                 ontap: () {
                   context.read<RandomBloc>().add(
                       fetchImage(path: ApiConstants.getRandomDogImageByBreedSubBreedApi));
                 }, ontapFavourite: () {
               favouriteBloc.add(AddFavourites(dogImage: state.image));
             },);
           }else{
             return SizedBox();
           }

         },
       ),
     );
   }
 }
