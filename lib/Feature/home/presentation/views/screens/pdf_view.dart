// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// class PdfViewScreen extends StatefulWidget {
//   const PdfViewScreen({super.key, required this.filename});
//   final String filename;

//   @override
//   State<PdfViewScreen> createState() => _PdfViewScreenState();
// }

// class _PdfViewScreenState extends State<PdfViewScreen> {
//   final Uri _url = Uri.parse('https://flutter.dev');

//   String? localFile ='https://system.tqnia.me/files/timeline_files/note_file65cb491f8f3f6-WhatsApp-Image-2024-01-13-at-10.07.52-AM.jpeg';
//   @override
//   void initState() {
//     // loadFile().then((value) {
//     //   localFile = value;
//     // });
//     // TODO: implement initState
//     super.initState();
//   }

//   // Future<String> loadFile() async {
//   //   final String url='https://system.tqnia.me/files/timeline_files/note_file65cb491f8f3f6-WhatsApp-Image-2024-01-13-at-10.07.52-AM.jpeg';
//   //   var res = await http.get(Uri.file(url));
//   //   var dir = await getTemporaryDirectory();
//   //   File file = new File(dir.path + "/data.pdf");
//   //   await file.writeAsBytes(res.bodyBytes, flush: true);
//   //   return file.path;
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Container(
//         child: TextButton(
//   onPressed: () async {
//       const url = 'https://blog.logrocket.com';

//     },
//     child: const Text(
//        'Open a URL',
//     ),
// ),),
//     );
//   }
// }
