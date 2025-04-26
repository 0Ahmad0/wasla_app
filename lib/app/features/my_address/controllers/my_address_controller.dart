import 'package:get/get.dart';
import 'package:wasla_app/app/features/my_address/model/my_address_model.dart';

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

  void addAddress(MyAddressModel address) {
    myAddressList.add(address);
  }


}