import 'package:flutter/material.dart';
import '../widget/custom_anim_item_widget.dart';
import '../config/constant_manager.dart';
import '../model/article_model.dart';

class ArticleItemWidget extends StatelessWidget {
  final ArticleModel item;

  ArticleItemWidget({this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            border: Border.all(color: Colors.grey, width: 1.0)),
        margin: EdgeInsets.all(10.0),
        child: _itemWidget());
  }

  Widget _itemWidget() {
    if (item.type == Constants.articleItemOriginal)
      // return ArticleItemOriginalWidget(item: item);
      return CustomItemWithScaleItemWidget(
          itemWidget: ArticleItemOriginalWidget(item: item));
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
        color: Colors.white,
        constraints: BoxConstraints(maxHeight: 80),
        margin: EdgeInsets.all(10.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Container(
              width: 120,
              height: 80,
              margin: EdgeInsets.only(right: 10.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(item.imageThumbnail))),
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                Text(item.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    softWrap: true,
                    style: TextStyle(fontSize: 14.0)),
                Expanded(
                    flex: 1,
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(item.tag,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            softWrap: true,
                            style: TextStyle(fontSize: 10.0)))),
                Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          constraints: BoxConstraints(maxWidth: 80.0),
                          child: Text(item.authorName,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 12.0, color: Colors.grey))),
                      SizedBox(width: 10.0),
                      Icon(Icons.comment, size: 12.0, color: Colors.grey),
                      Text("${item.commentNum}", style: TextStyle(fontSize: 12.0, color: Colors.grey)),
                      SizedBox(width: 10.0),
                      Icon(Icons.thumb_up_outlined, size: 12.0, color: Colors.grey),
                      Text("${item.likeNum}", style: TextStyle(fontSize: 12.0, color: Colors.grey)),
                      Expanded(flex: 1, child: SizedBox(height: 0)),
                      Icon(Icons.favorite_outline_sharp,
                          size: 12.0, color: Colors.deepPurple)
                    ])
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
