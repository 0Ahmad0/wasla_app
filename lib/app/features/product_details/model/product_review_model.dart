class ProductReviewModel {
  final String name;
  final String review;
  final String? userImage;
  final int? rating;

  ProductReviewModel({
    required this.name,
    required this.review,
    this.userImage,
    required this.rating,
  });
}
