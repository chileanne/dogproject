import 'package:cached_network_image/cached_network_image.dart';
import 'package:dogproject/core/constants/api_constants.dart';
import 'package:dogproject/core/shared_widgets/image_list_widgets.dart';
import 'package:dogproject/data/bloc/list_image_bloc/list_image_bloc.dart';
import 'package:dogproject/data/bloc/random_image_bloc/random_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListDogImageBreedScreen extends StatefulWidget {
  const ListDogImageBreedScreen({super.key});

  @override
  State<ListDogImageBreedScreen> createState() =>
      _ListDogImageBreedScreenState();
}

class _ListDogImageBreedScreenState extends State<ListDogImageBreedScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<ListImageBloc>().add(
        FetchListImage(path: ApiConstants.getListOfDogImageByBreedApi));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dog Image List",
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),),
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
