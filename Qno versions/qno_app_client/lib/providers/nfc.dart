import 'package:nfc_in_flutter/nfc_in_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'dart:async';
class NFCReader{

  bool _isNfcSupported = false;
  Stream<NDEFMessage> _stream;
  String _nfcMessage;

  //Read a NFC tag when app is opened
  void readNFC(){
  //Opens a NFC Listening Stream for the device
    _stream = NFC.readNDEF();

  //Manage a tap on a tag
    _stream.listen((NDEFMessage message) {
  String result = '${message.payload}'.substring(2); //Substring to remove 'en' from tag payload message. i.e enTagTapped -> TagTapped
  setNfcMessage(result);
    print(_nfcMessage);
  connectToServer();
  });
  }

  //Check to see if device supports NFC
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

  //Connect to server when tag tapped

  Future<void> connectToServer() async{
    const url = "https://qno-technologies.firebaseio.com/hello_msg.json";

    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body);
      if (extractedData == null) {
        return;
      }

      //Print Message from server
      print('Extracted Data: $extractedData');
    } catch (error) {
      print('Error: $error');
    }
  }

  //Set the nfcMessage from tapped tag
  void setNfcMessage(String val){
    _nfcMessage = val;
  }

}

