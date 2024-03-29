import 'dart:async';
import 'package:http/http.dart' as http;

/// Logic component to manage the contacts form
class ContactForm {
  /// Funciton to send the contact form inserted text to the server that return
  /// ```null``` if no error occur or return ```Error``` string if an error occur
  static Future<String?> postData({
    required String text,
  }) async {
    if (text == "") return null;

    var serverEndpoint = 'https://portfolio.marcotammaro.it/messages';
    var uri = Uri.parse(serverEndpoint);

    var body = Map<String, dynamic>();
    body['text'] = Uri.encodeComponent(text);

    try {
      http.Response res = await http.post(uri, body: body);
      if (res.body == "OK")
        return null;
      else
        return "Error";
    } catch (err) {
      return "Error";
    }
  }
}
