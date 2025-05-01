class UserReviewModel {
  final String name;
  final String review;
  final String? userImage;
  final int? rating;

  UserReviewModel({
    required this.name,
    required this.review,
    this.userImage,
    required this.rating,
  });
}
