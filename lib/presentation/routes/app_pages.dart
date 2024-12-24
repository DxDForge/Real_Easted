import 'package:get/get.dart';
import 'package:real_estate_app/presentation/bindings/detail_binding.dart';
import 'package:real_estate_app/presentation/pages/detail_page.dart';
import '../pages/home_page.dart';
import '../pages/filter_page.dart';
import '../bindings/home_binding.dart';
import '../bindings/filter_binding.dart';

class AppPages {
  static const INITIAL = '/home';

  static final routes = [
    GetPage(
      name: '/home',
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: '/filter',
      page: () => FilterPage(),
      binding: FilterBinding(),
    ),
    GetPage(
      name: '/property/:id',
      page: () => PropertyDetailPage(),
      binding: PropertyDetailBinding(),
    ),
  ];
}


