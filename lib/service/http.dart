import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/foundation.dart';
import '../config/storage_manager.dart';
import '../service/base_api.dart';

final Http http = Http();

class Http extends BaseHttp {
  @override
  void init() {
    options.baseUrl = "https://www.fastmock.site/mock/8621b3987a3543d80e8614226785b46a/zedlol";
    // cookie持久化 异步
    //一般我们的项目中登录接口调用成功后，后端会在cookie中写入token，所以登录请求前先建立CookieManager来自动管理cookie
    //CookieJar将cookie保存在RAM中，因此，如果应用程序退出，则将清除所有cookie。
    //于是，改为使用下面的PersistCookieJar。
    //PersistCookieJar将cookie保存在文件中，因此，如果应用程序退出，则cookie始终存在，除非显式调用delete。

    //https://blog.csdn.net/sinat_34245894/article/details/112308286    localstorage
    interceptors
      ..add(ApiInterceptors())
      ..add(CookieManager(PersistCookieJar(dir: StorageManager.temporaryDirectory.path)));
  }
}

class ApiInterceptors extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) async {
    debugPrint('---api-request--->url--> ${options.baseUrl}${options.path}' +
        ' queryParameters: ${options.queryParameters}');
    return options;
  }
  @override
  Future onResponse(Response response) {
    ResponseData responseData = ResponseData.fromJson(response.data);
    if (responseData.isSuccess) {
      //todo 这段代码不太明白什么意思
      response.data = responseData.data;
      return http.resolve(response);
    } else {
      if (responseData.code == -1001) {
        // 如果cookie过期,需要清除本地存储的登录信息
        // StorageManager.localStorage.deleteItem(UserModel.keyUser);
        throw const UnAuthorizedException();// 需要登录
      } else {
        throw FailException.fromRespData(responseData);
      }
    }
  }
}

class ResponseData extends BaseResponseData {
  bool get isSuccess => code == 0;
  ResponseData.fromJson(Map <String, dynamic> json) {
    code = json["code"];
    msg = json["msg"];
    data = json["data"];
  }
}