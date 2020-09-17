import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ehi_connect/core/services/demo_web_json_parser.dart';
import 'package:ehi_connect/core/utils/error_messages.dart';
import 'package:ehi_connect/core/utils/web_app_utils.dart';
import 'package:http/http.dart' as http;

int i = 0;

class NetworkManager {
  static const CONTENT_TYPE_JSON = "application/json";

  static const CONTENT_TYPE_IMAGE = "multipart/form-data";

  Future<Map<String, dynamic>> getPostResponse(String URL, String body) async {
    try {
      return await http.post(URL, body: body, headers: {
        "Content-Type": CONTENT_TYPE_JSON
      }).then((http.Response response) async {
        final int statusCode = response.statusCode;
        print("Response Value ${response.body}");
        print("statusCode>>>>>>>>>>${response.statusCode}");
        if (statusCode == 200) {
          Map<String, dynamic> jsonValue = json.decode(response.body);
          print("json value if>>>>>>>> $jsonValue");
          try {
            dynamic dResponse = jsonValue;
            if (getIsValid(dResponse) == false &&
                getMessage(dResponse) == "Session invalid/Expired".trim()) {
              //Catcher.navigatorKey.currentState.popUntil(ModalRoute.withName(Router.homeLogin));
            }
            return dResponse;
          } catch (e) {
            return json.decode(jsonValue.toString());
          }
        } else {
          Map<String, dynamic> jsonValue =
              json.decode(createErrorJsonString(statusCode));
          print("json value>>>>>>>> $jsonValue");
          return json.decode(jsonValue.toString());
        }
      });
    } on SocketException catch (_) {
      Map<String, dynamic> jsonValue =
          json.decode(createErrorJsonString(ErrorMessage.SOCKET_EXCEPTION));
      return json.decode(jsonValue.toString());
      ;
    }
  }

  Future<String> uploadImagePostMethod(
      String url,
      String body,
      String data,
      String formId,
      String flowId,
      String fileId,
      String fileName,
      String fileType) async {
    try {
      Response response;
      Dio dio = new Dio();
      FormData formData = new FormData.fromMap({
        'data': data,
        "flowID": flowId,
        "formID": formId,
        "filename": fileName,
        "filetype": fileType,
        "fileID": fileId,
        "SessionInfo": body
      });
      response = await dio.post(url, data: formData);
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  Future<Map<String, dynamic>> uploadImagePostMethods(
      String url,
      String body,
      String data,
      String formId,
      String flowId,
      String fileId,
      String fileName,
      String fileType) async {
    try {
      Response response;
      Dio dio = new Dio();
      FormData formData = new FormData.fromMap({
        'data': data,
        "flowID": flowId,
        "formID": formId,
        "filename": fileName,
        "filetype": fileType,
        "fileID": fileId,
        "SessionInfo": body
      });
      response = await dio.post(url, data: formData);
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  Future<http.Response> downloadHTML(
    String URL,
    String body,
  ) async {
    try {
      return await http.post(URL, headers: {'SessionInfo': body}).then(
          (http.Response response) async {
        final int statusCode = response.statusCode;

        print("Response Value ${response.body}");
        if (statusCode == 200) {
          return response;
        } else {
          dynamic jsonValue = json.decode(createErrorJsonString(statusCode));
          print("json value>>>>>>>> $jsonValue");
          return jsonValue;
        }
      });
    } on SocketException catch (_) {
      dynamic jsonValue =
          json.decode(createErrorJsonString(ErrorMessage.SOCKET_EXCEPTION));
      return jsonValue;
    }
  }

  Future<http.Response> downloadImagePostMethod(String URL, String body,
      String formId, String fileId, String flowId) async {
    try {
      return await http.post(URL, headers: {
        'formId': formId,
        'fileId': fileId,
        'flowId': flowId,
        'password': "false",
        'SessionInfo': body
      }).then((http.Response response) async {
        final int statusCode = response.statusCode;

        print("Response Value ${response.body}");
        if (statusCode == 200) {
          return response;
        } else {
          Map<String, dynamic> jsonValue =
              json.decode(createErrorJsonString(statusCode));
          print("json value>>>>>>>> $jsonValue");
          return json.decode(jsonValue.toString());
          ;
        }
      });
    } on SocketException catch (_) {
      Map<String, dynamic> jsonValue =
          json.decode(createErrorJsonString(ErrorMessage.SOCKET_EXCEPTION));
      return json.decode(jsonValue.toString());
    }
  }
}
