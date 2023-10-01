import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:test/desktopLayout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => Container(color: Colors.blue),
      tablet: (BuildContext context) => Container(color: Colors.yellow),
      desktop: (BuildContext context) => const DesktopLayout(),
      watch: (BuildContext context) => Container(color: Colors.purple),
    );
  }
}
