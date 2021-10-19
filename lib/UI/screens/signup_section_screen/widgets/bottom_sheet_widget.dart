import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerBottomSheetWidget extends StatelessWidget {
  var controller;
  final bool? isImageForProfilePic;

  ImagePickerBottomSheetWidget(
      {Key? key, this.controller, this.isImageForProfilePic})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 120,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("chooseImage".tr),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  IconButton(
                    icon: const Icon(Icons.camera),
                    onPressed: () {
                      isImageForProfilePic!
                          ? controller
                              .imageForProfilePicture(ImageSource.camera)
                          : controller.takePhoto(ImageSource.camera);
                      Get.back();
                    },
                  ),
                  Text("camera".tr),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    icon: const Icon(Icons.image),
                    onPressed: () {
                      isImageForProfilePic!
                          ? controller
                              .imageForProfilePicture(ImageSource.gallery)
                          : controller.pickImages();
                      Get.back();
                    },
                  ),
                  Text("gallery".tr),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
