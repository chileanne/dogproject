part of 'list_image_bloc.dart';


sealed class ListImageStates{}

final class ListImageInitial extends ListImageStates{}

final class ListImageLoading extends ListImageStates{}


final class ListImageSuccess extends ListImageStates with EquatableMixin{
  final List<String> imageList;


  ListImageSuccess({required this.imageList});


  @override
  // TODO: implement props
  List<Object?> get props => [];

}


final class ListImageFailure extends ListImageStates{
  final String error;

  ListImageFailure({required this.error});
}