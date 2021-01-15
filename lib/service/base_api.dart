import 'dart:convert';
import 'package:dio/native_imp.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
export 'package:dio/dio.dart';

import '../util/platform_util.dart';

/// https://blog.csdn.net/email_jade/article/details/88941434
/// async 仍旧是在这个UI线程，仍会阻塞UI的刷新，异步只是在同一个线程的并发操作
/// 但是由于dart中的Isolate比较重量级，UI线程和Isolate中的数据的传输比较复杂，因此flutter为了简化用户代码，在foundation库中封装了一个轻量级compute操作，我们先看看compute，然后再来看Isolate。
/// 要使用compute，必须注意的有两点，一是我们的compute中运行的函数，必须是顶级函数或者是static函数，二是compute传参，只能传递一个参数，返回值也只有一个

_parseAndDecode(String response) => jsonDecode(response);

parseJson(String resp) => compute(_parseAndDecode, resp);

abstract class BaseHttp extends DioForNative {
  BaseHttp() {
    /// 初始化 加入app通用处理
    (transformer as DefaultTransformer).jsonDecodeCallback = parseJson;
    interceptors..add(HeaderInterceptor());
    init();
  }

  void init();
}

/// 添加常用header
class HeaderInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) async {
    options.connectTimeout = 50 * 1000;
    options.receiveTimeout = 50 * 1000;

    var appVersion = await PlatformUtil.getAppVersion();
    var version = Map()..addAll({"appVersion": appVersion});
    options.headers["version"] = version;
    options.headers['platform'] = Platform.operatingSystem;
    return options;
  }
}

/// 子类需要重写
abstract class BaseResponseData {
  int code = 0;
  String msg;
  dynamic data;

  bool get isSuccess;

  BaseResponseData({this.code, this.msg, this.data});

  @override
  String toString() => 'BaseRespData{code: $code, msg: $msg, data: $data}';
}

/// 用于未登录等权限不够,需要跳转授权界面
class UnAuthorizedException implements Exception {
  const UnAuthorizedException();

  @override
  String toString() => 'UnAuthorizedException';
}

/// 接口请求失败
class FailException implements Exception {
  String msg;

  FailException.fromRespData(BaseResponseData respData) {
    msg = respData.msg;
  }

  @override
  String toString() {
    return 'FailException{respData: $msg}';
  }
}
