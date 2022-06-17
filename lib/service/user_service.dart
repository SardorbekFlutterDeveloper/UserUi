

import 'package:dio/dio.dart';
import 'package:exam_test/models/user_model.dart';


class ServiceUser {
  static Future<UserModel> getUsersinHive() async {
    Response res =
        await Dio().get("https://jsonplaceholder.typicode.com/users");

    
  
    return UserModel.fromJson(res.data);
  }
}


