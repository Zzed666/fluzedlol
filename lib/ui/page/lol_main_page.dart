import 'package:flutter/material.dart';
import 'package:fluzedlol/provider/provider_widget.dart';
import 'package:fluzedlol/ui/page/home/home_page.dart';
import 'package:fluzedlol/ui/page/mall/mall_page.dart';
import 'package:fluzedlol/ui/page/moment/moment_page.dart';
import 'package:fluzedlol/ui/page/personal/personal_page.dart';
import 'package:fluzedlol/viewmodel/lol_main_view_model.dart';
import 'package:fluzedlol/widget/custom_with_background_widget.dart';

class LolMainPage extends StatefulWidget {
  @override
  _LolMainPageState createState() => _LolMainPageState();
}

class _LolMainPageState extends State<LolMainPage> {
  FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<LolMainViewModel>(
      model: LolMainViewModel(),
      builder: (context, model, child) => CustomWithBackGroundWidget(
          childWidget: GestureDetector(
              onTap: () => _focusNode.unfocus(),
              child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: IndexedStack(index: model.bottomSelectIndex, children: [
                    HomePage(),
                    MallPage(),
                    MomentPage(),
                    PersonalPage()
                  ]),
                  bottomNavigationBar: BottomAppBar(
                      color: Colors.transparent,
//          shape: CircularNotchedRectangle(),
                      child: LolMainBottomBar(viewModel: model))))),
      autoDispose: true
    );
  }
  @override
  void dispose() {
    _focusNode?.unfocus();
    _focusNode?.dispose();
    super.dispose();
  }
}

class LolMainBottomBar extends StatelessWidget {
  final List<String> bottomBarTextList = ["首页", "商城", "Lu圈", "我的"];
  final List<IconData> bottomBarIconList = [
    Icons.event,
    Icons.shop,
    Icons.memory,
    Icons.restore
  ];
  final LolMainViewModel viewModel;

  LolMainBottomBar({@required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(0, 6, 0, 6),
        child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List<Widget>.generate(4, (index) {
              return GestureDetector(
                  onTap: () {
                    viewModel?.updateBottomSelectIndex(index);
                  },
                  child: Stack(children: [
                    Container(
                        padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                        color: Colors.transparent,
                        width: MediaQuery.of(context).size.width / 4 - 10,
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(bottomBarIconList[index],
                                  color: viewModel.bottomSelectIndex == index
                                      ? Colors.deepOrangeAccent
                                      : Colors.white),
                              Container(
                                  margin: EdgeInsets.only(top: 2.0),
                                  child: Text(bottomBarTextList[index],
                                      style: TextStyle(
                                          fontSize: 11,
                                          color: viewModel.bottomSelectIndex ==
                                                  index
                                              ? Colors.deepOrangeAccent
                                              : Colors.white)))
                            ]))
                  ]));
            })));
  }
}
