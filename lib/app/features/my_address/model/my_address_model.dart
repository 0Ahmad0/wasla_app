class MyAddressModel {
  final double latitude;         // خط العرض
  final double longitude;        // خط الطول
  final String title;            // مثل "البيت"
  final String subtitle;         // وصف عام
  final String streetName;       // اسم الشارع
  final String buildingNumber;   // رقم المبنى
  final String district;         // الحي
  final String city;             // المدينة
  final String landmark;         // معلم بارز
  final String extraDetails;     // تفاصيل إضافية
  final String dateSelected;     // تاريخ إضافة العنوان

  MyAddressModel({
    required this.title,
    required this.subtitle,
    required this.latitude,
    required this.longitude,
    required this.streetName,
    required this.buildingNumber,
    required this.district,
    required this.city,
    required this.landmark,
    required this.extraDetails,
    required this.dateSelected,
  });
}
