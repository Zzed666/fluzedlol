import '../model/article_model.dart';
import '../model/banner_model.dart';
import '../model/test_model.dart';
import '../service/http.dart';

class ZedLolRepository {
  static Future test() async {
    var response = await http.get("/api/getMainAccountInfo",
        queryParameters: {"accountNumber": "111111111"});
    return TestModel.fromJson(response.data);
  }

  /// 获取首页推荐页的banner列表
  static Future fetchBanners() async {
    var response = await http
        .get("/api/fetchBanners");
    return response.data
        .map<BannerModel>((item) => BannerModel.fromJson(item))
        .toList();
  }

  /// 获取首页推荐页的文章列表
  static Future fetchArticles(int pageNum) async {
    var response = await http
        .get("/api/fetchArticles", queryParameters: {"pageNumber": pageNum});
    return response.data
        .map<ArticleModel>((item) => ArticleModel.fromJson(item))
        .toList();
  }
}
