import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:news_app/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:news_app/app/modules/home/views/home_view.dart';
import 'package:news_app/app/modules/pencarian/views/pencarian_view.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.tabindex.value,
          children: const [
            HomeView(),
            PencarianView(),
            Center(child: Text("Saved News")),
            Center(child: Text("Profile")),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, -1),
            ),
          ],
        ),
        child: Obx(
          () => BottomNavigationBar(
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabindex.value,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            elevation: 0,
            selectedItemColor: Theme.of(context).primaryColor,
            unselectedItemColor: Colors.grey.shade400,
            selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
            unselectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
            items: [
              _bottomNavigationBarItem(
                icon: Icons.home_rounded,
                activeIcon: Icons.home_rounded,
                label: 'Home',
              ),
              _bottomNavigationBarItem(
                icon: Icons.search_rounded,
                activeIcon: Icons.search_rounded,
                label: 'Discover',
              ),
              _bottomNavigationBarItem(
                icon: Icons.bookmark_border_rounded,
                activeIcon: Icons.bookmark_rounded,
                label: 'Saved',
              ),
              _bottomNavigationBarItem(
                icon: Icons.person_outline_rounded,
                activeIcon: Icons.person_rounded,
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem({
    required IconData icon,
    required IconData activeIcon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: Container(
        margin: const EdgeInsets.only(bottom: 4),
        child: Icon(icon),
      ),
      activeIcon: Container(
        margin: const EdgeInsets.only(bottom: 4),
        child: Icon(activeIcon),
      ),
      label: label,
    );
  }
}
