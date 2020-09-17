import 'package:ehi_connect/core/request_model/create_request.dart';
import 'package:ehi_connect/core/services/api.dart';
import 'package:ehi_connect/core/services/webservice_urls.dart';

import '../../locator.dart';
import 'base_model.dart';

class InitialPageModel extends BaseModel {
  Api _api = locator<Api>();

  String errorMessage;

  String saltValue = "";

  Future<Map<String, dynamic>> searchUser(userId) async {
    var response;
    String requestString1 = await CreateRequest().userSearch(userId: userId);
    String URL = await getURL(GET_USER);
    print("Url:" + URL);
    print("Request Model:" + requestString1);
    response = await _api.restApi(URL, requestString1);
    print("Res" + response);
    return response;
  }
}
