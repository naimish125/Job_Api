import 'package:flutter/material.dart';

import '../../../utils/api_helper.dart';

class HomeProvider extends ChangeNotifier {
  Future<String> postApi(String name, String job) async {
    ApiHelper apiHelper = ApiHelper();
    String msg = await apiHelper.postApiCall(name, job);
    return msg;
    }
}