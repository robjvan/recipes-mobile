import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes_mobile/pages/pages.dart';
import 'package:recipes_mobile/services/auth.service.dart';
import 'package:recipes_mobile/widgets/drawer/nav_destinations.dart';

class NavDrawer extends StatefulWidget {
  const NavDrawer({super.key});

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  Widget buildSignOutBtn() {
    return const IconButton(
      icon: Icon(Icons.logout, size: 32),
      onPressed: AuthService.logout,
    );
  }

  Widget buildDivider() {
    return const Divider(
      indent: 16.0,
      endIndent: 16.0,
    );
  }

  Widget buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(28, 16, 16, 0),
      child: Row(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Header',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          buildSignOutBtn(),
        ],
      ),
    );
  }

  void handleNav(final int index) {
    switch (index) {
      case 2:
        Get.toNamed(CollectionPage.routeName);
        break;
      case 3:
        Get.toNamed(FavoritesPage.routeName);
        break;
      case 4:
        Get.toNamed(SettingsPage.routeName);
        break;
      case 1:
      default:
        Get.toNamed(DashboardPage.routeName);
        break;
    }
  }

  @override
  Widget build(final BuildContext context) {
    return
        // NavigationDrawer(
        //   onDestinationSelected: handleNav,
        //   children: <Widget>[
        //     buildHeader(),
        //     buildDivider(),
        //     ...navLinks,
        //     const Spacer(),
        //     // buildSignOutBtn(),
        //     buildDivider(),
        //   ],
        // );
        Drawer(
      width: Get.width * 0.85,
      child: SizedBox(
        height: Get.height,
        // child
        child: Column(
          children: <Widget>[
            buildHeader(),
            buildDivider(),
            ...navLinks,
            buildDivider(),
            // const Spacer(),
            // buildSignOutBtn(),
          ],
        ),
      ),
    );
  }
}
