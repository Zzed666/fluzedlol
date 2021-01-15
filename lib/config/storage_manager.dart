import 'dart:io';
import 'package:localstorage/localstorage.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';

class StorageManager {
  /// app全局配置 eg:theme
  static SharedPreferences sharedPreferences;

  /// 临时目录 eg: cookie
  static Directory temporaryDirectory;

  /// 初始化必备操作 eg:user数据
  static LocalStorage localStorage;

  ///基础目录
  static String baseDirectory;

  /// 必备数据的初始化操作
  ///
  /// 由于是同步操作会导致阻塞,所以应尽量减少存储容量
  static init() async {
    // async 异步操作
    // sync 同步操作
    temporaryDirectory = await getTemporaryDirectory();
    sharedPreferences = await SharedPreferences.getInstance();
    localStorage = LocalStorage('LocalStorage');
    await localStorage.ready;

    // 获取本地文档目录
    // if (Platform.isAndroid) {
    //   //获取安卓路径
    //   PackageInfo packageInfo = await PackageInfo.fromPlatform();
    //   FlutterFilePathProvider.instance.getExternalStorageDirectory().then((result) {
    //     if (result.code == 0) {
    //       baseDirectory = result.directory.path + "base/${packageInfo.packageName}";
    //
    //       //创建一个图片文件夹
    //       String imgPath = baseDirectory + "/images";
    //
    //     }
    //   });
    // } else {
    //   //获取iOS路径
    //   baseDirectory = (await getApplicationDocumentsDirectory()).path;
    //
    //   //创建一个图片文件夹
    //   String imgPath = baseDirectory + "/images";
    // }
  }
}