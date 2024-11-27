import 'dart:io';

import 'package:calculator/image_picker.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import 'calculator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ImagePick(),
    );
  }
}

class ImagePick extends StatefulWidget {
  const ImagePick({super.key});

  @override
  State<ImagePick> createState() => _ImagePickState();
}

class _ImagePickState extends State<ImagePick> {
  int _currentIndex = 0;
  final ImagePicker picker = ImagePicker();
  File? image;
  Future pickImageByGallery() async {
    try {
      final image = await picker.pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() {
        Navigator.pop(context);
        this.image = imageTemp;
      });
    } on PlatformException catch (e) {
      print('Filed to pick images: $e');
    }
  }

  Future pickImageByCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() {
        Navigator.pop(context);
        this.image = imageTemp;
      });
    } on PlatformException catch (e) {
      print('Filed to pick image: $e');
    }
  }

  final List<Widget> _screens = [
    const Calculator(),
    const Calculator(),
    const ImagePickers(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Provider'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'GetX'),
          BottomNavigationBarItem(
              icon: Icon(Icons.image_outlined), label: 'Upload')
        ],
      ),
    );
  }
}
