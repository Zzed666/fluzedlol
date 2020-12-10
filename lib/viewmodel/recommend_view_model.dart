import 'package:fluzedlol/provider/provider_refresh_load_list_view_model.dart';
import 'package:fluzedlol/provider/provider_view_model.dart';

class RecommendViewModel extends ProviderRefreshLoadListViewModel {
  List<String> _banners;
  List<String> _articles;

  List<String> get banners => _banners;

  List<String> get articles => _articles;

  @override
  Future<List> loadData({int pageNum}) async{
    List<Future> futures = [];
    if (pageNum == ProviderRefreshLoadListViewModel.pageNumFirst) {
      futures.add(Future.delayed(Duration(seconds: 2),() {
        print("-----branners----");
        return List.generate(3, (index) => "banners $index");
      }));
      futures.add(Future.delayed(Duration(seconds: 2),() {
        print("-----articles----");
        return List.generate(3, (index) => "articles $index");
      }));
    }
    futures.add(Future.delayed(Duration(seconds: 2),() {
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