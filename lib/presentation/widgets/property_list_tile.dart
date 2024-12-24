
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/entities/property.dart';
import '../../core/constants/app_colors.dart';
import '../controllers/home_controller.dart';

class PropertyListTile extends StatelessWidget {
  final Property property;

  const PropertyListTile({Key? key, required this.property}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.find<HomeController>().openPropertyDetails(property.id),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              child: Image.asset(
                property.imageUrl,
                width: 120,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      property.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                     const SizedBox(height: 8),

                    
                    Text(
                      'Rp ${(property.price / 1000000000).toStringAsFixed(1)} B / Year',
                      style: const TextStyle(
                        color: AppColors.primary,
                        fontSize: 12,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
const SizedBox(height: 8),
                                        Row(
                      children: [
                        const Icon(Icons.bed_outlined, size: 16, color: Colors.grey),
                        const SizedBox(width: 4),
                        Text(
                          '${property.bedrooms} Bedroom',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(width: 16),
                        const Icon(Icons.bathroom_outlined, size: 16, color: Colors.grey),
                        const SizedBox(width: 4),
                        Text(
                          '${property.bathrooms} Bathroom',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}