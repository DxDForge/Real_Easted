import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_app/core/constants/app_colors.dart';
import '../controllers/home_controller.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
color: AppColors.primary
        ),
        child: const SafeArea(
          child: Column(
            children: [
              // const Padding(
              //   padding: EdgeInsets.all(16.0),
              //   child: Align(
              //     alignment: Alignment.centerLeft,
              //     child: Text(
              //       'Menu',
              //       style: TextStyle(
              //         color: Colors.white,
              //         fontSize: 16,
              //         fontWeight: FontWeight.w500,
              //       ),
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       const Text(
              //         'Location',
              //         style: TextStyle(color: Colors.white70),
              //       ),
              //       Obx(() => DropdownButton<String>(
              //         value: controller.selectedLocation.value,
              //         dropdownColor: const Color(0xFF0A8ED9),
              //         style: const TextStyle(color: Colors.white),
              //         underline: Container(),
              //         isExpanded: true,
              //         icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
              //         items: ['Jakarta', 'Bandung', 'Surabaya']
              //             .map((String value) {
              //           return DropdownMenuItem<String>(
              //             value: value,
              //             child: Text(value),
              //           );
              //         }).toList(),
              //         onChanged: (String? newValue) {
              //           if (newValue != null) {
              //             controller.selectedLocation.value = newValue;
              //             Get.back();
              //           }
              //         },
              //       )),
              //     ],
              //   ),
              // ),
              DrawerItem(
                icon: Icons.home_outlined,
                label: 'Home',
                isSelected: true,
              ),
              DrawerItem(
                icon: Icons.person,
                label: 'Profile',
                isSelected: false,
              ),
              DrawerItem(
                icon: Icons.location_city_rounded,
                label: 'Nearby',
                isSelected: false,
              ),
              
              Divider(color: Colors.white24),
              DrawerItem(
                icon: Icons.bookmark_border,
                label: 'Bookmark',
              ),
              DrawerItem(
                icon: Icons.notifications,
                label: 'Notification',
                hasNotification: false,
              ),
              DrawerItem(
                icon: Icons.message,
                label: 'Message',
                hasNotification: false,
              ),
              Divider(color: Colors.white24),
              DrawerItem(
                icon: Icons.settings_outlined,
                label: 'Setting',
              ),
              DrawerItem(
                icon: Icons.help_outline,
                label: 'Help',
              ),
              DrawerItem(
                icon: Icons.logout,
                label: 'Logout',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final bool hasNotification;

  const DrawerItem({
    Key? key,
    required this.icon,
    required this.label,
    this.isSelected = false,
    this.hasNotification = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.find<HomeController>().handleDrawerItemTap(label),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        decoration: isSelected
            ? const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(25),
                ),
              )
            : null,
        child: ListTile(
          leading: Icon(
            icon,
            color: isSelected ? const Color(0xFF0A8ED9) : Colors.white,
            size: 24,
          ),
          title: Text(
            label,
            style: TextStyle(
              color: isSelected ? const Color(0xFF0A8ED9) : Colors.white,
              fontSize: 14,
            ),
          ),
          trailing: hasNotification
              ? Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                )
              : null,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          minLeadingWidth: 24,
          horizontalTitleGap: 12,
        ),
      ),
    );
  }
}
