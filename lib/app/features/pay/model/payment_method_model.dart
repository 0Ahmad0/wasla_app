class PaymentMethodModel {
  final String title;
  final String? subtitle;
  final String icon;

  PaymentMethodModel({
    required this.title,
    this.subtitle,
    required this.icon,
  });
}