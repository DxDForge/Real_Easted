import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_app/core/constants/app_colors.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.primary, // Set background color
        child: SafeArea(
          child: Column(
            children: [
              _buildLocationHeader(), // Location header with dropdown
              _buildMenuItems(), // Menu items
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLocationHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Location',
            style: TextStyle(color: Colors.white70), // Text style for location
          ),
          DropdownButton<String>(
            value: 'Jakarta', // Default value
            dropdownColor: AppColors.primary, // Dropdown background color
            style: TextStyle(color: Colors.white), // Text style
            icon: Icon(Icons.arrow_drop_down, color: Colors.white), // Dropdown icon
            underline: SizedBox(), // Remove underline
            items: ['Jakarta', 'Bandung', 'Surabaya']
                .map((String value) => DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    ))
                .toList(),
            onChanged: (_) {}, // Handle change
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItems() {
    return Column(
      children: [
        _buildMenuItem(Icons.home_outlined, 'Home', true), // Home menu item
        _buildMenuItem(Icons.person_outline, 'Profile', false), // Profile menu item
        _buildMenuItem(Icons.location_on_outlined, 'Nearby', false), // Nearby menu item
        _buildMenuItem(Icons.bookmark_border, 'Bookmark', false), // Bookmark menu item
        _buildMenuItem(Icons.notifications_none, 'Notification', false), // Notification menu item
        _buildMenuItem(Icons.message_outlined, 'Message', false), // Message menu item
        Divider(color: Colors.white24, height: 32), // Divider
        _buildMenuItem(Icons.settings_outlined, 'Setting', false), // Setting menu item
        _buildMenuItem(Icons.help_outline, 'Help', false), // Help menu item
        _buildMenuItem(Icons.logout, 'Logout', false), // Logout menu item
      ],
    );
  }

  Widget _buildMenuItem(IconData icon, String label, bool isSelected) {
    return Container(
      color: isSelected ? Colors.white.withOpacity(0.1) : Colors.transparent, // Highlight selected item
      child: ListTile(
        leading: Icon(icon, color: Colors.white), // Icon
        title: Text(
          label,
          style: TextStyle(color: Colors.white), // Text style
        ),
        onTap: () => Get.toNamed('/${label.toLowerCase()}'), // Navigate to the selected page
      ),
    );
  }
}