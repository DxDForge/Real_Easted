import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_app/presentation/controllers/home_controller.dart';
import '../../domain/entities/property.dart';

class DetailController extends GetxController {
  final RxBool isFavorite = false.obs;
  final Rx<Property?> property = Rx<Property?>(null);
  
  @override
  void onInit() {
    super.onInit();
    loadPropertyDetails();
  }

  void loadPropertyDetails() {
    final String propertyId = Get.parameters['id'] ?? '';
    
    // Get the HomeController instance to access the property lists
    final homeController = Get.find<HomeController>();
    
    // Search in both nearby and best properties
    final foundProperty = homeController.nearbyProperties
        .firstWhere(
          (p) => p.id == propertyId,
          orElse: () => homeController.bestProperties
              .firstWhere(
                (p) => p.id == propertyId,
                orElse: () => Property(
                  id: '0',
                  name: 'Not Found',
                  location: 'Unknown',
                  price: 0,
                  bedrooms: 0,
                  bathrooms: 0,
                  imageUrl: 'assets/images/house1.jpg',
                  distance: 0,
                  description: 'Property not found',
                  ownerName: 'Unknown',
                ),
              ),
        );
    
    property.value = foundProperty;
  }
  
  void toggleFavorite() {
    isFavorite.value = !isFavorite.value;
  }

  void showFullDescription() {
    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Description',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                property.value?.description ?? '',
                style: const TextStyle(height: 1.5),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () => Get.back(),
                child: const Text('Close'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showAllPhotos() {
    Get.snackbar('Coming Soon', 'Gallery view is under development');
  }

  void showMap() {
    Get.snackbar('Coming Soon', 'Map view is under development');
  }
}


