import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:wasla_app/app/widgets/app_bar_widget.dart';
import 'package:wasla_app/core/extension/space_ext.dart';
import 'package:wasla_app/core/strings_manager.dart';

import '../../../../core/color_manager.dart';
import '../../../../core/style_manager.dart';
import '../../../widgets/app_button_widget.dart';
import '../../../widgets/app_padding.dart';

class LocationPickerPage extends StatefulWidget {
  @override
  _LocationPickerPageState createState() => _LocationPickerPageState();
}

class _LocationPickerPageState extends State<LocationPickerPage> {
  GoogleMapController? _mapController;
  LatLng _pickedLocation = const LatLng(33.5138, 36.2765);
  String _locationName = 'جاري تحديد العنوان...';

  Future<void> _goToMyLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
      )

    );

    LatLng userLatLng = LatLng(position.latitude, position.longitude);

    _mapController?.animateCamera(
      CameraUpdate.newLatLngZoom(userLatLng, 16),
    );
  }

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  Future<void> _determinePosition() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        permission = await Geolocator.requestPermission();
      }

      Position position = await Geolocator.getCurrentPosition();
      _pickedLocation = LatLng(position.latitude, position.longitude);
      _updateAddress(_pickedLocation);

      _mapController?.animateCamera(CameraUpdate.newLatLng(_pickedLocation));
      setState(() {});
    } catch (e) {
      print('فشل في الحصول على الموقع: $e');
    }
  }

  Future<void> _updateAddress(LatLng location) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(location.latitude, location.longitude);
      if (placemarks.isNotEmpty) {
        final place = placemarks.first;
        setState(() {
          _locationName =
              '${place.name ?? ''}, ${place.locality ?? ''}, ${place.country ?? ''}';
        });
      }
    } catch (e) {
      setState(() {
        _locationName = 'غير قادر على تحديد العنوان';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _pickedLocation,
              zoom: 16,
            ),
            myLocationEnabled: true,
            mapToolbarEnabled: true,
            zoomControlsEnabled: false,
            myLocationButtonEnabled: false,
            onCameraIdle: () => _updateAddress(_pickedLocation),
            onCameraMove: (position) {
              _pickedLocation = position.target;
            },
            onMapCreated: (controller) => _mapController = controller,
          ),
          Column(
            children: [
              const AppBarWidget(title: 'حدد العنوان من الخريطة'),
              4.h.height,
              Visibility(
                visible: _locationName.isNotEmpty,
                child: Container(
                  constraints: BoxConstraints(maxWidth: Get.width / 1.15),
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                      color: ColorManager.whiteColor,
                      borderRadius: BorderRadius.circular(8.r)),
                  child: Text(
                    _locationName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: getRegularStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
              )
            ],
          ),
          PositionedDirectional(
            bottom: 90,
            start: 16,
            child: FloatingActionButton(
              onPressed: _goToMyLocation,
              child: const Icon(Icons.my_location,color: ColorManager.whiteColor,),
            ),
          ),
          const Center(
            child: Icon(Icons.location_pin, size: 50, color: Colors.red),
          ),
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: AppPadding(
              vPadding: 10,
              child: AppButtonWidget(
                text: 'تحديد',
                onPressed: () => Get.back(result: _pickedLocation),
              ),
            ),
          )
        ],
      ),
    );
  }
}
