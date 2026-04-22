import 'package:flutter/material.dart';
import 'package:neutria/presentations/common/data/entity/menu_item_entity.dart';
import 'package:neutria/presentations/common/viewmodels/home_navigation_holder_provider.dart';
import 'package:provider/provider.dart';

class HomeNavigationHolderScreen extends StatelessWidget {
  static const String name = 'home_main_holder';
  const HomeNavigationHolderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<MenuItemEntity> items = [
      MenuItemEntity(label: 'Home', icon: Icons.home),
      MenuItemEntity(label: 'Analytics', icon: Icons.analytics_outlined),
      MenuItemEntity(label: 'Meal', icon: Icons.brunch_dining_rounded),
      MenuItemEntity(label: 'Settings', icon: Icons.settings),
    ];

    return Consumer<HomeNavigationHolderProvider>(
      builder: (context, provider, child) => Scaffold(
        body: Stack(
          children: [
            provider.getScreenList[provider.getScreenIndex],

            // Floating nav bar
            Positioned(
              left: 14,
              right: 14,
              bottom: 14,
              child: SafeArea(
                child: Container(
                  margin: EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    borderRadius: .circular(32),
                    color: Colors.black,
                  ),
                  child: ClipRRect(
                    borderRadius: .circular(32),
                    child: BottomNavigationBar(
                      currentIndex: provider.getScreenIndex,
                      onTap: (value) => provider.changeScreen = value,
                      type: .fixed,
                      backgroundColor: Colors.transparent,
                      unselectedItemColor: Colors.grey.shade500,
                      selectedItemColor: Colors.white,
                      showUnselectedLabels: false,
                      showSelectedLabels: false,
                      items: items.asMap().entries.map((e) {
                        IconData icon = e.value.icon;
                        int index = e.key;
                        String label = e.value.label;

                        return BottomNavigationBarItem(
                          icon: Column(
                            children: [
                              Icon(icon),
                              Text(
                                label,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: .w500,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 4),

                              AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                                height: index == provider.getScreenIndex
                                    ? 2
                                    : 0,
                                width: index == provider.getScreenIndex
                                    ? 32
                                    : 0,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          label: 'Home',
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
