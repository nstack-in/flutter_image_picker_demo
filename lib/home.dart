import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ImagePicker _picker = ImagePicker();
  PickedFile _file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Image Picker'),
      ),
      body: ListView(
        children: [
          _file == null
              ? Text(
                  'No Image Selecte',
                )
              : Image.asset(
                  _file.path,
                ),
          RaisedButton(
            onPressed: _openImagePicker,
            child: Text('Open Image Picker'),
          ),
        ],
      ),
    );
  }

  void _openImagePicker() async {
    final _source = ImageSource.camera;
    PickedFile file = await _picker.getImage(source: _source);
    if (file != null) {
      _file = file;
      setState(() {});
    }
  }
}
