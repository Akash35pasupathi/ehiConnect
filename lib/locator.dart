import 'package:ehi_connect/core/view_model/login_page_model.dart';
import 'package:get_it/get_it.dart';

import 'core/services/api.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() {
    return Api();
  });

  locator.registerFactory(() {
    return InitialPageModel();
  });
}
