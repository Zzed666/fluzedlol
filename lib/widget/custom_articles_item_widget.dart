import 'package:flutter/material.dart';
import '../config/constant_manager.dart';
import '../model/article_model.dart';

class ArticleItemWidget extends StatelessWidget {
  final ArticleModel item;

  ArticleItemWidget({this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(10.0),
        child: _itemWidget());
  }

  Widget _itemWidget() {
    if (item.type == Constants.articleItemOriginal)
      return ArticleItemOriginalWidget(item: item);
    else if (item.type == Constants.articleItemAd) return ArticleItemAdWidget();
    return SizedBox(width: 0.0);
  }
}

class ArticleItemOriginalWidget extends StatelessWidget {
  final ArticleModel item;

  ArticleItemOriginalWidget({this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pinkAccent,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  width: 80,
                  height: 80,
                  margin: EdgeInsets.only(right: 10.0),
                  child: Image.network(item.imageThumbnail)),
              Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    Text(item.content,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        softWrap: true,
                        style: TextStyle(fontSize: 14.0))
                  ]))
            ]));
  }
}

class ArticleItemAdWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
