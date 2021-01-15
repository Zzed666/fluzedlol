import 'package:fluzedlol/model/test_model.dart';

import '../service/http.dart';

class ZedLolRepository {
  static Future test() async {
    var response = await http.get("/api/getMainAccountInfo",queryParameters: {"accountNumber":"111111111"});
    return TestModel.fromJson(response.data);
  }
}