part of "favourite_bloc.dart";


 sealed class FavouriteEvents{}


   final class GetAllFavourites extends FavouriteEvents{}


final class AddFavourites extends FavouriteEvents{
   final String dogImage;

   AddFavourites({required this.dogImage});
}


