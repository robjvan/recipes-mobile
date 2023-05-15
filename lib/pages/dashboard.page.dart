import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes_mobile/controllers/app_state.controller.dart';
import 'package:recipes_mobile/services/api.service.dart';
import 'package:recipes_mobile/services/auth.service.dart';
import 'package:recipes_mobile/services/db.service.dart';
import 'package:recipes_mobile/widgets/drawer/nav_drawer.widget.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({final Key? key}) : super(key: key);
  static const String routeName = '/dashboard';

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    /// Grab user recipes from server and populate local DB
    DBService.refreshDB();
  }

  Widget buildSignOutBtn() {
    return const IconButton(
      icon: Icon(Icons.logout, size: 32),
      onPressed: AuthService.logout,
    );
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      key: _scaffoldKey,
      appBar: AppBar(
          // automaticallyImplyLeading: false,
          // leading: IconButton(
          //   onPressed: () {
          //     _scaffoldKey.currentState!.openDrawer();
          //   },
          //   icon: Icon(Icons.menu),
          // ),
          // actions: <Widget>[
          //   buildSignOutBtn(),
          // ],
          ),
      body: Obx(
        () => ListView.builder(
          itemCount: AppStateController.recipes.length,
          itemBuilder: (final BuildContext ctx, final int i) {
            return ListTile(
              title: Text(AppStateController.recipes[i].name),
            );
          },
        ),
      ),
    );
  }
}
