import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';

import './view_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String kode = "";
  var getKode;
  Future scanBarcode() async {
    getKode = await BarcodeScanner.scan();
    setState(() {
      kode = getKode.rawContent;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Belajar QR Code"),
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Container(
            height: 10,
            decoration: BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16.0),
                bottomRight: Radius.circular(16.0),
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Image.network(
              "https://images.vexels.com/media/users/3/158234/isolated/preview/bc63162077f64a543a298cc32ca84dd6-smartphone-barcode-scan-by-vexels.png"),
          SizedBox(
            height: 10.0,
          ),
          FlatButton(
            onPressed: () {
              scanBarcode();
            },
            child: Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(
                  child: Text(
                    "Scan Barcode",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
            ),
          ),
          FlatButton(
            onPressed: kode == ""
                ? () {}
                : () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WebScreen(kode),
                      ),
                    );
                  },
            child: Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: kode == ""
                      ? Text(
                          "Hasil",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                          ),
                        )
                      : Text(
                          kode,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 16,
                          ),
                        ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
