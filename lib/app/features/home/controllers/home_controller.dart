import 'package:get/get.dart';

import '../model/carousel_home_item_model.dart';


class HomeController extends GetxController{
  RxList<CarouselHomeItemModel> carouselHomeItems = <CarouselHomeItemModel>[
    CarouselHomeItemModel(
      image: 'https://imgs.search.brave.com/fHuioB0Gbpb2pHRE6CyRGCuLXUx8sFWyuBYJS-VvXCQ/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pMC53/cC5jb20vc3RvcmFn/ZS5nb29nbGVhcGlz/LmNvbS80ODg3NzEx/OC03MjcyLTRhNGQt/YjMwMi0wNDY1ZDhh/YTQ1NDgvMDVhYWRj/YTMtYmU5Yi00MTYy/LWI0ZWUtZWQ0MzYx/MDkxNzUzLzU3ZWJk/YmM4LTA5ZDgtNGYy/YS1hMjk5LWM4Nzc3/ZGUxOTFhYS5qcGc_/dz04MDAmc3NsPTE',
      text: 'توصيل سريع لجميع المناطق!',
    ),
    CarouselHomeItemModel(
      image: 'https://imgs.search.brave.com/cRnaXIOX_S10OIOO-biW6lVU6z5nenqeNgWStKfszms/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pMC53/cC5jb20vZS10ZWph/cmEuY29tL3dwLWNv/bnRlbnQvdXBsb2Fk/cy8yMDE1LzAzL2Ny/ZWRpdC1jYXJkLW51/bWJlcnMtd2l0aC1j/dnYuanBnP3Jlc2l6/ZT03MDgsMzU1JnNz/bD0x',
      text: 'دفع آمن بوسائل متعددة',
    ),
    CarouselHomeItemModel(
      image: 'https://imgs.search.brave.com/-aeJXxc3AzRmBBFY54FFs-EGW_HVjONqwwhiIIvPRMI/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9zYS1q/ZXdlbC5jb20vY2Ru/L3Nob3AvZmlsZXMv/MjQ5YjAzZjZkMzE1/NDZhZDkxYTg5OTQ2/YTJlMzNkYjIuanBn/P3Y9MTczNzU1NDUz/MyZ3aWR0aD0xMTAw',
      text: 'شنط نسائية بتصاميم فريدة',
    ),
    CarouselHomeItemModel(
      image: 'https://imgs.search.brave.com/8EDxiRCWXOzH1wvvMWKWx8Z3qIiAvP5FHiybBZEbmEY/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pLmlt/Z3VyLmNvbS9LWkoz/aUkxLmpwZw',
      text: 'أزياء رجالية شبابية من Shein',
    ),
  ].obs;
  RxInt activeIndex = 0.obs;
  void onPageChanged(int index){
    activeIndex.value = index;
  }
}