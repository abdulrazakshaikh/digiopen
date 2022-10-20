import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerUtil {
  static void showPicker(context, Function image) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    margin: EdgeInsets.only(top: 10),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Select Source',
                      style: Theme.of(context).textTheme.headline2?.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "RobotoRegular"),
                    ),
                  ),
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () async {
                        File filePath = await getImage("Gallery");
                        print(filePath);
                        image(filePath);
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () async {
                      File filePath = await getImage("Camera");
                      print(filePath);
                      image(filePath);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  static Future getImage(
    String source,
  ) async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(
        imageQuality: 10,
        source: source == "Camera" ? ImageSource.camera : ImageSource.gallery);

    if (pickedFile != null) {
      //image = File(pickedFile.path);
      return File(pickedFile.path);
      // image();
      //print(AppUtils.imageToBase64(pickedFile.path));
      //print(pickedFile.path);
    } else {
      print('No image selected.');
      return null;
    }
  }
}
