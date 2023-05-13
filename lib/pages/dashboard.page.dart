import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({final Key? key}) : super(key: key);
  static const String routeName = '/dashboard';

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    /// Grab user recipes from server and populate local DB
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemBuilder: (ctx, i) {},
      ),
    );
  }
}
