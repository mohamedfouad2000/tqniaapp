import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewWidget extends StatelessWidget {
  const PdfViewWidget({super.key, required this.link});
  final String link;

  @override
  Widget build(BuildContext context) {
    print(link);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
              size: 20,
              color: Colors.black,
            ),
          ),
        ),
        body: Container(child: SfPdfViewer.network(link)));
  }
}
