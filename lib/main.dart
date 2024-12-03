import 'package:calculator/image_picker.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'getx_cal/calculator.dart';
import 'provider_cal/calculator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: ImagePick(),
    );
  }
}

class ImagePickController extends GetxController {
  var currentIndex = 0.obs;
}

class ImagePick extends StatelessWidget {
  const ImagePick({super.key});

  @override
  Widget build(BuildContext context) {
    final ImagePickController controller = Get.put(ImagePickController());

    final List<Widget> screens = [
      Calculator(),
      CalculatorGetx(),
      const ImagePickers(),
    ];

    return Scaffold(
      body: Obx(() {
        return screens[controller.currentIndex.value];
      }),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: (int newIndex) {
            controller.currentIndex.value = newIndex;
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Provider',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'GetX',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.image_outlined),
              label: 'Upload',
            ),
          ],
          selectedItemColor: Colors.deepPurple,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
        );
      }),
    );
  }
}
