import 'package:fluzedlol/provider/provider_view_model.dart';

class LolMainViewModel extends ProviderViewModel {
  int bottomSelectIndex = 0;

  updateBottomSelectIndex(int index) {
    bottomSelectIndex = index;
    notifyListeners();
  }
}