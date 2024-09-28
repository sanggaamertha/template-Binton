import 'package:baca_mongo/menu/helper/helper_function.dart';
import 'package:baca_mongo/page/historyPage.dart';
import 'package:baca_mongo/page/homePage.dart';
import 'package:baca_mongo/page/setting_Page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class NavigationMenu extends StatelessWidget {
  NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = ThemeHelper.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
            () => Stack(
          children: [
            NavigationBar(
              height: 70,
              elevation: 0,
              selectedIndex: controller.selectedIndex.value,
              onDestinationSelected: (index) => controller.selectedIndex.value = index,
              backgroundColor: darkMode ? Colors.black : HexColor('ffffff'),
              indicatorColor: Colors.transparent,
              animationDuration: Duration(milliseconds: 300),
              destinations: [
                _buildNavigationDestination(
                  icon: FontAwesomeIcons.calendarCheck,
                  label: 'Book',
                  selectedIndex: controller.selectedIndex.value,
                  currentIndex: 0,
                ),
                _buildNavigationDestination(
                  icon: FontAwesomeIcons.clockRotateLeft,
                  label: 'History',
                  selectedIndex: controller.selectedIndex.value,
                  currentIndex: 1,
                ),
                _buildNavigationDestination(
                  icon: FontAwesomeIcons.sliders,
                  label: 'Setting',
                  selectedIndex: controller.selectedIndex.value,
                  currentIndex: 2,
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: controller.selectedIndex.value * MediaQuery.of(context).size.width / 3,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                width: MediaQuery.of(context).size.width / 3,
                height: 5,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.green, Colors.green],
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }

  NavigationDestination _buildNavigationDestination({
    required IconData icon,
    required String label,
    required int selectedIndex,
    required int currentIndex,
  }) {
    return NavigationDestination(
      icon: Padding(
        padding: EdgeInsets.all(3.0),
        child: FaIcon(
          icon,
          size: selectedIndex == currentIndex ? 27 : 17,
          color: selectedIndex == currentIndex ? Colors.green : Colors.grey,
        ),
      ),
      selectedIcon: FaIcon(
        icon,
        size: 27,
        color: Colors.green,
      ),
      label: "",
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [home(), historyPage(), settingPage()];
}
