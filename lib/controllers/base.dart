import 'dart:convert';

import 'package:http/http.dart' as http;

class APIBaseClass {
  Future getRequest(
    String url,
  ) async {
    Uri uri = Uri.parse(url);
    var response = await http.get(uri);
    dynamic data = jsonDecode(response.body);
    print("The data - $data=====\n\n");
    return data;
  }

  Future postRequest(String url,
      {String base = "",
      Map<String, dynamic>? extraData,
      Map<String, String>? header}) async {
    Uri uri = Uri.parse(url);
    var response =
        await http.post(uri, headers: header, body: jsonEncode(extraData));
    dynamic data = jsonDecode(response.body);
    print("-x-x- Base data - $data ---");

    return data['status'] == true ? 1 : data;
  }
}
