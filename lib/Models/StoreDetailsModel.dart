import 'dart:convert';

List<StoreDetailsModel> StoreDetailsModelFromJson(String str) =>
    List<StoreDetailsModel>.from(
        json.decode(str).map((x) => StoreDetailsModel.fromJson(x)));

String StoreDetailsModelToJson(List<StoreDetailsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StoreDetailsModel {
  String storePhone;
  String storeName;
  String imageUrl;
  double rating;
  double latitude;
  double longitude;
  String? completeAddress;
  int postalCode;
  dynamic googleMapLink;
  double distance;

  StoreDetailsModel({
    required this.storePhone,
    required this.storeName,
    required this.imageUrl,
    required this.rating,
    required this.latitude,
    required this.longitude,
    required this.completeAddress,
    required this.postalCode,
    required this.googleMapLink,
    required this.distance,
  });

  factory StoreDetailsModel.fromJson(Map<String, dynamic> json) => StoreDetailsModel(
        storePhone: json["storePhone"],
        storeName: json["storeName"],
        imageUrl: json["imageUrl"],
        rating: json["rating"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        completeAddress: json["completeAddress"],
        postalCode: json["postalCode"],
        googleMapLink: json["googleMapLink"],
        distance: json["distance"],
      );

  Map<String, dynamic> toJson() => {
        "storePhone": storePhone,
        "storeName": storeName,
        "imageUrl": imageUrl,
        "rating": rating,
        "latitude": latitude,
        "longitude": longitude,
        "completeAddress": completeAddress,
        "postalCode": postalCode,
        "googleMapLink": googleMapLink,
        "distance": distance,
      };
}
