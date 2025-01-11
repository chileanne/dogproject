

 import 'package:dogproject/data/bloc/favourtie_bloc/favourite_bloc.dart';
import 'package:dogproject/screens/dog_breeds_subbreeds_list/dogBreeds_screen.dart';
import 'package:dogproject/screens/favourite/favourite_screen.dart';
import 'package:dogproject/screens/home/home_screen.dart';
import 'package:dogproject/screens/list_dog_image_by_breed/list_dog_image_breed_screen.dart';
import 'package:dogproject/screens/list_dog_images_breeds_subbreed/list_dog_images_breeds_subbreed_screen.dart';
import 'package:dogproject/screens/random_dog_image_breed_subbreed/random_dog_image_breed_subbreed.dart';
import 'package:dogproject/screens/random_dog_image_by_breed/random_dog_image_screen.dart';
import 'package:go_router/go_router.dart';

import '../../screens/dog_breeds_subbreeds_list/dogSubbreed_screen.dart';



enum AppRoute {
  home,
  randomDogByBreed,
  dogImagesByBreed,
  randomDogImageByBreedSubBreed,
  dogImagesByBreedSubBreed,
  favourite,
  dogBreeds,
  subBreeds


}

final GoRouter router = GoRouter(
    routes: [
      GoRoute(
          path: "/",
        name: AppRoute.home.name,
        builder: (context,state)=> const HomeScreen()
      ),

      GoRoute(
          path: "/randomDogByBreed",
          name: AppRoute.randomDogByBreed.name,
          builder: (context,state)=> const RandomDogImageScreen()
      ),


      GoRoute(
          path: "/dogImagesByBreed",
          name: AppRoute.dogImagesByBreed.name,
          builder: (context,state) => const ListDogImageBreedScreen()

      ),


      GoRoute(
          path: "/randomDogImageByBreedSubBreed",
          name: AppRoute.randomDogImageByBreedSubBreed.name,
          builder: (context,state) => const RandomDogImageBreedSubbreed()
      ),


      GoRoute(
          path: "/dogImagesByBreedSubBreed",
          name: AppRoute.dogImagesByBreedSubBreed.name,
          builder: (context,state)=> const ListDogImagesBreedsSubbreedScreen()
      ),


      GoRoute(
          path: "/favourite",
          name: AppRoute.favourite.name,
          builder: (context,state)=> const FavouriteScreen()
      ),


      GoRoute(
          path: "/dogBreeds",
          name: AppRoute.dogBreeds.name,
          builder: (context,state)=> const DogbreedsScreen()
      ),



      GoRoute(
          path: "/details/:title",
          name: AppRoute.subBreeds.name,
          builder: (context,state){
            final title =state.pathParameters['title']!;
          //  final dataList=state.pathParameters['dataList']! as List;

            return  DogsubbreedScreen(title: title);
          }
      ),
]);