import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/filter_controller.dart';
import '../../core/constants/app_colors.dart';

class FilterPage extends GetView<FilterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter'),
        actions: [
          TextButton(
            onPressed: () => controller.resetFilters(), // Reset filters
            child: const Text('Reset', style: TextStyle(color: AppColors.primary)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPriceRange(), // Price range filter
            // Add other filter sections
          ],
        ),
      ),
      bottomNavigationBar: _buildApplyButton(), // Apply filters button
    );
  }

  Widget _buildPriceRange() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Price Range',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Obx(() => RangeSlider(
          values: controller.priceRange.value,
          min: 0,
          max: 10000000000,
          divisions: 100,
          labels: RangeLabels(
            '${(controller.priceRange.value.start / 1000000000).toStringAsFixed(1)}B',
            '${(controller.priceRange.value.end / 1000000000).toStringAsFixed(1)}B',
          ),
          onChanged: (RangeValues values) {
            controller.priceRange.value = values; // Update price range
          },
        )),
      ],
    );
  }

  Widget _buildApplyButton() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: ElevatedButton(
        onPressed: () => controller.applyFilters(), // Apply filters
        child: const Text('Apply Filters'),
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
        ),
      ),
    );
  }
}
