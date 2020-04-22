import 'package:http/http.dart' as http;
import 'dart:convert';

class NFCReader{

  //Connect to server when tag tapped
  Future<void> connectToServer() async{
    const url = "https://qno-technologies.firebaseio.com/hello_msg.json";
    print("Tag Contect: $tagContent");

    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body);
      if (extractedData == null) {
        print('No Message From Server: $response');
        return;
      }
      print('Message From Server: $response');
    } catch (error) {
      print('Error: $error');
    }
  }
}

