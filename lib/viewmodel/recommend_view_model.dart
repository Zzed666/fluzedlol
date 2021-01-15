import '../model/banner_model.dart';
import '../model/test_model.dart';
import '../model/article_model.dart';
import '../service/zed_lol_repository.dart';
import '../provider/provider_refresh_load_list_view_model.dart';

class RecommendViewModel extends ProviderRefreshLoadListViewModel {
  List<BannerModel> _banners;
  List<ArticleModel> _articles;

  List<BannerModel> get banners => _banners;

  List<ArticleModel> get articles => _articles;

  @override
  Future<List> loadData({int pageNum}) async {
    List<Future> futures = [];
    if (pageNum == ProviderRefreshLoadListViewModel.pageNumFirst) {
      // try {
      //   TestModel testModel = await ZedLolRepository.test();
      //   print("testModel:${testModel.accountAge},,,,${testModel.accountGender}");
      // } catch (e, s) {
      //   print("e:$e");
      // }

      futures.add(ZedLolRepository.fetchBanners());
      futures.add(ZedLolRepository.fetchArticles(pageNum));
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
