import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickers extends StatefulWidget {
  const ImagePickers({super.key});

  @override
  State<ImagePickers> createState() => _ImagePickersState();
}

class _ImagePickersState extends State<ImagePickers> {
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

//
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

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Text(
                      'RadicalStart',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              SizedBox(height: 30),
              Container(
                width: 400,
                height: 620,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Upload image',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    GestureDetector(
                      onTap: () {
                        _showbuttomSheet();
                      },
                      child: Container(
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
                                    decoration: BoxDecoration(
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
                                          image: FileImage(File(image!.path))),
                                      borderRadius: BorderRadius.circular(30)),
                                )),
                    ),
                    image != null
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
                                      borderRadius: BorderRadius.circular(30)),
                                  child: GestureDetector(
                                    onTap: () {
                                      _showbuttomSheet();
                                    },
                                    child: Icon(
                                      Icons.edit_calendar_outlined,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Icon(
                                    Icons.done,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          )
                        : SizedBox()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showbuttomSheet() async {
    return showModalBottomSheet<void>(
        isScrollControlled: true,
        constraints: BoxConstraints(maxHeight: 250),
        context: context,
        builder: (BuildContext context) {
          return Center(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(30),
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
                onTap: () {
                  pickImageByCamera();
                },
                leading: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.black12,
                    child: Icon(Icons.camera_alt)),
                title: Text('Camera'),
              ),
              Divider(),
              ListTile(
                onTap: () {
                  pickImageByGallery();
                },
                leading: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.black12,
                    child: Icon(Icons.image_outlined)),
                title: Text('Gallery'),
              ),
            ],
          ));
        });
  }
}
