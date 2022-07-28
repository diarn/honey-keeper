import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanController extends GetxController {
  Barcode? result;
  QRViewController? qrViewController;
  RxBool isTapped = false.obs;
  RxString scanValue = "".obs;
  RxString scanSource = "".obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  onQRViewCreate(QRViewController newQRViewController) {
    this.qrViewController = newQRViewController;
    qrViewController!.scannedDataStream.listen((event) {
      result = event;
      if (result != null) {
        qrViewController!.pauseCamera();
        scanValue.value = result!.code!;
        scanValue.refresh();
        scanSource.value = describeEnum(result!.format);
        scanSource.refresh();
      }
    });
  }
}
