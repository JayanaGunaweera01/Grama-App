import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nutriscan/services/colors.dart';
import 'package:nutriscan/widgets/body_widget.dart';
import 'package:nutriscan/widgets/scan_button_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? imageFile;

  Future<void> openBottomSheet() async {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        final size = MediaQuery.of(context).size;
        return Container(
          height: size.height,
          width: double.infinity,
          color: mainColor_1.withOpacity(0.5),
          child: Stack(
            children: [
              Positioned(
                top: 50,
                left: 0,
                right: 0,
                bottom: 50,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 4,
                  controller: ScrollController(),
                  padding: const EdgeInsets.all(10),
                  itemBuilder: (context, index) {
                    return Card(
                      clipBehavior: Clip.antiAlias,
                      color: mainColor_2.withOpacity(0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/image1.jpg',
                              width: 150,
                              fit: BoxFit.fitWidth,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Heart Health',
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: mainColor_3,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      'Tip for having healthy heart',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: mainColor_3.withOpacity(0.7),
                                      ),
                                      textAlign: TextAlign.left,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  width: double.infinity,
                  color: mainColor_1,
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'Health Tips',
                    style: TextStyle(
                      color: mainColor_3,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'View More >>',
                    style: TextStyle(
                      fontSize: 20,
                      color: mainColor_3,
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Future<void> pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    imageFile = pickedImage != null ? File(pickedImage.path) : null;
    imageFile != null ? cropImage() : null;
  }

  Future<void> cropImage() async {
    File? croppedFile = await ImageCropper().cropImage(
        sourcePath: imageFile!.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: mainColor_1,
            toolbarWidgetColor: mainColor_3,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: const IOSUiSettings(
          title: 'Cropper',
        ));
    if (croppedFile != null) {
      setState(() {
        imageFile = croppedFile;
      });
      // ignore: avoid_print
      print(imageFile);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: const [
              // DrawerHeader(
              //   decoration: BoxDecoration(
              //     color: mainColor_2,
              //   ),
              //   child: const Text('Drawer Header'),
              // ),
              // ListTile(
              //   title: const Text('Item 1'),
              //   onTap: () {
              //     // Update the state of the app.
              //     // ...
              //   },
              // ),
              // ListTile(
              //   title: const Text('Item 2'),
              //   onTap: () {
              //     // Update the state of the app.
              //     // ...
              //   },
              // ),
            ],
          ),
        ),
        body: BodyWidget(
          isDrawerBtn: true,
          isBackBtn: false,
          bacgroundImg: 'assets/back/home.jpg',
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ScanButtonWidget(
                btnName: 'Scan Nutrition Label',
                onPressed: () async {
                  await pickImage();
                },
                logoImage: 'assets/google.png',
              ),
              const SizedBox(
                height: 40,
              ),
              ScanButtonWidget(
                btnName: 'Scan Ingradients Label',
                onPressed: () async {
                  await pickImage();
                },
                logoImage: 'assets/google.png',
              ),
              const SizedBox(
                height: 60,
              ),
              imageFile != null
                  ? Image.file(
                      imageFile!,
                      fit: BoxFit.contain,
                      height: 200,
                      width: double.infinity,
                    )
                  : Container(),
              const SizedBox(
                height: 60,
              ),
            ],
          ),
          // childBottom: Container(
          //   width: double.infinity,
          //   color: mainColor_1.withOpacity(0.5),
          //   child: Column(
          //     children: [
          //       Container(
          //         width: double.infinity,
          //         color: mainColor_1,
          //         padding: const EdgeInsets.all(10),
          //         child: Text(
          //           'Health Tips',
          //           style: TextStyle(
          //             color: mainColor_3,
          //             fontSize: 25,
          //           ),
          //         ),
          //       ),
          //       const SizedBox(
          //         height: 20,
          //       ),
          //       ListView.builder(
          //         shrinkWrap: true,
          //         itemCount: 2,
          //         controller: ScrollController(),
          //         padding: const EdgeInsets.all(10),
          //         itemBuilder: (context, index) {
          //           return Card(
          //             clipBehavior: Clip.antiAlias,
          //             color: mainColor_2.withOpacity(0.5),
          //             shape: RoundedRectangleBorder(
          //               borderRadius: BorderRadius.circular(30),
          //             ),
          //             child: SizedBox(
          //               width: double.infinity,
          //               child: Row(
          //                 mainAxisAlignment: MainAxisAlignment.start,
          //                 crossAxisAlignment: CrossAxisAlignment.center,
          //                 children: [
          //                   Image.asset(
          //                     'assets/image1.jpg',
          //                     width: 150,
          //                     fit: BoxFit.fitWidth,
          //                   ),
          //                   Expanded(
          //                     child: Padding(
          //                       padding: const EdgeInsets.all(10),
          //                       child: Column(
          //                         mainAxisAlignment: MainAxisAlignment.center,
          //                         crossAxisAlignment: CrossAxisAlignment.center,
          //                         children: [
          //                           Text(
          //                             'Heart Health',
          //                             style: TextStyle(
          //                               fontSize: 25,
          //                               color: mainColor_3,
          //                             ),
          //                             overflow: TextOverflow.ellipsis,
          //                           ),
          //                           Text(
          //                             'Tip for having healthy heart',
          //                             style: TextStyle(
          //                               fontSize: 20,
          //                               color: mainColor_3.withOpacity(0.7),
          //                             ),
          //                             textAlign: TextAlign.left,
          //                             maxLines: 1,
          //                             overflow: TextOverflow.ellipsis,
          //                           ),
          //                         ],
          //                       ),
          //                     ),
          //                   )
          //                 ],
          //               ),
          //             ),
          //           );
          //         },
          //       ),
          //       TextButton(
          //         onPressed: () {},
          //         child: Text(
          //           'View More >>',
          //           style: TextStyle(
          //             fontSize: 20,
          //             color: mainColor_3,
          //           ),
          //         ),
          //       )
          //     ],
          //   ),
          // ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: openBottomSheet,
          child: const Icon(
            Icons.history,
            size: 30,
          ),
        ),
      ),
    );
  }
}
