import 'package:dogproject/core/constants/app_constants.dart';
import 'package:dogproject/data/bloc/dogbreedsSubbreeds_bloc/dbs_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_constants.dart';
import '../../core/nav_route/route.dart';

class DogbreedsScreen extends StatefulWidget {
  const DogbreedsScreen({super.key});

  @override
  State<DogbreedsScreen> createState() => _DogbreedsScreenState();
}

class _DogbreedsScreenState extends State<DogbreedsScreen> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    context.read<DbsBloc>().add(
    GetList());
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dogs Breeds",
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),

      body: BlocConsumer<DbsBloc, DbsStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if(state is DbsLoading){
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if(state is DbsSuccess){
            return ListView.builder(
                 itemCount: AppConstants.DogBreedss.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: (){
                        context.pushNamed(AppRoute.subBreeds.name,
                            pathParameters: {
                              "title": AppConstants.DogBreedss[index],
                            },
                          extra:  state.subBreedList[index]
                        );
                      },
                        child: Card(child: Center(child: Text(AppConstants.DogBreedss[index])))),
                  );
                });
          }else{
            return SizedBox();
          }
          return ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Text("ok");
              });
        },
      ),
    );
  }
}
