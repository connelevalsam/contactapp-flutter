import 'base.dart';

class AddContact {
  Future<dynamic> addAContact() async {
    Map<String, String> header = {
      "Accept": "application/json",
      "Content-type": "application/json"
    };

    Map<String, dynamic> data = {
      'firstname': "John",
      'lastname': "Doe",
      'email': "Jonney@cb.com",
    };
    var results = await APIBaseClass().postRequest(
        "http://192.168.42.141:3000/api/contacts",
        extraData: data,
        header: header);

    print("============results: $results===========\n\n");
    return results;
  }
}
