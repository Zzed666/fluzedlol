import 'package:d_stack/d_stack.dart';
import 'package:d_stack/observer/life_cycle_observer.dart';
import 'package:flutter/material.dart';
import 'package:d_stack/widget/home_widget.dart';
import 'package:flutter/services.dart';
import 'package:fluzedlol/config/provider_manager.dart';
import 'package:fluzedlol/config/router_manager.dart';
import 'package:fluzedlol/config/storage_manager.dart';
import 'package:fluzedlol/ui/page/login/login_page.dart';
import 'package:fluzedlol/ui/page/lol_main_page.dart';
import 'package:fluzedlol/viewmodel/locale_view_model.dart';
import 'package:fluzedlol/viewmodel/theme_view_model.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  // 注册路由builder , 生命周期监听
  WidgetsFlutterBinding.ensureInitialized();
  // 强制竖屏
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  DStack.instance.register(
      builders: RouterBuilder.builders(), observer: MyLifeCycleObserver());
  StorageManager.init();
  runApp(MyApp());
  // Android状态栏透明 splash为白色,所以调整状态栏文字为黑色
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OKToast(
        child: MultiProvider(
            providers: providers,
            child: Consumer2<ThemeViewModel, LocaleViewModel>(
                builder: (context, themeViewModel, localeViewModel, child) =>
                    RefreshConfiguration(
                        child: MaterialApp(
                      debugShowCheckedModeBanner: false,
                      // theme: themeModel.themeData(),
                      // darkTheme: themeModel.themeData(platformDarkMode: true),
                      // locale: localeModel.locale,
                      localizationsDelegates: const [
                        // S.delegate,
                        RefreshLocalizations.delegate, //下拉刷新
                        // GlobalCupertinoLocalizations.delegate,
                        // GlobalMaterialLocalizations.delegate,
                        // GlobalWidgetsLocalizations.delegate
                      ],
                      // supportedLocales: S.delegate.supportedLocales,
                      navigatorKey: DStack.instance.navigatorKey,
                      navigatorObservers: [
                        DStack.instance.dStackNavigatorObserver
                      ],
                      home: DStackWidget(homePage: LolMainPage()),
                    )))));
  }
}

class RouterBuilder {
  static Map<String, DStackWidgetBuilder> builders() {
    Map<String, DStackWidgetBuilder> builders = {
      RouterName.login: loginBuilder
    };
    return builders;
  }

  static DStackWidgetBuilder loginBuilder = (Map params) {
    return (BuildContext context) {
      return LoginPage();
    };
  };
}

class MyLifeCycleObserver extends DLifeCycleObserver {
  @override
  void appDidEnterBackground(PageModel model) {
    debugPrint(
        "MyLifeCycleObserver  appDidEnterBackground == ${model.currentPageRoute}");
  }

  @override
  void appDidEnterForeground(PageModel model) {
    debugPrint(
        "MyLifeCycleObserver  appDidEnterForeground == ${model.currentPageRoute}");
  }

  @override
  void appDidStart(PageModel model) {
    debugPrint("MyLifeCycleObserver  appDidStart == ${model.currentPageRoute}");
  }

  @override
  void pageAppear(PageModel model) {
    debugPrint("MyLifeCycleObserver pageAppear model:${model.toString()}");
  }
}
