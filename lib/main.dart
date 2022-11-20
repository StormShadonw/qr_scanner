import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_scanner/pages/scan_qr_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: {
        ScanQRPage.routeName: (context) => ScanQRPage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Object? _barCodeResult;

  Future<void> pushToQRScanner() async {
    var result = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ScanQRPage()));
    setState(() {
      _barCodeResult = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  pushToQRScanner();
                },
                child: const Text("Scan QR Code"),
              ),
            ),
            if (_barCodeResult != null)
              Container(
                child: Text("$_barCodeResult"),
              ),
          ],
        ),
      ),
    );
  }
}
