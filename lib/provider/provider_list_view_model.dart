import 'package:fluzedlol/provider/provider_view_model.dart';

abstract class ProviderListViewModel<T> extends ProviderViewModel {
  ///页面数据
  List<T> list = [];
  ///第一次进入界面
  initData() async {
    setLoading();
    await refresh(init: true);
  }
  ///下啦刷新
  refresh({bool init = false}) async {
    try {
      List<T> data = await loadData();
      if (data.isEmpty) {
        list.clear();
        setEmpty();
      } else {
        onCompleted(data);
        list.clear();
        list.addAll(data);
        setIdle();
      }
    } catch (e, s) {
      if (init) list.clear();
      // set(e, s);
    }
  }

  /// 加载数据
  Future<List<T>> loadData();

  onCompleted(List<T> data) {}
}