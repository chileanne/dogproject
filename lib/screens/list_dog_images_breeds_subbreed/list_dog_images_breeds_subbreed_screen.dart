
 import 'package:dogproject/core/shared_widgets/image_list_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/constants/api_constants.dart';
import '../../data/bloc/list_image_bloc/list_image_bloc.dart';

class ListDogImagesBreedsSubbreedScreen extends StatefulWidget {
   const ListDogImagesBreedsSubbreedScreen({super.key});

   @override
   State<ListDogImagesBreedsSubbreedScreen> createState() => _ListDogImagesBreedsSubbreedScreenState();
 }

 class _ListDogImagesBreedsSubbreedScreenState extends State<ListDogImagesBreedsSubbreedScreen> {


   @override
   void initState() {
     // TODO: implement initState
     super.initState();

     context.read<ListImageBloc>().add(
         FetchListImage(path: ApiConstants.getListDogImageByBreedSubBreedApi));
   }


   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text("List Dog Image",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white),),
         centerTitle: true,
         backgroundColor: Colors.orange,
       ),

       body: BlocConsumer<ListImageBloc, ListImageStates>(
         listener: (context, state) {},
         builder: (context, state) {
           if(state is ListImageLoading){
             return const Center(
               child: CircularProgressIndicator(),
             );
           } else if(state is ListImageSuccess){
             return ListImageWidgets(imageList: state.imageList,);
           }else{
             return SizedBox();
           }

         },
       ),
     );
   }
 }
