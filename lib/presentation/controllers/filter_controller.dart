import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterController extends GetxController {
  final RxBool isLoading = false.obs;
  final Rx<RangeValues> priceRange = RangeValues(0, 10000000000).obs;
  final RxList<String> selectedAmenities = <String>[].obs;
  final Rx<String?> selectedPropertyType = Rx<String?>(null);
  final Rx<int?> selectedBedrooms = Rx<int?>(null);
  final Rx<int?> selectedBathrooms = Rx<int?>(null);
  
  void resetFilters() {
    priceRange.value = RangeValues(0, 10000000000);
    selectedAmenities.clear();
    selectedPropertyType.value = null;
    selectedBedrooms.value = null;
    selectedBathrooms.value = null;
  }

  void applyFilters() {
    final filters = {
      'priceRange': priceRange.value,
      'amenities': selectedAmenities,
      'propertyType': selectedPropertyType.value,
      'bedrooms': selectedBedrooms.value,
      'bathrooms': selectedBathrooms.value,
    };
    
    Get.back(result: filters);
  }
}
