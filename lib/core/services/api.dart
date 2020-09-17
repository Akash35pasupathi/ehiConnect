import 'package:ehi_connect/core/services/network_manager.dart';
import 'package:http/http.dart' as http;

/// The service responsible for networking requests
class Api {
  var client = new http.Client();

  Future<Map<String, dynamic>> restApi(String url, String body) {
    return NetworkManager().getPostResponse(url, body);
  }

  Future<Map<String, dynamic>> uploadImageFile(
      String url,
      String body,
      String data,
      String formId,
      String flowId,
      String fileId,
      String fileName,
      String fileType) {
    return NetworkManager().uploadImagePostMethods(
        url, body, data, formId, flowId, fileId, fileName, fileType);
  }

  Future<String> uploadImage(
      String url,
      String body,
      String data,
      String formId,
      String flowId,
      String fileId,
      String fileName,
      String fileType) {
    return NetworkManager().uploadImagePostMethod(
        url, body, data, formId, flowId, fileId, fileName, fileType);
  }

  Future<http.Response> downloadImage(
      String url, String body, String flowId, String formId, String fileId) {
    return NetworkManager()
        .downloadImagePostMethod(url, body, formId, fileId, flowId);
  }
}
