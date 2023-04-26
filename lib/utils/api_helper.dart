import 'package:http/http.dart' as http;

class ApiHelper {
  Future<String> postApiCall(String name, String job) async {
    String? apiLink = "https://reqres.in/api/users";
    Uri uri = Uri.parse(apiLink);
    var response = await http.post(uri, body: {"name": name, "job": job});

    if (response.statusCode == 201) {
      return "Success";
    }
    return"failed";
    }
}