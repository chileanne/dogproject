
part of "favourite_bloc.dart";



sealed class FavouritesStates{}


  final class FavouriteInitial extends FavouritesStates{}

final class FavouriteLoading extends FavouritesStates{}


final class FavouriteSuccess extends FavouritesStates with EquatableMixin{
 final List<QueryDocumentSnapshot<FavouriteModel>> data;

  FavouriteSuccess({required this.data});


  @override
  // TODO: implement props
  List<Object?> get props => [data];

}


final class FavouriteSaving extends FavouritesStates{}


final class FavouriteFailure extends FavouritesStates{
  final String error;

  FavouriteFailure({required this.error});
}