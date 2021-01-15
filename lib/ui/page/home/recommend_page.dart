import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../viewmodel/recommend_view_model.dart';
import '../../../provider/provider_widget.dart';
import '../../../ui/helper/refresh_helper.dart';
import '../../../widget/custom_articles_item_widget.dart';

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
                        print("itemBuilder------$index");
                        return index == 0
                            ? BannersWidget()
                            : RecommendArticlesWidget();
                      },
                      separatorBuilder: (context, position) {
                        return Container(height: 15, color: Colors.transparent);
                      },
                      itemCount: 2)));
        });
  }
}

class BannersWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration:
            BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor),
        child:
            Consumer<RecommendViewModel>(builder: (_, recommendViewModel, __) {
          if (recommendViewModel.isLoading)
            return CupertinoActivityIndicator();
          else {
            var banners = recommendViewModel.banners ?? [];
            return Container(
                width: MediaQuery.of(context).size.width,
                height: 150.0,
                child: Swiper(
                    loop: true,
                    autoplay: true,
                    autoplayDelay: 5000,
                    pagination: SwiperPagination(),
                    itemCount: banners.length,
                    itemBuilder: (_, index) => InkWell(
                        onTap: () {
                          var banner = banners[index];
                          // Navigator.of(context).pushNamed(RouteName.articleDetail,
                          //     arguments: Article()
                          //       ..id = banner.id
                          //       ..title = banner.title
                          //       ..link = banner.url
                          //       ..collect = false);
                        },
                        child: Image.network(banners[index].imageUrl, fit: BoxFit.fill))));
          }
        }));
  }
}

class RecommendArticlesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //https://blog.csdn.net/codekxx/article/details/100887073
    //ListView头部有一段空白区域，是因为当ListView没有和AppBar一起使用时，头部会有一个padding，为了去掉padding，可以使用MediaQuery.removePadding
    return MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
            child: Consumer<RecommendViewModel>(
                builder: (_, recommendViewModel, __) {
              var articles = recommendViewModel.articles ?? [];
              return ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) =>
                      ArticleItemWidget(item: articles[index]),
                  separatorBuilder: (context, position) {
                    return Container(
                        height: 1,
                        color: Colors.lightBlue,
                        margin: EdgeInsets.only(left: 15.0, right: 15.0));
                  },
                  itemCount: articles.length);
            })));
  }
}
