import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as sysPaths;

class ImageInput extends StatefulWidget {
  final Function onSelectedImage;

  const ImageInput({this.onSelectedImage});

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storedImage;

  Future<void> _takePicture([bool flag]) async {
    final picker = ImagePicker();
    final imageFile = await picker.getImage(
      source: flag ? ImageSource.gallery : ImageSource.camera,
      maxHeight: 600,
      maxWidth: 600,
      preferredCameraDevice: CameraDevice.front, //default rear
    );
    setState(() {
      _storedImage = File(imageFile.path);
    });
    final Directory appDir = await sysPaths.getApplicationDocumentsDirectory();
    final String fileName = path.basename(imageFile.path); //get name of file
    final File savedImage = await _storedImage
        .copy('${appDir.path}/$fileName'); //save file to directory
    widget.onSelectedImage(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FlatButton(
          onPressed: () => _takePicture(true),
          child: Container(
            width: 150,
            height: 100,
            decoration:
                BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
            child: _storedImage != null
                ? Image.file(
                    _storedImage,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  )
                : Text(
                    'No Image taken click to choose from gallery',
                    textAlign: TextAlign.center,
                  ),
            alignment: Alignment.center,
          ),
        ),
        SizedBox(width: 10.0),
        Expanded(
          child: FlatButton.icon(
            icon: Icon(Icons.camera),
            label: Text('Take Picture'),
            textColor: Theme.of(context).primaryColor,
            onPressed: () => _takePicture(false),
          ),
        ),
      ],
    );
  }
}
