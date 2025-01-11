
import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:dogproject/core/constants/api_constants.dart';
import 'package:dogproject/core/services/ApiService.dart';
import 'package:dogproject/data/models/favouriteModel.dart';
import 'package:dogproject/data/models/list_breed_subbreed.dart';
import 'package:dogproject/data/models/list_image_breed_subbreed.dart';
import 'package:dogproject/data/models/random_image_by_breed.dart';
import 'package:dogproject/data/models/random_image_by_breed_subbreed.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../core/services/exception/api_exception.dart';
import '../models/list_image_by_breed.dart';

class DogRepository {

  final ApiService apiService = ApiService();


  ///save favourite to firebase firestore
  Future<void> saveFavourite({required String dogImage}) async {
     apiService.bookMarkFavourite(dogImage: dogImage)
         .then((d){
       Fluttertoast.showToast(
           msg: "Saved Successfully",
           toastLength: Toast.LENGTH_SHORT,
           gravity: ToastGravity.CENTER,
           timeInSecForIosWeb: 1,
           backgroundColor: Colors.red,
           textColor: Colors.white,
           fontSize: 16.0
       );
     }).catchError((e){
       Fluttertoast.showToast(
           msg: "Unable to Save",
           toastLength: Toast.LENGTH_SHORT,
           gravity: ToastGravity.CENTER,
           timeInSecForIosWeb: 1,
           backgroundColor: Colors.red,
           textColor: Colors.white,
           fontSize: 16.0
       );
     });
  }

  ///Get all save favourite in firebase fireestore
  Future<List<QueryDocumentSnapshot<FavouriteModel>>> getFavourite() async {
     var response = await apiService.getFavourites();
     return response;
  }


  ///Get Random Dog Image
   Future<RandomImageByBreedModel> getRandomDogImage  ({required String path}) async{
      try{
        final response = await apiService.get(path);
        return  RandomImageByBreedModel.fromJson(response.data);
      }on DioException catch (e) {
        final errorMessage = ApiExceptions.fromDioError(e).toString();
        throw errorMessage;
      }
  }





  ///Get List of Dog image
  Future<ListImageByBreedModel> getListDogImage({required String path}) async {
    try {
      final response = await apiService.get(path);
      return ListImageByBreedModel.fromJson(response.data);
    } on DioException catch (e) {
      final errorMessage = ApiExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }


  ///Get List Names of Dog Breeds and Sub Breeds
  Future<ListBreedSubbreedModel> getListDogBreedSubBreed  () async {
    try {
      final response = await apiService.get(
          ApiConstants.getListOfDogBreedSubBreedAPi);
      return ListBreedSubbreedModel.fromJson(response.data);
    } on DioException catch (e) {
      final errorMessage = ApiExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }




}