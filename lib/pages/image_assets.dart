import 'package:flutter/material.dart';
import 'package:trilhaapp/shared/app_images.dart';

class ImageAssetsPage extends StatefulWidget {
  const ImageAssetsPage({super.key});

  @override
  State<ImageAssetsPage> createState() => _ImageAssetsPageState();
}

class _ImageAssetsPageState extends State<ImageAssetsPage> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Image.asset(
            AppImages.user1,
            height: 50,
          ),
          Image.asset(
            AppImages.user2,
            height: 50,
          ),
          Image.asset(
            AppImages.user3,
            height: 50,
          ),
          Image.asset(
            AppImages.paisagem,
            width: double.infinity,
          ),
          Image.asset(
            AppImages.paisagem2,
            width: double.infinity,
          ),
          Image.asset(
            AppImages.paisagem3,
            height: 50,
          ),
        ],
      ),
    );
  }
}
