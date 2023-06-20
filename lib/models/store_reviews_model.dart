class StoreReviewsFields {
  static const String id = 'id';
  static const String reviewText = 'text';
  static const String rating = 'rating';
  static const String createDate = 'time_created';
  static const String userName = 'name';
}

class StoreReviewsModel {
  final String id;
  final String reviewText;
  final double rating;
  final String createDate;
  final String userName;
  StoreReviewsModel({
    required this.id,
    required this.reviewText,
    required this.rating,
    required this.createDate,
    required this.userName,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      StoreReviewsFields.id: id,
      StoreReviewsFields.reviewText: reviewText,
      StoreReviewsFields.rating: rating,
      StoreReviewsFields.createDate: createDate,
      StoreReviewsFields.userName: userName,
    };
  }

  static StoreReviewsModel fromMap(Map<String, dynamic> map) {
    return StoreReviewsModel(
      id: map[StoreReviewsFields.id] as String,
      reviewText: map[StoreReviewsFields.reviewText] as String,
      rating: map[StoreReviewsFields.rating] as double,
      createDate: map[StoreReviewsFields.createDate] as String,
      userName: map['user'][StoreReviewsFields.userName] as String,
    );
  }
}
