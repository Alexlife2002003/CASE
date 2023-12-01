import 'package:case_cuestionario/utils/AppDrawer.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return AppWithDrawer(
      title: 'Dashboard',
      content: Scaffold()
    );
  }
}
