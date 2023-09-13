import 'package:flutter/material.dart';
import 'package:trilhaapp/shared/app_images.dart';

class ListViewVPage extends StatefulWidget {
  const ListViewVPage({super.key});

  @override
  State<ListViewVPage> createState() => _ListViewVPageState();
}

class _ListViewVPageState extends State<ListViewVPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Card(child: Image.asset(AppImages.paisagem)),
              Card(child: Image.asset(AppImages.paisagem2)),
              Image.asset(AppImages.paisagem3),
            ],
          ),
        ),
        Expanded(flex: 2, child: Container())
      ],
    ));
  }
}
