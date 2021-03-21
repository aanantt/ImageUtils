# ImageUtils
A Flutter plugin for iOS and Android for 
* converting any network, assets or file image to base64 and uint8list
* converting base64 and uint8list to image
## Installation
First, add ``` image_utils_class ``` as a dependency in your pubspec.yaml file.

## Example 
```
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_utils_class/image_utils_class.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final picker = ImagePicker();
  TextEditingController base64;

  @override
  void initState() {
    base64 = TextEditingController(text: '');
    super.initState();
  } 
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              MaterialButton(
                  onPressed: () async {
                    final pickedFile =
                        await picker.getImage(source: ImageSource.gallery);
                    setState(() {
                      if (pickedFile != null) {
                        base64.text =
                            ImageUtils.fileToBase64(File(pickedFile.path));
                      } else {
                        print('No image selected.');
                      }
                    });
                  },
                  child: Text("Select Image")),
              SizedBox(height: 10),
              Text("Base64 String of selected image:${base64.text}"),
              SizedBox(height: 30),
              Text("Base64 to Image:"),
              CircleAvatar(
                radius: 25,
                backgroundImage: ImageUtils.base64ToImage(base64.text),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```
## All Functions of Class


| Function      | Return Value    |
| ------------- |:-------------:|
| ImageUtils.base64ToImage ( String base64String )      | MemoryImage    
| ImageUtils.base64ToUnit8list ( String base64String )      | Uint8List
| ImageUtils.fileToBase64 ( File imgFile )    | Base64String
| ImageUtils.networkImageToBase64 ( String url )|Future of Base64String  
| ImageUtils.assetImageToBase64 ( String path )| Future of Base64String
