import 'package:d_stack/d_stack.dart';
import 'package:d_stack/observer/life_cycle_observer.dart';
import 'package:flutter/material.dart';
import 'package:d_stack/widget/home_widget.dart';
import 'package:fluzedlol/ui/page/login/login_page.dart';
import 'package:fluzedlol/ui/page/lol_main_page.dart';


void main() {
  // 注册路由builder , 生命周期监听
  WidgetsFlutterBinding.ensureInitialized();
  DStack.instance.register(
      builders: RouterBuilder.builders(), observer: MyLifeCycleObserver());
  runApp(MyApp());
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
    return MaterialApp(
      navigatorKey: DStack.instance.navigatorKey,
      navigatorObservers: [DStack.instance.dStackNavigatorObserver],
      home: DStackWidget(homePage: LolMainPage()),
    );
  }
}

class RouterBuilder {
  static Map<String, DStackWidgetBuilder> builders() {
    Map<String, DStackWidgetBuilder> builders = {
      'login/': loginBuilder
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
    debugPrint("MyLifeCycleObserver  appDidEnterBackground == ${model.currentPageRoute}");
  }

  @override
  void appDidEnterForeground(PageModel model) {
    debugPrint("MyLifeCycleObserver  appDidEnterForeground == ${model.currentPageRoute}");
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