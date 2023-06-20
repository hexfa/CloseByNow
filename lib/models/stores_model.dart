class StoresFields {
  static const String id = 'id';
  static const String name = 'name';
  static const String rating = 'rating';
  static const String address = 'address1';
  static const String reviewCount = 'review_count';
  static const String phone = 'phone';
  static const String imageUrl = 'image_url';
}

class StoresModel {
  final String id;
  final String name;
  final String address;
  final double rating;
  final String imageUrl;
  final int reviewCount;
  final String phone;
  StoresModel({
    required this.id,
    required this.name,
    required this.address,
    required this.rating,
    required this.imageUrl,
    required this.reviewCount,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      StoresFields.id: id,
      StoresFields.name: name,
      StoresFields.address: address,
      StoresFields.rating: rating,
      StoresFields.imageUrl: imageUrl,
      StoresFields.reviewCount: reviewCount,
      StoresFields.phone: phone,
    };
  }

  static StoresModel fromMap(Map<String, dynamic> map) {
    return StoresModel(
      id: map[StoresFields.id] as String,
      name: map[StoresFields.name] as String,
      address: map['location'][StoresFields.address] as String,
      rating: map[StoresFields.rating] as double,
      imageUrl: map[StoresFields.imageUrl] as String,
      reviewCount: map[StoresFields.reviewCount] as int,
      phone: map[StoresFields.phone] as String,
    );
  }
}
