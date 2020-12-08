import 'package:fluzedlol/viewmodel/locale_view_model.dart';
import 'package:fluzedlol/viewmodel/theme_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders
];

/// 独立的model
List<SingleChildWidget> independentServices = [
  ChangeNotifierProvider<ThemeViewModel>(
    create: (context) => ThemeViewModel(),
  ),
  ChangeNotifierProvider<LocaleViewModel>(
    create: (context) => LocaleViewModel(),
  ),
  // ChangeNotifierProvider<GlobalFavouriteStateModel>(
  //   create: (context) => GlobalFavouriteStateModel(),
  // )
];

/// 需要依赖的model
///
/// UserModel依赖globalFavouriteStateModel
List<SingleChildWidget> dependentServices = [
  // ChangeNotifierProxyProvider<GlobalFavouriteStateModel, UserModel>(
  //   create: null,
  //   update: (context, globalFavouriteStateModel, userModel) =>
  //   userModel ??
  //       UserModel(globalFavouriteStateModel: globalFavouriteStateModel),
  // )
];

List<SingleChildWidget> uiConsumableProviders = [
//  StreamProvider<User>(
//    builder: (context) => Provider.of<AuthenticationService>(context, listen: false).user,
//  )
];