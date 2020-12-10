import 'package:flutter/material.dart';
import 'package:fluzedlol/provider/provider_widget.dart';
import 'package:fluzedlol/ui/page/home/campaign_page.dart';
import 'package:fluzedlol/ui/page/home/recommend_page.dart';
import 'package:fluzedlol/ui/page/home/video_page.dart';
import 'package:fluzedlol/viewmodel/scroll_controller_view_model.dart';
import 'package:fluzedlol/widget/custom_tab_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _currentIndex = _tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double headerHeight = 70.0;
    return ProviderWidget<TapToTopViewModel>(
      // 使用PrimaryScrollController保留iOS点击状态栏回到顶部的功能
      model: TapToTopViewModel(PrimaryScrollController.of(context),
          height: headerHeight - kToolbarHeight),
      onModelReady: (tapToTopViewModel) {
        tapToTopViewModel.init();
      },
      builder: (context, tapToTopViewModel, child) {
        return Scaffold(
            backgroundColor: Colors.transparent,
            body: MediaQuery.removePadding(
                context: context,
                removeTop: false,
                child: NestedScrollView(
                    controller: tapToTopViewModel.scrollController,
                    headerSliverBuilder: (BuildContext context,
                            bool innerBoxIsScrolled) =>
                        <Widget>[
                          // SliverToBoxAdapter(),
                          SliverAppBar(
                              // 加载中并且亮色模式下,状态栏文字为黑色
                              brightness: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? Brightness.light
                                  : Brightness.dark,
                              // actions: <Widget>[
                              //   EmptyAnimatedSwitcher(
                              //     display: tapToTopModel.showTopBtn,
                              //     child: IconButton(
                              //       icon: Icon(Icons.search),
                              //       onPressed: () {
                              //         showSearch(
                              //             context: context,
                              //             delegate: DefaultSearchDelegate());
                              //       },
                              //     ),
                              //   ),
                              // ],
                              // flexibleSpace: FlexibleSpaceBar(
                              //   background: BannerWidget(),
                              //   centerTitle: true,
                              //   title: GestureDetector(
                              //     onDoubleTap: tapToTopModel.scrollToTop,
                              //     child: EmptyAnimatedSwitcher(
                              //       display: tapToTopModel.showTopBtn,
                              //       child: Text(Platform.isIOS
                              //           ? 'Fun Flutter'
                              //           : S.of(context).appName),
                              //     ),
                              //   ),
                              // ),
                              leading: Builder(builder: (BuildContext context) {
                                return Icon(Icons.menu, color: Colors.deepPurple);
                              }),
                              backgroundColor: Colors.white,
                              // title: Center(child: Text("Zedlol")),
                              expandedHeight: headerHeight,
                              pinned: true,
                              floating: true,
                              bottom: TabBar(
                                  indicator: RoundUnderlineTabIndicator(
                                      borderSide: BorderSide(
                                        width: 4.0,
                                        color: Colors.deepPurple,
                                      ),
                                      insets: EdgeInsets.only(top: 3)),
                                  tabs: <Widget>[
                                    VgTab(text: "推荐"),
                                    VgTab(text: "视频"),
                                    VgTab(text: "活动")
                                  ],
                                  unselectedLabelColor:
                                      Color.fromARGB(255, 153, 153, 153),
                                  labelPadding:
                                      EdgeInsets.only(left: 0, right: 0),
                                  unselectedLabelStyle: TextStyle(fontSize: 13),
                                  labelStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                  labelColor: Color.fromARGB(255, 51, 51, 51),
                                  controller: _tabController,
                                  indicatorSize: TabBarIndicatorSize.label))
                        ],
                    body: TabBarView(
                        controller: _tabController,
                        children: <Widget>[RecommendPage(), VideoPage(), CampaignPage()]))));
      },
    );
  }
}
