import 'dart:io';

import 'package:dio_example_n6/data/api_service/upload_api_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class UploadFileToServer extends StatefulWidget {
  const UploadFileToServer({Key? key}) : super(key: key);

  @override
  State<UploadFileToServer> createState() => _UploadFileToServerState();
}

class _UploadFileToServerState extends State<UploadFileToServer> {
  String status = "";
  File? file;

  Future<File?> selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      return File(result.files.single.path!);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload file"),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () async {
                File? f = await selectFile();
                if (f != null) {
                  file = f;
                  String st =
                      await UploadApiService.uploadProfileImage(file: f);
                  setState(() {
                    status = st;
                  });
                }
              },
              child: const Text("Select file")),
          ElevatedButton(onPressed: () {}, child: const Text("Upload  file")),
          Text(
            status,
            style: const TextStyle(fontSize: 40, color: Colors.tealAccent),
          ),
          file!=null? Image.file(file!):SizedBox(),
        ],
      ),
    );
  }
}
