import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';

class ImagePickers extends StatefulWidget {
  const ImagePickers({super.key});

  @override
  State<ImagePickers> createState() => _ImagePickersState();
}

class _ImagePickersState extends State<ImagePickers> {
  final ImagePicker picker = ImagePicker();
  final ValueNotifier<File?> _imageNotifier = ValueNotifier<File?>(null);

  Future pickImageByGallery() async {
    try {
      final image = await picker.pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      _imageNotifier.value = imageTemp;
      Navigator.pop(context);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickImageByCamera() async {
    try {
      final image = await picker.pickImage(source: ImageSource.camera);
      if (image == null) return;
      final imageTemp = File(image.path);
      _imageNotifier.value = imageTemp;
      Navigator.pop(context);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Text(
                    'RadicalStart',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Container(
              width: 400,
              height: 620,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  const Text(
                    'Upload image',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(height: 50),
                  GestureDetector(
                    onTap: _showBottomSheet,
                    child: ValueListenableBuilder<File?>(
                      valueListenable: _imageNotifier,
                      builder: (context, image, child) {
                        return Container(
                          height: 340,
                          width: 300,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 214, 212, 212),
                              borderRadius: BorderRadius.circular(30)),
                          child: image == null
                              ? Padding(
                                  padding: const EdgeInsets.all(90),
                                  child: Container(
                                    height: 10,
                                    decoration: const BoxDecoration(
                                        color: Colors.blueAccent,
                                        shape: BoxShape.circle),
                                    child: const Icon(
                                      Icons.add,
                                      size: 60,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: FileImage(File(image.path))),
                                      borderRadius: BorderRadius.circular(30)),
                                ),
                        );
                      },
                    ),
                  ),
                  ValueListenableBuilder<File?>(
                    valueListenable: _imageNotifier,
                    builder: (context, image, child) {
                      return image != null
                          ? Padding(
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: GestureDetector(
                                      onTap: _showBottomSheet,
                                      child: const Icon(
                                        Icons.edit_calendar_outlined,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 30),
                                  Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: const Icon(
                                      Icons.done,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : const SizedBox();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showBottomSheet() async {
    return showModalBottomSheet<void>(
      isScrollControlled: true,
      constraints: const BoxConstraints(maxHeight: 250),
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(30),
                child: Row(
                  children: [
                    Text(
                      'Upload via',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
              ),
              ListTile(
                onTap: pickImageByCamera,
                leading: const CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.black12,
                    child: Icon(Icons.camera_alt)),
                title: const Text('Camera'),
              ),
              const Divider(),
              ListTile(
                onTap: pickImageByGallery,
                leading: const CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.black12,
                    child: Icon(Icons.image_outlined)),
                title: const Text('Gallery'),
              ),
            ],
          ),
        );
      },
    );
  }
}
