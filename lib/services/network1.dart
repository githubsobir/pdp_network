import 'dart:convert';
import 'package:http/http.dart';
import 'package:pdp_network/models/post.dart';

class Network1 {

  static String BASE = "dummy.restapiexample.com/api/v1";
  static Map<String, String> headers = {
    "Content-type": "application/json;charset=utf-8",
  };

  //*Http Apis
  static String API_LIST = "/employees";
  static String API_LIST2 = "/employees";//{id}
  static String API_CREATE = "/create";
  static String API_UPDATE = "/update"; //{id}
  static String API_DELETE = "/delete"; //{id }

  //*Http Request


  // ignore: non_constant_identifier_names
  static Future<String> GET(String api, Map<String, String> params) async {
    print(">>>SALOM");
    print(BASE+api);
    var uri = Uri.http(BASE, api); // http or https
    print(">>>SALOM2");
    var response = await get(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }


  //Post
  static Future<String> POST(String api, Map<String, String> params) async {
    var uri = Uri.http(BASE, api);
    var response = await post(uri, headers: headers, body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    } else {
      return null;
    }
  }

  //Put
  static Future<String> PUT(String api, Map<String, String> params) async {
    var uri = Uri.http(BASE, api);
    var response = await put(uri, headers: headers, body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    } else {
      return null;
    }
  }

  //*Http DEL
  static Future<String> DEL(String api, Map<String, String> params) async {
    var uri = Uri.http(BASE, api, params);
    var response = await delete(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }

  static Map<String, String> paramsEmpty() {
    Map<String, String> params = new Map();
    return params;
  }

  static Map<String, String> paramsCreate(Post post) {
    Map<String, String> params = new Map();
    params.addAll({

      'name': post.employeeName,
      'salary': post.employeeSalary.toString(),
      'age': post.employeeAge.toString(),
      // 'profile_image': post.profileImage.toString(),
    });
    return params;
  }

  static Map<String, String> paramsUpdate(Post post) {
    Map<String, String> params = new Map();
    params.addAll({

      'name': post.employeeName,
      'salary': post.employeeSalary.toString(),
      'age': post.employeeAge.toString(),
      // 'profile_image': post.profileImage.toString(),
    });
    return params;
  }
}
