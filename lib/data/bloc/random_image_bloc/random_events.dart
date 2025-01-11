
part of 'random_bloc.dart';


 sealed class RandomEvents{}

 final class fetchImage extends RandomEvents{
   final String path;

    fetchImage({required this.path});
 }