import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_scanner_overlay/qr_scanner_overlay.dart';

class QrScanner extends StatefulWidget {
  const QrScanner({super.key});

  @override
  State<QrScanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  MobileScannerController controller = MobileScannerController();
  bool isFlashOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(CupertinoIcons.chevron_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("Back"),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isFlashOn = !isFlashOn;
              });
              controller.toggleTorch();
            },
            icon: Icon(
              Icons.flashlight_on_outlined,
              color: Colors.white,
            )
          ),
          SizedBox(width: 10.w,),
        ],
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/aurora-background.png"), fit: BoxFit.cover)
                  ),
                  width: double.infinity,
                  padding: EdgeInsets.only(bottom: 20.h),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Scan QR Code',
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Stack(
                  children: [
                    // menggunakan plugin mobile_scanner
                    MobileScanner(
                      controller: controller,
                      onDetect: (capture) {
                        // do something
                        final List<Barcode> barcodes = capture.barcodes;
                        final Uint8List? image = capture.image;
                        for (final barcode in barcodes) {
                          debugPrint('Barcode found! ${barcode.rawValue}');
                          AlertDialog alert = AlertDialog(
                            title: Text("Scanned Data"),
                            content: Container(
                              child: Text(
                                  'Data: ${barcode.rawValue}',
                              ),
                            ),
                            actions: [
                              TextButton(
                                child: Text('Ok'),
                                onPressed: () => Navigator.of(context).pop(),
                              ),
                            ],
                          );

                          showDialog(context: context, builder: (context) => alert);
                          return;
                        }
                      },
                    ),
                    QRScannerOverlay(overlayColor: Colors.transparent,)
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );;
  }
}

