import 'package:dogproject/core/shared_widgets/random_image_widgets.dart';
import 'package:dogproject/data/bloc/favourtie_bloc/favourite_bloc.dart';
import 'package:dogproject/data/bloc/random_image_bloc/random_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/constants/api_constants.dart';

class RandomDogImageScreen extends StatefulWidget {
  const RandomDogImageScreen({super.key});

  @override
  State<RandomDogImageScreen> createState() => _RandomDogImageScreenState();
}

class _RandomDogImageScreenState extends State<RandomDogImageScreen> {


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
        title: Text("Random Dog Image",
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.red,
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
                      fetchImage(path: ApiConstants.getRandomDogImageByBreedApi));
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
