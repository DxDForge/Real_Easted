import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/entities/property.dart';

class HomeController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final RxString selectedLocation = 'Jakarta'.obs;
  final RxString selectedCategory = 'House'.obs;
  final RxList<Property> nearbyProperties = <Property>[].obs;
  final RxList<Property> bestProperties = <Property>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadProperties();
  }

  void loadProperties() {
    // Simulated data loading
    nearbyProperties.value = [
      Property(
        id: '1',
        name: 'Dreamsville House',
        location: 'Jl. Sultan Iskandar Muda, Jakarta Selatan',
        price: 2500000000,
        bedrooms: 6,
        bathrooms: 4,
        imageUrl: 'assets/images/house1.jpg',
        distance: 3.2,
        description:
            'The 3 level house that has a modern design, has a large pool and a garage that fits up to four cars.',
        ownerName: 'Garry Allen',
      ),
      Property(
        id: '2',
        name: 'Cool House',
        location: '3A Zigatola, Dhanmondi, Dhaka',
        price: 2500000000,
        bedrooms: 6,
        bathrooms: 4,
        imageUrl: 'assets/images/house2.jpg',
        distance: 3.2,
        description:
            'The 3 level house that has a modern design, has a large pool and a garage that fits up to four cars.',
        ownerName: 'John Doe',
      ),
      Property(
        id: '3',
        name: 'Awesome House',
        location: 'Uttar Badda, Gulshan, Dhaka',
        price: 2500000000,
        bedrooms: 6,
        bathrooms: 4,
        imageUrl: 'assets/images/house3.jpg',
        distance: 5,
        description:
            'The 3 level house that has a modern design, has a large pool and a garage that fits up to four cars.',
        ownerName: 'Terry Johnson',
      ),
      // Add more nearby properties
    ];

    bestProperties.value = [
      Property(
        id: '3',
        name: 'Awesome House',
        location: 'Uttar Badda, Gulshan, Dhaka',
        price: 2500000000,
        bedrooms: 6,
        bathrooms: 4,
        imageUrl: 'assets/images/house3.jpg',
        distance: 5,
        description:
            'The 3 level house that has a modern design, has a large pool and a garage that fits up to four cars.',
        ownerName: 'Terry Johnson',
      ),

      Property(
        id: '2',
        name: 'Cool House',
        location: '3A Zigatola, Dhanmondi, Dhaka',
        price: 2500000000,
        bedrooms: 6,
        bathrooms: 4,
        imageUrl: 'assets/images/house2.jpg',
        distance: 3.2,
        description:
            'The 3 level house that has a modern design, has a large pool and a garage that fits up to four cars.',
        ownerName: 'John Doe',
      ),

      Property(
        id: '1',
        name: 'Dreamsville House',
        location: 'Jl. Sultan Iskandar Muda, Jakarta Selatan',
        price: 2500000000,
        bedrooms: 4,
        bathrooms: 4,
        imageUrl: 'assets/images/house1.jpg',
        distance: 2,
        description:
            'The 3 level house that has a modern design, has a large pool and a garage that fits up to four cars.',
        ownerName: 'Garry Allen',
      ),

      // Add more best properties
    ];
  }

  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }

  void handleDrawerItemTap(String title) {
    scaffoldKey.currentState?.closeDrawer();

    switch (title.toLowerCase()) {
      case 'home':
        Get.offAllNamed('/home');
        break;
      case 'profile':
      case 'nearby':
      case 'bookmark':
      case 'notification':
      case 'message':
      case 'setting':
      case 'help':
        Get.snackbar('Coming Soon', '${title} page is under development');
        break;
      case 'logout':
        // Implement logout logic
        Get.snackbar(
            'Coming Soon', 'Logout functionality is under development');
        break;
    }
  }

  void openFilter() async {
    final result = await Get.toNamed('/filter');
    if (result != null) {
      updatePropertyList(result);
    }
  }

  void openPropertyDetails(String propertyId) {
    Get.toNamed('/property/$propertyId');
  }

  void updatePropertyList(Map<String, dynamic> filters) {
    // Update property lists based on filters
  }
}
