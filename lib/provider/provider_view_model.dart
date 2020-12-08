import 'package:flutter/material.dart';
import 'package:fluzedlol/provider/view_state.dart';

class ProviderViewModel with ChangeNotifier {
  /// 防止页面销毁后,异步任务才完成,导致报错
  bool _disposed = false;
  ViewState _viewState = ViewState.IDLE;
  ViewState get viewState => _viewState;
  ProviderViewModel({ViewState viewState})
      : _viewState = viewState ?? ViewState.IDLE {
    debugPrint('BaseProviderViewModel---constructor--->$runtimeType');
  }
  set viewState(ViewState viewState) {
    _viewState = viewState;
    notifyListeners();
  }

  /// 以下变量是为了代码书写方便,加入的get方法.严格意义上讲,并不严谨
  ///
  /// get
  bool get isLoading => viewState == ViewState.LOADING;

  bool get isIdle => viewState == ViewState.IDLE;

  bool get isEmpty => viewState == ViewState.EMPTY;

  bool get isError => viewState == ViewState.ERROR;

  bool get isSuccess => viewState == ViewState.SUCCESS;

  /// set
  void setIdle() {
    viewState = ViewState.IDLE;
  }

  void setLoading() {
    viewState = ViewState.LOADING;
  }

  void setEmpty() {
    viewState = ViewState.EMPTY;
  }

  void setSuccess() {
    viewState = ViewState.SUCCESS;
  }

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    _disposed = true;
    debugPrint('base_provider_view_model dispose -->$runtimeType');
    super.dispose();
  }
}