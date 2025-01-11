
import 'package:dogproject/core/shared_widgets/network_image_widget.dart';
import 'package:dogproject/data/bloc/favourtie_bloc/favourite_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {


   @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<FavourtiesBloc>().add(
        GetAllFavourites());
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite",
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),

      body: BlocConsumer<FavourtiesBloc, FavouritesStates>(
        listener: (context, state) {},
          builder:  (context, state) {
             if(state is FavouriteLoading){
               return const Center(
                 child: CircularProgressIndicator(),
               );
             }else if(state is FavouriteSuccess){

                 if(state.data.isEmpty){
                    return Center(child: Text("No items Found"));
                 }else{
                   return  ListView.builder(
                       itemCount: state.data.length,
                       itemBuilder: (context,index){
                         return Padding(
                           padding: const EdgeInsets.all(12.0),
                           child: NetworkImageWidget(image: state.data[index].data().title!),
                         );
                       });
                 }
             }else{
               return SizedBox();
             }
          },
         ),
    );
  }
}
