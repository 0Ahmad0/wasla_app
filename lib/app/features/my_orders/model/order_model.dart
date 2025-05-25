import '../enum/orser_status.dart';

class OrderModel {
  final String id;
  final double price;
  final OrderStatus status;

  OrderModel({
    required this.id,
    required this.price,
    required this.status,
  });
}