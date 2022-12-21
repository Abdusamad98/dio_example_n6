class ReceiveModel {
  String brandImage;
  String name;
  String location;

  ReceiveModel({
    required this.brandImage,
    required this.name,
    required this.location,
  });

  factory ReceiveModel.fromJson(Map<String, dynamic> jsonData) {
    return ReceiveModel(
      brandImage: jsonData['brand_image'] as String? ?? '',
      name: jsonData['name'] as String? ?? '',
      location: jsonData['location'] as String? ?? '',
    );
  }
}