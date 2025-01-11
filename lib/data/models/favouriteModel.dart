

class FavouriteModel {
  final String? title;


  FavouriteModel({
    this.title,

  });

  FavouriteModel.fromJson(Map<String, dynamic> json)
      : title = json['imagePath'] as String;

  Map<String, dynamic> toJson() => {
    'title' : title,
  };
}