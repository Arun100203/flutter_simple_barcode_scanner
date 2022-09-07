import 'package:flutter/material.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';
//import 'package:webview_flutter/webview_flutter.dart';

void main() {      //like in c
  runApp(const MyApp());  //myapp is a stateless widget which contains title and homepage widget
}

class MyApp extends StatelessWidget {    //myapp widget is a stateless widget that must override build method
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {   //build method return material app which is an another widget
    return MaterialApp(
      title: 'Flutter Demo',   // specifies title
      theme: ThemeData(
        primarySwatch: Colors.blue,  //specifies theme colour
      ),
      home: const HomePage(),    //home contains homepage widget
    );
  }
}

class HomePage extends StatefulWidget {   //it is a stateful widget
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState(); //stateful widget must override state method
}

class _HomePageState extends State<HomePage> {   //state
  String result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            ElevatedButton(
              onPressed: () async {
                var res = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SimpleBarcodeScannerPage(),
                    ));
                setState(() {
                  if (res is String) {
                    result = res;
                  }
                });
              },
              child: const Text('Open Scanner'),
            ),
            Text('Barcode Result: $result'),
          ],
        ),
      ),
    );
  }
}