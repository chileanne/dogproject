

class RandomImageByBreedModel {
  final String? message;
  final String? status;

  RandomImageByBreedModel({
    this.message,
    this.status,
  });

  RandomImageByBreedModel.fromJson(Map<String, dynamic> json)
      : message = json['message'] as String?,
        status = json['status'] as String?;

  Map<String, dynamic> toJson() => {
    'message' : message,
    'status' : status
  };
}