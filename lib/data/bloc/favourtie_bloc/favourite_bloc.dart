import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogproject/data/models/favouriteModel.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/DogRepositroy.dart';

part 'favourite_events.dart';
part 'favourites_states.dart';


 class FavourtiesBloc extends Bloc<FavouriteEvents,FavouritesStates>{
   final DogRepository dogRepository;

  FavourtiesBloc({required this.dogRepository}):super(FavouriteInitial()){
    on<GetAllFavourites>(_getFavourites);
    on<AddFavourites>(_addFavourites);



  }

   void _getFavourites(GetAllFavourites event, Emitter<FavouritesStates> emit) async{

     emit(FavouriteLoading());

     try{
       final data =  await dogRepository.getFavourite();


       emit(FavouriteSuccess(data: data));


     }catch(e){
       emit(FavouriteFailure( error: e.toString()));
     }
   }


   void _addFavourites(AddFavourites event, Emitter<FavouritesStates> emit) async{

     var dogImage = event.dogImage;

     try{
          await dogRepository.saveFavourite(dogImage: dogImage);


       emit(FavouriteInitial());


     }catch(e){
       emit(FavouriteFailure( error: e.toString()));
     }
   }

 }