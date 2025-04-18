import 'package:get/get.dart';
import 'package:wasla_app/app/features/notifications/model/notification_model.dart';
import 'package:wasla_app/core/color_manager.dart';

class NotificationController extends GetxController {
  final List<NotificationModel> notifications = [
    NotificationModel(
        title: 'تم الموافقة على طلبك بنجاح',
        subtitle: 'سررنا بك!',
        dateTime: '10:00 AM',
        notificationColor: ColorManager.primaryColor
    ),
    NotificationModel(
        title: 'تم رفض طلبك',
        subtitle: 'نأسف لذلك!',
        dateTime: '10:00 AM',
        notificationColor: ColorManager.errorColor
    ),
    NotificationModel(
        title: 'طلبك قيد المعالجة',
        subtitle: 'سيتم اعلامك بأقرب وقت!',
        dateTime: '10:00 AM',
        notificationColor: ColorManager.notificationProgressColor
    ),
    NotificationModel(
        title: 'تم الموافقة على طلبك بنجاح',
        subtitle: 'سررنا بك!',
        dateTime: '10:00 AM',
        notificationColor: ColorManager.primaryColor
    ),
    NotificationModel(
        title: 'تم رفض طلبك',
        subtitle: 'نأسف لذلك!',
        dateTime: '10:00 AM',
        notificationColor: ColorManager.errorColor
    ),
    NotificationModel(
        title: 'طلبك قيد المعالجة',
        subtitle: 'سيتم اعلامك بأقرب وقت!',
        dateTime: '10:00 AM',
        notificationColor: ColorManager.notificationProgressColor
    ),
    NotificationModel(
        title: 'تم الموافقة على طلبك بنجاح',
        subtitle: 'سررنا بك!',
        dateTime: '10:00 AM',
        notificationColor: ColorManager.primaryColor
    ),
    NotificationModel(
        title: 'تم الموافقة على طلبك بنجاح',
        subtitle: 'سررنا بك!',
        dateTime: '10:00 AM',
        notificationColor: ColorManager.primaryColor
    ),
    NotificationModel(
        title: 'طلبك قيد المعالجة',
        subtitle: 'سيتم اعلامك بأقرب وقت!',
        dateTime: '10:00 AM',
        notificationColor: ColorManager.notificationProgressColor
    ),
    NotificationModel(
        title: 'تم الموافقة على طلبك بنجاح',
        subtitle: 'سررنا بك!',
        dateTime: '10:00 AM',
        notificationColor: ColorManager.primaryColor
    ),
    NotificationModel(
        title: 'طلبك قيد المعالجة',
        subtitle: 'سيتم اعلامك بأقرب وقت!',
        dateTime: '10:00 AM',
        notificationColor: ColorManager.notificationProgressColor
    ),
  ];
}