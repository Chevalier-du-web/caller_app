import 'dart:io';
import 'package:pdf/widgets.dart' show PdfImage;

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;



class DocumentScannerPage extends StatefulWidget {
  @override
  _DocumentScannerPageState createState() => _DocumentScannerPageState();
}

class _DocumentScannerPageState extends State<DocumentScannerPage> {
  List<File> scannedImages = [];

  Future<void> _scanDocument() async {
    final ImagePicker picker = ImagePicker();
    final pickedFile = await  picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        scannedImages.add(File(pickedFile.path));
      });
    }
  }

  Future<void> _generatePDF() async {
    final pdf = pw.Document();

    for (var imageFile in scannedImages) {
      final image = PdfImage.file(
        pdf.document,
        bytes: imageFile.readAsBytesSync(),
      );
      pdf.addPage(pw.Page(
        build: (pw.Context context) {
          return pw.Image(image as pw.ImageProvider);
        },
      ));
    }



  final output = await getTemporaryDirectory();
    final file = File('${output.path}/scanned_document.pdf');
    await file.writeAsBytes(await pdf.save());

    // Open the generated PDF file using your preferred PDF viewer
    // (Note: This example opens the PDF using the default PDF viewer on the device)
    // You can use other packages like 'open_file' to handle this more gracefully.
    // Note: Make sure to add the 'open_file' package to your pubspec.yaml file.
    // For example:
    // dependencies:
    //   open_file: ^4.0.2
    // Import the package in your Dart file: import 'package:open_file/open_file.dart';
    // Then, open the file using: OpenFile.open(file.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scanner de documents'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: scannedImages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.file(
                    scannedImages[index],
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: _scanDocument,
            child: Text('Scanner un document'),
          ),
          ElevatedButton(
            onPressed: _generatePDF,
            child: Text('Générer le PDF'),
          ),
        ],
      ),
    );
  }
}
