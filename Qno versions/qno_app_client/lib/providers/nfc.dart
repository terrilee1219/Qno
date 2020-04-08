import 'package:nfc_in_flutter/nfc_in_flutter.dart';
import 'dart:async';

class NFCReader{

  bool _isNfcSupported = false;

  void readNFC(){
  //Opens a Listening Stream for the device
  Stream<NDEFMessage> stream = NFC.readNDEF();

  //Manage a tap on a tag
  print('Opening NFC Stream');
  stream.listen((NDEFMessage message) {
  String result = '${message.payload}'.substring(2); //Substring to remove 'en' from tag payload message. i.e enTagTapped -> TagTapped
  print(result);
  });
  }

  //Check to see if Device Supports NFC
  Future<void> setNfcSupport() async {
    await NFC.isNDEFSupported
        .then((bool isSupported) {
      _isNfcSupported = isSupported;
    });
  }

  //Returns true if device supports NFC
  Future<bool> getNfcSupport() async{
    await setNfcSupport();
    return _isNfcSupported;
  }
}

