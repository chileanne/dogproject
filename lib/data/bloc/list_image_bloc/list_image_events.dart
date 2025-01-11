part of 'list_image_bloc.dart';



sealed class ListImageEvents{}

final class FetchListImage extends ListImageEvents{
  final String path;

  FetchListImage({required this.path});
}