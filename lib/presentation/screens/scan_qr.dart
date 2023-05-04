// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smarket_app/data/repository/auth_qr.dart';
import '../../data/models/get_msg.dart';
import 'cart_produt.dart';
import 'not_found_qr.dart';

class ScanQRCode extends StatefulWidget {
  const ScanQRCode({super.key});

  @override
  ScanQRCodeState createState() => ScanQRCodeState();
}

class ScanQRCodeState extends State<ScanQRCode> {
  saveQr(String qr) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('qr', qr);
  }

  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  int userId = 0;
  getUseId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? id = prefs.getInt('id');
    setState(() {
      userId = id!;
    });
  }

  @override
  void initState() {
    super.initState();
    getUseId();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(flex: 10, child: _buildQrView(context)),

          // if (result != null && result!.code == "test")
          //   InkWell(
          //     onTap: () {
          // Navigator.of(context).pushReplacement(MaterialPageRoute(
          //   builder: (context) => const CartProduct1(),
          // ));
          //     },
          //     child: Text(
          //         'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}'),
          //   )
          // else
          //   const Text('Scan a code'),
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    //check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;

    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: const Color(0xff2c6976),
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() async {
        result = scanData;
        GetMsg data = await authQr(result!.code.toString(), userId);
        if (data.message == "Account connected Successfully!") {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const CartProduct1(),
          ));
          saveQr(result!.code.toString());
          // print(result!.code.toString());
        } else {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const NotFoundCode(),
          ));
        }
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const NotFoundCode(),
      ));
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
