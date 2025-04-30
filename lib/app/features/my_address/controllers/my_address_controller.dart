import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:wasla_app/app/features/my_address/model/my_address_model.dart';
import 'package:latlong2/latlong.dart';
class MyAddressController extends GetxController{
  RxList<MyAddressModel> myAddressList = <MyAddressModel>[
    MyAddressModel(
      title: "بيتي",
      subtitle: "شارع العليا، رقم 12، حي العليا، الرياض",
      latitude: 24.7136,
      longitude: 46.6753,
      streetName: "شارع العليا",
      buildingNumber: "12",
      district: "العليا",
      city: "الرياض",
      landmark: "بالقرب من مول الفيصلية",
      extraDetails: "الشقة 5، الدور الثاني",
      dateSelected: DateTime.now().toString(),
    ),
    MyAddressModel(
      title: "بيتي",
      subtitle: "شارع العليا، رقم 12، حي العليا، الرياض",
      latitude: 24.7136,
      longitude: 46.6753,
      streetName: "شارع العليا",
      buildingNumber: "12",
      district: "العليا",
      city: "الرياض",
      landmark: "بالقرب من مول الفيصلية",
      extraDetails: "الشقة 5، الدور الثاني",
      dateSelected: DateTime.now().toString(),
    ),
    MyAddressModel(
      title: "بيتي",
      subtitle: "شارع العليا، رقم 12، حي العليا، الرياض",
      latitude: 24.7136,
      longitude: 46.6753,
      streetName: "شارع العليا",
      buildingNumber: "12",
      district: "العليا",
      city: "الرياض",
      landmark: "بالقرب من مول الفيصلية",
      extraDetails: "الشقة 5، الدور الثاني",
      dateSelected: DateTime.now().toString(),
    ),
  ].obs;

  RxInt selectedIndex = (-1).obs;

  final  addNewLocationFormKey= GlobalKey<FormState>();

  // Rx<LatLng> selectedLocation = const LatLng(32.6432, 36.0857).obs;
  Rx<LatLng?> selectedLocation = Rx<LatLng?>(null);
  // الإحداثيات الخاصة بدرعا

  RxString locationName = ''.obs;

  TextEditingController locationTextController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController subtitleController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController buildingController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController landmarkController = TextEditingController();
  TextEditingController extraDetailsController = TextEditingController();

  void setSelectedIndex(int index) {
    selectedIndex.value = index;
  }
  void addAddress(MyAddressModel address) {
    myAddressList.add(address);
  }


  void updateLocation(LatLng point) async {
    selectedLocation.value = point;

    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        point.latitude,
        point.longitude,
      );

      if (placemarks.isNotEmpty) {
        final place = placemarks.first;
        // locationName.value =
        // "${place.name ?? ''}, ${place.street ?? ''}, "
        //     "${place.subLocality ?? ''}, ${place.locality ?? ''}, "
        //     "${place.administrativeArea ?? ''}, ${place.country ?? ''}";

        locationName.value = "${place.locality ?? ''}, ${place.country ?? ''}";
        locationTextController.text = locationName.value;
      } else {
        locationName.value = "موقع غير معروف";
      }
    } catch (_) {
      locationName.value = "فشل في الحصول على اسم الموقع";
    }
  }
  Future<void> initUserLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.deniedForever || permission == LocationPermission.denied) {
          return;
        }
      }

      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      final userLocation = LatLng(position.latitude, position.longitude);
      selectedLocation.value = userLocation;
      updateLocation(userLocation);
    } catch (e) {
      print("فشل في الحصول على الموقع: $e");
    }
  }


  @override
  void onInit() {
    super.onInit();
    initUserLocation();
  }


}