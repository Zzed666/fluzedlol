import 'package:flutter/material.dart';
import 'package:fluzedlol/provider/provider_widget.dart';
import 'package:fluzedlol/ui/helper/refresh_helper.dart';
import 'package:fluzedlol/viewmodel/recommend_view_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RecommendPage extends StatefulWidget {
  @override
  _RecommendPageState createState() => _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<RecommendViewModel>(
        model: RecommendViewModel(),
        onModelReady: (recommendViewModel) {
          recommendViewModel.initData();
        },
        builder: (context, recommendViewModel, child) {
          return Container(
              color: Colors.transparent,
              child: SmartRefresher(
                  controller: recommendViewModel.refreshController,
                  header: RefreshHeader(),
                  footer: RefresherFooter(),
                  enablePullUp: recommendViewModel.list.isNotEmpty,
                  enablePullDown: recommendViewModel.list.isNotEmpty,
                  onRefresh: () async {
                    await recommendViewModel.refresh();
                  },
                  onLoading: recommendViewModel.loadMore,
                  child: ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Text("123");
                      },
                      separatorBuilder: (context, position) {
                        return Container(
                            height: 5,
                            color: Colors.lightBlue,
                            margin: EdgeInsets.only(left: 15.0, right: 15.0));
                      },
                      itemCount: 100)));
        });
  }
}
