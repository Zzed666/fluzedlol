import 'package:fluzedlol/model/article_model.dart';
import '../provider/provider_refresh_load_list_view_model.dart';

class RecommendViewModel extends ProviderRefreshLoadListViewModel {
  List<String> _banners;
  List<ArticleModel> _articles;

  List<String> get banners => _banners;

  List<ArticleModel> get articles => _articles;

  @override
  Future<List> loadData({int pageNum}) async {
    List<Future> futures = [];
    if (pageNum == ProviderRefreshLoadListViewModel.pageNumFirst) {
      futures.add(Future.delayed(Duration(seconds: 2), () {
        print("-----branners----");
        return List.generate(3, (index) => "banners $index");
      }));
      futures.add(Future.delayed(Duration(seconds: 2), () {
        print("-----articles----");
        return List.generate(
            3,
            (index) => ArticleModel(
                0,
                "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1570777609,559260948&fm=15&gp=0.jpg",
                "title",
                "提莫队长前来送命",
                "linkUrl"));
      }));
    }
    futures.add(Future.delayed(Duration(seconds: 2), () {
      print("-----another----");
      return List.generate(3, (index) => "another $index");
    }));
    var result = await Future.wait(futures);
    if (pageNum == ProviderRefreshLoadListViewModel.pageNumFirst) {
      _banners = result[0];
      _articles = result[1];

      ///按照顺序，Future的结果也就是result最后一个Future的结果(此处result有3个元素)
      return result[2];
    } else {
      ///按照顺序，Future的结果也就是result最后一个Future的结果(此处result有1个元素)
      return result[0];
    }
  }
}
