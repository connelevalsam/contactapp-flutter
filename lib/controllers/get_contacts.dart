

import 'package:thecontactproject/controllers/base.dart';

class GetContacts {
  Future<dynamic> getAll() async {
    Map<String, String> header = {
      "Accept": "application/json",
      "Content-type": "application/json"
    };
    var results = await APIBaseClass()
        .getRequest("http://192.168.42.141:3000/api/getAllContacts");

    print("============results: $results===========\n\n");
    return results;
  }
}